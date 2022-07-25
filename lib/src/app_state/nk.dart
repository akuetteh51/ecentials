import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../BASEURL/BASEURL.dart';

class Nk extends ChangeNotifier {
  bool? _newPinCreationState = false;
  bool? get newPinCreationState => _newPinCreationState;

  void createPin({String? token, Map<String, dynamic>? dataToSend, BuildContext? context}) async {
    _newPinCreationState = true;
    notifyListeners();

    Dio dio = Dio();

    String path = APPBASEURL.BASEURL + "/api/v1/user/account/health-pin";

    Response response = await dio.post(path,
        data: dataToSend, options: Options(headers: {"auth-token": token}));

    /// Executes after the request is complete
    _newPinCreationState = false;
    notifyListeners();

    Navigator.of(context!)
        .push(MaterialPageRoute(builder: (builder) => Container()));

    print(response.toString());
  }
}
