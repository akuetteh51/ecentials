import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/UserDataModel.dart';
import '../BASEURL/BASEURL.dart';
import '../Widgets/EcentialsToast.dart';

class UserState extends ChangeNotifier {
  Map<String, dynamic>? _userInfo;
  Map<String, dynamic>? get userInfo => _userInfo;

  int _updateInfoLoaderState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get updateInfoLoaderState => _updateInfoLoaderState;

  int _fetchInfoLoaderState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get fetchInfoLoaderState => _fetchInfoLoaderState;

  UserDataModel? _userDataModel;
  UserDataModel? get userDataModel => _userDataModel;

  getStoreUserInfo() async {
    final prefs = await SharedPreferences.getInstance();

    String emptyUserInfo = json.encode({});

    final String state = prefs.getString('user_info') ?? emptyUserInfo;

    Map<String, dynamic> saveInfo = json.decode(state);

    log("LOCAL DATA: ${saveInfo.runtimeType}");

    _userInfo = saveInfo;

    log("INfo RUNTIME: ${userInfo.runtimeType}");

    notifyListeners();
  }

  void updateUserInfo(
      {Map<String, dynamic>? data, required String token}) async {
    _updateInfoLoaderState = 0;
    _updateInfoLoaderState = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/account/addEdit-personal-details";
    log("THE TKN: $token");
    try {
      Response response = await dio.post(path,
          data: data, options: Options(headers: {"auth-token": token}));
      if (response.statusCode == 200) {
        _updateInfoLoaderState = 2;
        notifyListeners();

        if (response.data['status'] == 200) {
          ShowToast.ecentialsToast(
            message: "${response.data['message']}",
            warn: false,
          );
        } else {
          ShowToast.ecentialsToast(
            message: "${response.data['message']}",
          );

          _updateInfoLoaderState = 0;
          notifyListeners();
        }
      } else {
        // If there was an error while making the request
        log("status: ${response.statusCode}");
        ShowToast.ecentialsToast(
          message: "There was an error while making the request",
        );

        _updateInfoLoaderState = 0;
        notifyListeners();
      }
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "There was an error while making the request",
      );
      _updateInfoLoaderState = 0;
      notifyListeners();
    }
  }

  // Get User Info
  Future<UserDataModel?> getUserInfoFromServer({required String? token}) async {
    _fetchInfoLoaderState = 0;
    _fetchInfoLoaderState = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/account/fetch-personal-details";

    try {
      // debugPrint("TKN: $token");
      Response response = await dio.get(path,
          options: Options(headers: {"auth-token": "$token"}));
      if (response.statusCode == 200) {
        _fetchInfoLoaderState = 2;
        notifyListeners();

        if (response.statusCode == 200) {
          log("ONLINE DATA: ${response.data}");
          var data = response.data['data']['personal'];         
          notifyListeners();
          
          return UserDataModel(
            name: data["name"] ?? "",
            address: data["address"] ?? "",
            email: data["email"] ?? "",
            gender: data["gender"] ?? "",
            occupation: data["occupation"] ?? "",
            phone: data["phone_number"] ?? "",
            dob: data["dob"] ?? "",
            height: data["height"] ?? 0,
            weight: data["weight"] ?? 0,
            ghana_card_number:data["ghana_card_number"] ?? "" 
          );
        } else {
          log("Status Not 200");
          ShowToast.ecentialsToast(
            message: "Error getting your data",
          );
          _fetchInfoLoaderState = 3;
          notifyListeners();
          return null;
        }
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "Error getting your data",
        );

        _fetchInfoLoaderState = 3;
        notifyListeners();
        return null;
      }
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error getting your data",
      );
      _fetchInfoLoaderState = 3;
      notifyListeners();
      return null;
    }
  }
}
