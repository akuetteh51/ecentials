import 'package:dio/dio.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';


import 'package:flutter/material.dart';


import '../BASEURL/BASEURL.dart';

class HospitalState extends ChangeNotifier {
  Hospital({
    String? token,
    Function? callback,
    Map<String, dynamic>? SearhData,
  }) async {
    print("debug");
    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/hospitals/search-for-hospital";

    print(token);
    try {
      Response response =
          await dio.post(path,data:SearhData,options: Options(headers: {"auth-token": token}));

      print(response.statusCode);
      print(response.data);

      if (response.statusCode == 200) {
        print("Search Hospital: ${response.data}");

        List Hospital = response.data['data'];
        notifyListeners();
        callback?.call();
        ShowToast.ecentialsToast(long: true,
        message: "$Hospital",
      );
        return Hospital;
      } else {
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error fetching data",
        );
      }
    } on DioError catch (e) {
      ShowToast.ecentialsToast(long: true,
        message: "${e.error}: Error making request.",
      );
    } catch (e) {
      print(e);
      ShowToast.ecentialsToast(long: true,
        message: "$e: Error making request",
      );
    }

    return [];
  }

  TopDoctor({
    String? token,
    Function? callback,
  }) async {
    Dio dio = Dio();

    String path =
        
        APPBASEURL.BASEURL + "/api/v1/hospital/staffs/fetch-top-doctors";

    try {
      Response response =
          await dio.get(path, options: Options(headers: {"auth-token": token}));

      if (response.statusCode == 200) {
        print(" Top doctor: ${response.data['data']}");

        List doctor = response.data['data'];
     

        notifyListeners();
        callback?.call();
           return doctor;
      } else {
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error fetching data",
        );
      }
    } catch (e) {
      print(e);
      ShowToast.ecentialsToast(
        message: "$e :Error making request",
      );
    }
  }
}
