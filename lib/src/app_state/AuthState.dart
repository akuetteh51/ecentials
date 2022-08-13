// ignore_for_file: unnecessary_import

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecentialsclone/src/BASEURL/BASEURL.dart';

import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/emailSuccess.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/login.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/reset.dart';
import 'package:flutter/material.dart';
//import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/UserScreens/main_screen.dart';

class AuthState extends ChangeNotifier {
  int _registerLoaderState = 0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get registerLoaderState => _registerLoaderState;

  int _loginLoaderState = 0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get loginLoaderState => _loginLoaderState;

  int _resetPasswordLoaderState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get resetPasswordLoaderState => _resetPasswordLoaderState;

  int _sendResetEmailLoader =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get sendResetEmailLoader => _sendResetEmailLoader;

  int _verifyingResetCode = 0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get verifyingResetCode => _verifyingResetCode;

  void registerNewUser(
      {Map<String, dynamic>? data, required BuildContext context}) async {
    _registerLoaderState = 0;
    _registerLoaderState = 1;
    notifyListeners();

    Dio dio = Dio();

    String path = APPBASEURL.BASEURL + "/api/v1/user/register";

    try {
      Response response = await dio.post(path, data: data);
      if (response.statusCode == 200) {
        _registerLoaderState = 2;
        notifyListeners();

        if (response.data['status'] == 200 &&
            response.data['message'] == "User created successfully") {
          ShowToast.ecentialsToast(
            message: "${response.data['message']}",
            warn: false,
          );

          // Go to the Login screen
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (builder) => Login()),
              (route) => false);
        } else {
          ShowToast.ecentialsToast(
            message: "${response.data['message']}",
          );

          _resetPasswordLoaderState = 3;
          notifyListeners();
        }
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "There was an error while making the request",
        );

        _registerLoaderState = 3;
        notifyListeners();
      }
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "There was an error while making the request",
      );
      _registerLoaderState = 3;
      notifyListeners();
    }
  }

  // Method to login a user and move home
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

          saveUserInfo(encodedStringForLocalStorage).then((value) {
            // Save that this user has logged in
            saveLoginSuccessState(true);

            // Go to the Main Screen
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (builder) => const MainScreen()),
                (route) => false);

            ShowToast.ecentialsToast(
              message: "Login Successful",
              warn: false,
            );
          });
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

  // Method to reset Password
  void resetUserPassword(
      {Map<String, dynamic>? data, required BuildContext context}) async {
    _resetPasswordLoaderState = 0;
    _resetPasswordLoaderState = 1;
    notifyListeners();

    Dio dio = Dio();
    String path = APPBASEURL.BASEURL + "/api/v1/user/reset-password";

    try {
      Response response = await dio.post(path, data: data);
      if (response.statusCode == 200) {
        _resetPasswordLoaderState = 2;
        notifyListeners();

        if (response.statusCode == 200) {
          log("DATA: ${response.data}");
          // Go to the Login screen
          if (response.data['status'].toString() == "200" &&
              response.data['message'] == "Password reset completed") {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (builder) => Login()),
                (route) => false);
            ShowToast.ecentialsToast(
              message: "Password Reset Successful",
              warn: false,
            );
          } else {
            ShowToast.ecentialsToast(
              message: "Reset NOT Successful",
            );
          }
        } else {
          ShowToast.ecentialsToast(
            message: "Password Reset Failed",
          );
        }
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "There was an error while making request",
        );

        _resetPasswordLoaderState = 3;
        notifyListeners();
      }
    } catch (e) {
      // log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "There was an error while making request",
      );
      _resetPasswordLoaderState = 3;
      notifyListeners();
    }
  }

  // Send an sms code to the user in his email to verify that it's them
  sendPasswordResetCode(
      {BuildContext? context,
      Map<String, dynamic>? data,
      String email = ""}) async {
    _sendResetEmailLoader = 0;
    _sendResetEmailLoader = 1;
    notifyListeners();

    Dio dio = Dio();
    String path = APPBASEURL.BASEURL + "/api/v1/user/recover_password";

    try {
      Response response = await dio.post(path, data: data);
      if (response.statusCode == 200) {
        _sendResetEmailLoader = 2;
        notifyListeners();

        // log("Status code: ${response.statusCode}");
        // log("Data: ${response.data}");

        if (response.statusCode == 200) {
          // Go to the Page For Code
          Navigator.of(context!).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (builder) => EmailSuccess(
                        email: email,
                      )),
              (route) => false);

          ShowToast.ecentialsToast(
            message: "Email Sent",
            warn: false,
          );
        } else {
          ShowToast.ecentialsToast(
            message: "Could not verify email now",
          );
          _sendResetEmailLoader = 0;
          notifyListeners();
        }
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "There was an error while making the request",
        );

        _sendResetEmailLoader = 0;
        notifyListeners();
      }
    } catch (e) {
      // log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "There was an error while making the request",
      );
      _loginLoaderState = 0;
      notifyListeners();
    }
  }

  // Verify The Code that was sent to the user
  verifyPasswordResetCode(
      {BuildContext? context,
      Map<String, dynamic>? data,
      required String email}) async {
    _verifyingResetCode = 0;
    _verifyingResetCode = 1;
    notifyListeners();

    Dio dio = Dio();
    String path = APPBASEURL.BASEURL + "/api/v1/user/verify_code";

    try {
      Response response = await dio.post(path, data: data);
      if (response.statusCode == 200) {
        _verifyingResetCode = 2;
        notifyListeners();

        if (response.statusCode == 200) {
          // Go to the Page For Code
          if (response.data['message'] == "success") {
            Navigator.of(context!).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (builder) => PasswordReset(
                          email: email,
                        )),
                (route) => false);
            ShowToast.ecentialsToast(
              message: "Code Verified",
              warn: false,
            );
          } else {
            ShowToast.ecentialsToast(
              message: "Code Incorrect",
            );
          }
        } else {
          ShowToast.ecentialsToast(
            message: "Could not verify reset code",
          );
          _verifyingResetCode = 0;
          notifyListeners();
        }
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "There was an error while making the request",
        );

        _verifyingResetCode = 0;
        notifyListeners();
      }
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "There was an error while making the request",
      );
      _verifyingResetCode = 0;
      notifyListeners();
    }
  }

  void saveLoginSuccessState(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('logged-in', value);
  }

  Future<bool> saveUserInfo(String value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('user_info', value);

    return true;
  }

  // Update Local Data
   updateSavedUserInfo(
      {Map<String, dynamic>? value, String? email, String? nameOf}) async {
    final prefs = await SharedPreferences.getInstance();
    Map<String, dynamic>? settValue = value;

    if (email != null) {
      settValue?['email'] = email;
    }
    if (nameOf != null) {
      settValue?['name'] = nameOf;
    }

    String valueEncoded = json.encode(settValue);

    prefs.setString('user_info', valueEncoded);

  }

  Future<bool> getLoginState() async {
    final prefs = await SharedPreferences.getInstance();

    final bool state = prefs.getBool('logged-in') ?? false;

    return state;
  }

  Future<bool> getWalkThroughPass() async {
    final prefs = await SharedPreferences.getInstance();

    final bool state = prefs.getBool('done_walkthrough') ?? false;

    return state;
  }

  void saveWalkthroughPass(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('done_walkthrough', value);
  }
}
