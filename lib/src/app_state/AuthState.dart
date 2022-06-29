import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecentialsclone/src/BASEURL/BASEURL.dart';
import 'package:flutter/foundation.dart';

class AuthState extends ChangeNotifier {
  int _loginLoaderState = 0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get loaderState => _loginLoaderState;

  void registerNewUser() async {
    _loginLoaderState = 0;
    _loginLoaderState = 1;
    Dio dio = Dio();

    Map<String, dynamic> body = {
    "email": "kumi@gmail.com",
    "password": "oneKumi2016#"
    };
    
    String path = APPBASEURL.BASEURL;

    try {
      Response response = await dio.post(path, data: body);
      if (response.statusCode == 200) {
        _loginLoaderState = 2;
        notifyListeners();
      } else {
        // There was an error from the server
        _loginLoaderState = 3;
        notifyListeners();
      }
    } catch (e) {
      log("There was an Error");
    }
  }
}
