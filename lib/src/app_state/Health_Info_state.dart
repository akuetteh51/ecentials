import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ecentialsclone/src/screens/UserScreens/Home/Wallet/useCardWallet.dart';

import '../BASEURL/BASEURL.dart';
import '../Widgets/EcentialsToast.dart';
import '../screens/UserScreens/Store/PinVerfication.dart';

class HealthInformationState extends ChangeNotifier {
  bool? _pinCreationState = false;
  bool? get pinCreationState => _pinCreationState;

  bool? _pinUpdateState = false;
  bool? get pinUpdateState => _pinUpdateState;

  int _loginLoaderState = 0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get loginLoaderState => _loginLoaderState;

  void createPin({
    String? token,
    Map<String, dynamic>? dataToSend,
    BuildContext? context,
    required List<String> actions,
    Function? callback,
  }) async {
    _pinCreationState = true;
    notifyListeners();

    Dio dio = Dio();

    String path = APPBASEURL.BASEURL + "/api/v1/user/account/health-pin";

    try {
      Response response = await dio.post(path,
          data: dataToSend, options: Options(headers: {"auth-token": token}));

      if (response.statusCode == 200) {
        _pinCreationState = false;
        notifyListeners();
        log("DAta: ${response.data}");
        if (response.data['message'] != "Invalid") {
          ShowToast.ecentialsToast(
              message: "${response.data['message']}", warn: false, long: true);
          callback?.call();
        } else {
          ShowToast.ecentialsToast(
            message: "Error ${actions[0]} pin",
          );
        }
      } else {
        _pinCreationState = false;
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error ${actions[0]} pin",
        );
      }
    } catch (e) {
      _pinCreationState = false;
      notifyListeners();
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error making request",
      );
      // log(e);
    }
  }


  void resetHealthPin({
    String? token,
    Map<String, dynamic>? dataToSend,
    Function? callback,
  }) async {
    _pinUpdateState = true;
    notifyListeners();

    Dio dio = Dio();

    String path = APPBASEURL.BASEURL + "/api/v1/user/account/reset-health-pin";

    try {
      Response response = await dio.post(path,
          data: dataToSend, options: Options(headers: {"auth-token": token}));

      if (response.statusCode == 200) {
        _pinUpdateState = false;
        notifyListeners();

          ShowToast.ecentialsToast(
              message: "Pin updated succefully", warn: false, long: true);
          callback?.call();
        
      } else {
        _pinUpdateState = false;
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error updating pin",
        );
      }
    } catch (e) {
      _pinUpdateState = false;
      notifyListeners();
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error making request",
      );
    }
  }

  Future<String> getHealthPinLocally() async {
    final prefs = await SharedPreferences.getInstance();

    final String pin = prefs.getString('health_pin_local') ?? "";

    return pin;
  }

  void saveHealthPinLocally(String value) async {
    final prefs = await SharedPreferences.getInstance();
    log("seeting new string $value");
    await prefs.setString('health_pin_local', value);
  }

  // Method to verify User Before giving them access to reset password
  void loginUser(
      {Map<String, dynamic>? data, required BuildContext context}) async {
    _loginLoaderState = 0;
    _loginLoaderState = 1;
    notifyListeners();

    Dio dio = Dio();
    String path = APPBASEURL.BASEURL + "/api/v1/user/login";

    try {
      Response response = await dio.post(path, data: data);
      if (response.statusCode == 200) {
        _loginLoaderState = 2;
        notifyListeners();

        if (response.statusCode == 200 && response.data['id'] != null) {
          String encodedStringForLocalStorage = json.encode(response.data);

          // Go to the Main Screen
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (builder) => const PinCheck()),
          );

          ShowToast.ecentialsToast(
            message: "Login Successful",
            warn: false,
          );
        } else {
          ShowToast.ecentialsToast(
            message: "Incorrect username / password",
          );
          _loginLoaderState = 3;
          notifyListeners();
        }
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "There was an error while making the request",
        );

        _loginLoaderState = 3;
        notifyListeners();
      }
    } catch (e) {
      // log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "There was an error while making the request",
      );
      _loginLoaderState = 3;
      notifyListeners();
    }
  }
}
