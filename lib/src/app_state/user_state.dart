import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecentialsclone/models/UserEducationModel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/UserDataModel.dart';
import '../BASEURL/BASEURL.dart';
import '../Widgets/EcentialsToast.dart';

class UserState extends ChangeNotifier {
  Map<String, dynamic>? _userInfo;
  Map<String, dynamic>? get userInfo =>
      _userInfo; //{"token":"hvhjf"} => userInfo['token']

  int _updateInfoLoaderState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get updateInfoLoaderState => _updateInfoLoaderState;

  int _fetchInfoLoaderState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get fetchInfoLoaderState => _fetchInfoLoaderState;

  int _addingEducationState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get addingEducationState => _addingEducationState;

  int _gettingEducationState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get gettingEducationState => _gettingEducationState;

  int _updateEducationState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get updateEducationState => _updateEducationState;

  int _deletingEducationState =
      0; // 0 = nothing, 1 = loading, 2= okay, 3 = failed
  int get deletingEducationState => _deletingEducationState;

  UserDataModel? _userDataModel;
  UserDataModel? get userDataModel => _userDataModel;

  List<UserEducationModel>? _userEducation = [];
  List<UserEducationModel>? get userEducation => _userEducation;

  getStoreUserInfo() async {
    final prefs = await SharedPreferences.getInstance();

    String emptyUserInfo = json.encode({});

    final String state = prefs.getString('user_info') ?? emptyUserInfo;

    Map<String, dynamic> saveInfo = json.decode(state);

    log("LOCAL DATA: $saveInfo");

    _userInfo = saveInfo;

    // log("INfo RUNTIME: ${userInfo.runtimeType}");

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
        // log("status: ${response.statusCode}");
        ShowToast.ecentialsToast(
          message: "There was an error while making the request",
        );

        _updateInfoLoaderState = 0;
        notifyListeners();
      }
    } catch (e) {
      // log("There was an Error: $e");
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

        log("ONLINE DATA: ${response.data}");
        var data = response.data['data']['personal'];
        _userDataModel = UserDataModel(
            name: data["name"] ?? "",
            address: data["address"] ?? "",
            email: data["email"] ?? "",
            gender: data["gender"] ?? "",
            occupation: data["occupation"] ?? "",
            phone: data["phone_number"] ?? "",
            dob: data["dob"] ?? "",
            height: data["height"] ?? 0,
            weight: data["weight"] ?? 0,
            ghana_card_number: data["ghana_card_number"] ?? "");
        // log("loder State: $fetchInfoLoaderState");
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
            ghana_card_number: data["ghana_card_number"] ?? "");
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
      // log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error getting your data",
      );
      _fetchInfoLoaderState = 3;
      notifyListeners();
      return null;
    }
  }

  // add Educational Infromation of user
  addEducation(
      {required String token,
      required Map<String, dynamic> data,
      required Function? getNewData}) async {
    _addingEducationState = 0;
    _addingEducationState = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/account/add-school-details";

    try {
      // debugPrint("TKN: $token");
      Response response = await dio.post(path,
          options: Options(headers: {"auth-token": token}), data: data);
      if (response.statusCode == 200 && response.data['status'] == 200) {
        _addingEducationState = 2;
        notifyListeners();
        log("RES: ${response.data}");
        ShowToast.ecentialsToast(
          message: "Added successfully",
          warn: false,
        );
        getx.navigator?.pop();
        getNewData?.call();
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "${response.data['message']}",
        );

        _addingEducationState = 3;
        notifyListeners();
        return null;
      }
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error adding your data",
      );
      _addingEducationState = 3;
      notifyListeners();
      return null;
    }
  }

  // get the educational informaion
  getEducation({required String? token}) async {
    _gettingEducationState = 0;
    _gettingEducationState = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/account/fetch-school-details";

    try {
      // debugPrint("TKN: $token");
      Response response = await dio.get(path,
          options: Options(headers: {"auth-token": "$token"}));
      if (response.statusCode == 200 &&
          response.data['status'].toString() == "200") {
        _gettingEducationState = 2;
        notifyListeners();

        log("EDU DATA: ${response.data}");
        _userEducation?.clear();
        List schools = response.data['data'] ?? [];

        for (int j = 0; j <= schools.length - 1; j++) {
          _userEducation?.add(UserEducationModel(
            school_name: schools[j]['school_name'] ?? "",
            course: schools[j]['course'] ?? "",
            duration: schools[j]['duration'] ?? "",
            user_id: "",
            id: schools[j]['_id'] ?? "",
            highest_level: schools[j]['highest_level'] ?? "",
          ));
        }
        notifyListeners();
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "Error getting your data",
        );

        _gettingEducationState = 3;
        notifyListeners();
        return null;
      }
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error getting your data",
      );
      _gettingEducationState = 3;
      notifyListeners();
      return null;
    }
  }

  // Update a particular educational informaion
  updateEducationalInformation(
      {required String? token,
      Map<String, dynamic>? data,
      required Function? getNewData}) async {
    _updateEducationState = 0;
    _updateEducationState = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/account/edit-school-details";

    try {
      // debugPrint("TKN: $token");
      Response response = await dio.post(path,
          data: data, options: Options(headers: {"auth-token": "$token"}));
      if (response.statusCode == 200 &&
          response.data['message'] == "Educational Info updated successfully") {
        _updateEducationState = 2;
        notifyListeners();

        log("Update Edu DATA: ${response.data}");
        log("Datat to Up: $data");
        ShowToast.ecentialsToast(
          message: "Error updating your data",
          warn: false,
        );
        getx.navigator?.pop();
        getNewData?.call();
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "Error updating your data",
        );

        _updateEducationState = 3;
        notifyListeners();
        return null;
      }
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error updating your data",
      );
      _updateEducationState = 3;
      notifyListeners();
      return null;
    }
  }

  // Delete a particular educational informaion
  deleteEducationalInformation(
      {required String? token,
      Map<String, dynamic>? data,
      required Function? getNewData}) async {
    _deletingEducationState = 0;
    _deletingEducationState = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/account/delete-school-details";

    try {
      // debugPrint("TKN: $token");
      Response response = await dio.delete(path,
          data: data, options: Options(headers: {"auth-token": "$token"}));
      if (response.statusCode == 200) {
        _deletingEducationState = 2;
        notifyListeners();

        log("DELETED Edu DATA: ${response.data}");
        ShowToast.ecentialsToast(
          message: "Error deleting your data",
          warn: false,
        );
        getx.navigator?.pop();
        getNewData?.call();
      } else {
        // If there was an error while making the request
        ShowToast.ecentialsToast(
          message: "Error deleting your data",
        );

        _deletingEducationState = 3;
        notifyListeners();
        return null;
      }
    } catch (e) {
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error deleting your data",
      );
      _deletingEducationState = 3;
      notifyListeners();
      return null;
    }
  }

  Future<int> uploadPrescription(
      {required String? token,
      required File? picture,
      required String store_id}) async {
    Dio dio = Dio();
    String path = APPBASEURL.BASEURL + "/api/v1/prescriptions/new-prescription";

    String fileName = picture!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "store_id": store_id,
      "picture": await MultipartFile.fromFile(picture.path, filename: fileName),
    });

    try {
      Response response = await dio.post(path,
          data: formData, options: Options(headers: {"auth-token": token}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 2;
      } else {
        ShowToast.ecentialsToast(
          message: "Error scanning prescription",
        );
        return 3;
      }
    } catch (e) {
      print("Error: ${e}");
      ShowToast.ecentialsToast(
        message: "Error uploading prescription",
      );
      return 3;
    }
  }

  setFetchInfoLoaderState(int value) {
    _fetchInfoLoaderState = value;
    notifyListeners();
  }
}
