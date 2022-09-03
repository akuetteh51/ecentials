import 'package:dio/dio.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../BASEURL/BASEURL.dart';

class HospitalState extends ChangeNotifier {
  Hospital({
    String? token,
    Function? callback,
  }) async {
    print("debug");
    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/hospital/staffs/fetch-top-doctors";

    print(token);
    try {
      Response response =
          await dio.get(path, options: Options(headers: {"auth-token": token}));

      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        print("Search Hospital: ${response.data}");

        List Hospital = response.data['data'];
        notifyListeners();
        callback?.call();
        return Hospital;
      } else {
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error fetching data",
        );
      }
    } catch (e) {
      print(e);
      ShowToast.ecentialsToast(
        message: "Error making request",
      );
    }
  }

  TopDoctor({
    String? token,
    Function? callback,
  }) async {
    Dio dio = Dio();
// add-new-hospital
    // String path =
    // APPBASEURL.BASEURL + "/api/v1/pharmacy/drugs/list-popular-drugs";
    String path =
        // APPBASEURL.BASEURL + "/hospital/staffs/fetch-top-doctors";
        APPBASEURL.BASEURL + "/api/v1/hospital/staffs/fetch-top-doctors";

    try {
      Response response =
          await dio.get(path, options: Options(headers: {"auth-token": token}));

      if (response.statusCode == 200) {
        print(" Top doctor: ${response.data['data']}");

        List doctor = response.data['data'];
        return doctor;
        print(doctor);

        notifyListeners();
        callback?.call();
      } else {
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error fetching data",
        );
      }
    } catch (e) {
      print(e);
      ShowToast.ecentialsToast(
        message: "Error making request",
      );
    }
  }
}
            //     ${hospitalState.Hospital(
            //   token: userState.userInfo?['token'],
            // ),
