import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../BASEURL/BASEURL.dart';
import '../Widgets/EcentialsToast.dart';

class UserState extends ChangeNotifier {
  Map<String, dynamic>? _userInfo;
  Map<String, dynamic>? get userInfo => _userInfo;

  int _updateInfoLoaderState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get updateInfoLoaderState => _updateInfoLoaderState;

  getStoreUserInfo() async {
    final prefs = await SharedPreferences.getInstance();

    String emptyUserInfo = json.encode({});

    final String state = prefs.getString('user_info') ?? emptyUserInfo;

    Map<String, dynamic> saveInfo = json.decode(state);

    log("LOCAL DATA: $saveInfo");

    _userInfo = saveInfo;

    notifyListeners();
  }

  void updateUserInfo({Map<String, dynamic>? data}) async {
    _updateInfoLoaderState = 0;
    _updateInfoLoaderState = 1;
    notifyListeners();

    Dio dio = Dio();

    String path = APPBASEURL.BASEURL + "/api/v1/user/addEdit-personal-details";

    try {
      Response response = await dio.post(path, data: data);
      if (response.statusCode == 200) {
        _updateInfoLoaderState = 2;
        notifyListeners();

        if (response.data['status'] == 200) {
          // ShowToast.ecentialsToast(
          //   message: "${response.data['message']}",
          //   warn: false,
          // );

        } else {
          ShowToast.ecentialsToast(
            message: "${response.data['message']}",
          );

          _updateInfoLoaderState = 3;
          notifyListeners();
        }
      } else {
        // If there was an error while making the request
        log("status: ${response.statusCode}");
        ShowToast.ecentialsToast(
          message: "There was an error while making the request",
        );

        _updateInfoLoaderState = 3;
        notifyListeners();
      }
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "There was an error while making the request",
      );
      _updateInfoLoaderState = 3;
      notifyListeners();
    }
  }
}
