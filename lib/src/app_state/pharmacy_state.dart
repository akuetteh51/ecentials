import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:flutter/material.dart';

import '../../models/AllPharmaciePreview.dart';
import '../../models/PopularDrugs.dart';
import '../BASEURL/BASEURL.dart';

class PharmacyState extends ChangeNotifier {
  int _fetchingPharmaciesPreview = 0;
  int get fetchingPharmaciesPreview => _fetchingPharmaciesPreview;

  int _fetchPopularDrugs = 0;
  int get fetchPopularDrugs => _fetchPopularDrugs;

  int _bookmarkingDrugState = 0;
  int get bookmarkingDrugState => _bookmarkingDrugState;

  int _gettingUserFavoritePharmacies = 0;
  int get gettingUserFavoritePharmacies => _gettingUserFavoritePharmacies;

  List<AllPharmaciesPreview> _allPharmacyPreviews = [];
  List<AllPharmaciesPreview> get allPharmacyPreviews => _allPharmacyPreviews;

  List<PopularPharmacy> _allPopularDrugs = [];
  List<PopularPharmacy> get allPopularDrugs => _allPopularDrugs;

  List<int> _pharmacyBookmarkingIndexes = [];
  List<int> get pharmacyBookmarkingIndexes => _pharmacyBookmarkingIndexes;


  // Fetch all pharmacies available
  fetchPharmaciesPreview({
    String? token,
    Function? callback,
  }) async {
    _fetchingPharmaciesPreview = 0;
    _fetchingPharmaciesPreview = 1;
    notifyListeners();

    Dio dio = Dio();

    String path = APPBASEURL.BASEURL + "/api/v1/pharmacies";

    try {
      Response response =
          await dio.get(path, options: Options(headers: {"auth-token": token}));

      if (response.statusCode == 200) {
        _fetchingPharmaciesPreview = 2;
        notifyListeners();

        // log("All Pharmacies: ${response.data}");
        // _fetchingPharmaciesPreview = response.data['data'];
        List pharmacyData = response.data['data'];

        for (int pharm = 0; pharm < pharmacyData.length; pharm++) {
          _allPharmacyPreviews
              .add(AllPharmaciesPreview.fromJson(pharmacyData[pharm]));
        }
        notifyListeners();

        // ShowToast.ecentialsToast(
        //     message: "Pin updated succefully", warn: false, long: true);
        callback?.call();
      } else {
        _fetchingPharmaciesPreview = 3;
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error fetching data",
        );
      }
    } catch (e) {
      _fetchingPharmaciesPreview = 3;
      notifyListeners();
      // log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error making request",
      );
    }
  }


  // Get all popular drugs
  getPopularDrugs({
    String? token,
    Function? callback,
  }) async {
    _fetchPopularDrugs = 0;
    _fetchPopularDrugs = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/pharmacy/drugs/list-popular-drugs";

    try {
      Response response =
          await dio.get(path, options: Options(headers: {"auth-token": token}));

      if (response.statusCode == 200) {
        _fetchPopularDrugs = 2;
        notifyListeners();

        // log("Poular Drugs: ${response.data}");
        // _fetchPopularDrugs = response.data['message']['health'];
        List popular = response.data['data'];

        for (int drug = 0; drug < popular.length; drug++) {
          _allPopularDrugs.add(PopularPharmacy.fromJson(popular[drug]));
        }

        notifyListeners();

        // ShowToast.ecentialsToast(
        //     message: "Pin updated succefully", warn: false, long: true);
        callback?.call();
      } else {
        _fetchPopularDrugs = 3;
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error fetching data",
        );
      }
    } catch (e) {
      _fetchPopularDrugs = 3;
      notifyListeners();
      // log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "Error making request",
      );
    }
  }


  // Bookmark a pharmacy
  bookmarkPharmacy(
      {String? token, required int index, required String itemId}) async {
    _bookmarkingDrugState = 0;
    _bookmarkingDrugState = 1;
    notifyListeners();

    Dio dio = Dio();

    Map<String, dynamic> requestData = {
      "bookmark_type": "pharmacy",
      "item_id": itemId,
    };

    log("Bookmark ID: $requestData");

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/bookmarks/add-new-bookmark-item";

    try {
      _pharmacyBookmarkingIndexes.add(index);
      Response response = await dio.post(path,
          options: Options(headers: {"auth-token": token}), data: requestData);

      if (response.statusCode == 200) {
        _bookmarkingDrugState = 2;
        notifyListeners();

        ShowToast.ecentialsToast(
          message: "Bookmarked",
          warn: false,
        );
        _pharmacyBookmarkingIndexes.remove(index);
      } else {
        log("fail 2: ${response.data}");
        _bookmarkingDrugState = 3;
        _pharmacyBookmarkingIndexes.remove(index);
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "action failed",
        );
      }
    } catch (e) {
      _bookmarkingDrugState = 3;
      _pharmacyBookmarkingIndexes.remove(index);
      notifyListeners();
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "action failed",
      );
    }
  }


  // Get the favorite Pharmacies for this user
  getFavoritePharmacies(
      {required String? token}) async {
    _gettingUserFavoritePharmacies = 0;
    _gettingUserFavoritePharmacies = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/favourites";

    try {
      Response response = await dio.get(path, options: Options(headers: {"auth-token": token}),);

      if (response.statusCode == 200) {
        _gettingUserFavoritePharmacies = 2;
        notifyListeners();

      } else {
        _gettingUserFavoritePharmacies = 3;
        notifyListeners();       
      }
    } catch (e) {
      _gettingUserFavoritePharmacies = 3;
      notifyListeners();     
    }
  }

  setPharmyBookmarkingIndexToEmpty() {
    _pharmacyBookmarkingIndexes = [];
    notifyListeners();
  }
}
