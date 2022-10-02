import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:ecentialsclone/src/app_state/AuthState.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../BASEURL/BASEURL.dart';

class Nk extends ChangeNotifier {
  bool? _newPinCreationState = false;
  bool? get newPinCreationState => _newPinCreationState;

  void createPin(
      {String? token,
      Map<String, dynamic>? dataToSend,
      BuildContext? context}) async {
    _newPinCreationState = true;
    notifyListeners();

    Dio dio = Dio();

    String path = APPBASEURL.BASEURL + "/api/v1/user/account/health-pin";

    try {
      Response response = await dio.post(path,
          data: dataToSend, options: Options(headers: {"auth-token": token}));
      _newPinCreationState = false;
      notifyListeners();
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error getting uploading data",
      );
      print(e);
    }
  }
}
