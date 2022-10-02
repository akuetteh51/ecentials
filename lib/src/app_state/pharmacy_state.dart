import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecentialsclone/models/CartItemModel.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:ecentialsclone/src/app_state/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/AllPharmaciePreview.dart';
import '../../models/PopularDrugs.dart';
import '../BASEURL/BASEURL.dart';

class PharmacyState extends ChangeNotifier {
  int _fetchingPharmaciesPreview = 0;
  int get fetchingPharmaciesPreview => _fetchingPharmaciesPreview;

  int _fetchPopularDrugs = 0;
  int get fetchPopularDrugs => _fetchPopularDrugs;

  int _bookmarkingPharmacyState = 0;
  int get bookmarkingPharmacyState => _bookmarkingPharmacyState;

  // int _bookmarkingDrugState = 0;
  // int get bookmarkingDrugState => _bookmarkingDrugState;

  int _gettingUserFavoritePharmacies = 0;
  int get gettingUserFavoritePharmacies => _gettingUserFavoritePharmacies;

  int _searchingPharmacies = 0;
  int get searchingPharmacies => _searchingPharmacies;
  int _searchingDrugs = 0;
  int get searchingDrugs => _searchingDrugs;

  int _fetchingBookmarkedDrugs = 0;
  int get fetchingBookmarkedDrugs => _fetchingBookmarkedDrugs;

  List<AllPharmaciesPreview> _allPharmacyPreviews = [];
  List<AllPharmaciesPreview> get allPharmacyPreviews => _allPharmacyPreviews;

  List<PopularPharmacy> _allPopularDrugs = [];
  List<PopularPharmacy> get allPopularDrugs => _allPopularDrugs;

  List<int> _pharmacyBookmarkingIndexes = [];
  List<int> get pharmacyBookmarkingIndexes => _pharmacyBookmarkingIndexes;

  List<String> _bookmarkedDrugs = [];
  List<String> get bookmarkedDrugs => _bookmarkedDrugs;

  List _userFAVpharmacies = [];
  List get userFAVpharmacies => _userFAVpharmacies;

  List<AllPharmaciesPreview> _pharmacySearchResults = [];
  List<AllPharmaciesPreview> get pharmacySearchResults =>
      _pharmacySearchResults;
  List<PopularPharmacy> _generalDrugSearchResults = [];
  List<PopularPharmacy> get generalDrugSearchResults =>
      _generalDrugSearchResults;

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
        _allPharmacyPreviews = [];
        // log("All Pharmacies: ${response.data}");
        // _fetchingPharmaciesPreview = response.data['data'];
        List pharmacyData = response.data['data'];

        for (int pharm = 0; pharm < pharmacyData.length; pharm++) {
          _allPharmacyPreviews
              .add(AllPharmaciesPreview.fromJson(pharmacyData[pharm]));
        }
        _fetchingPharmaciesPreview = 2;
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
        _allPopularDrugs = [];
        // log("Poular Drugs: ${response.data}");
        // _fetchPopularDrugs = response.data['message']['health'];
        List popular = response.data['data'];

        for (int drug = 0; drug < popular.length; drug++) {
          _allPopularDrugs.add(PopularPharmacy.fromJson(popular[drug]));
          _fetchPopularDrugs = 2;
          notifyListeners();
        }

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
    _bookmarkingPharmacyState = 0;
    _bookmarkingPharmacyState = 1;
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
        _bookmarkingPharmacyState = 2;
        notifyListeners();

        ShowToast.ecentialsToast(
          message: "Bookmarked",
          warn: false,
        );
        _pharmacyBookmarkingIndexes.remove(index);
        getFavoritePharmacies(token: token);
      } else {
        log("fail 2: ${response.data}");
        _bookmarkingPharmacyState = 3;
        _pharmacyBookmarkingIndexes.remove(index);
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "action failed",
        );
      }
    } catch (e) {
      _bookmarkingPharmacyState = 3;
      _pharmacyBookmarkingIndexes.remove(index);
      notifyListeners();
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: "action failed",
      );
    }
  }

  // Get the favorite Pharmacies for this user
  getFavoritePharmacies({required String? token}) async {
    _gettingUserFavoritePharmacies = 0;
    _gettingUserFavoritePharmacies = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/bookmarks/list-bookmark-items";

    Map<String, dynamic> requestData = {
      "bookmark_type": "pharmacy",
    };

    try {
      log("stRT");
      Response response = await dio.post(path,
          options: Options(headers: {"auth-token": token}), data: requestData);

      if (response.statusCode == 200) {
        _gettingUserFavoritePharmacies = 2;

        List favData = response.data['data'];
        for (int fav = 0; fav < favData.length; fav++) {
          _userFAVpharmacies.add(favData[fav]['item_id']);
        }
        log("USER FAVS: ${response.data}");
        notifyListeners();
      } else {
        log("NOT 200");

        _gettingUserFavoritePharmacies = 3;
        notifyListeners();
      }
    } catch (e) {
      log("FAILED $e");

      _gettingUserFavoritePharmacies = 3;
      notifyListeners();
    }
  }

  setPharmyBookmarkingIndexToEmpty() {
    _pharmacyBookmarkingIndexes = [];
    notifyListeners();
  }

  bookmarkDrug(
      {String? token, required String drugId, bool bookmarked = false}) async {
    // _bookmarkingDrugState = 0;
    // _bookmarkingDrugState = 1;
    // notifyListeners();
    Dio dio = Dio();

    Map<String, dynamic> requestData = {
      "bookmark_type": "medicine",
      "item_id": drugId,
    };

    String path = bookmarked
        ? APPBASEURL.BASEURL + "/api/v1/user/bookmarks/remove-bookmark-item"
        : APPBASEURL.BASEURL + "/api/v1/user/bookmarks/add-new-bookmark-item";

    try {
      Response response = bookmarked
          ? await dio.delete(path,
              options: Options(headers: {"auth-token": token}),
              data: requestData)
          : await dio.post(path,
              options: Options(headers: {"auth-token": token}),
              data: requestData);

      if (response.statusCode == 200) {
        ShowToast.ecentialsToast(
          message: bookmarked ? "Removed from bookmarks" : "Bookmarked",
          warn: false,
        );
        bookmarked
            ? _bookmarkedDrugs.remove(drugId)
            : _bookmarkedDrugs.add(drugId);
        // _bookmarkingDrugState = 2;
        // notifyListeners();
        // return 200;
      } else {
        // _bookmarkingDrugState = 3;
        // notifyListeners();
        ShowToast.ecentialsToast(
          message: bookmarked
              ? "Failed remove from bookmarks"
              : "Failed to bookmark drug",
        );
        // return 300;
      }
    } catch (e) {
      // _bookmarkingDrugState = 3;
      // notifyListeners();
      log("There was an Error: $e");
      ShowToast.ecentialsToast(
        message: bookmarked
            ? "Failed remove from bookmarks"
            : "Failed to bookmark drug",
      );
      // return 300;
    }
  }

  fetchBookmarkedDrugs({required String? token}) async {
    _fetchingBookmarkedDrugs = 0;
    _fetchingBookmarkedDrugs = 1;
    notifyListeners();

    Dio dio = Dio();

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/bookmarks/list-bookmark-items";

    Map<String, dynamic> requestData = {
      "bookmark_type": "medicine",
    };
    try {
      Response response = await dio.post(path,
          options: Options(headers: {"auth-token": token}), data: requestData);

      if (response.statusCode == 200) {
        _bookmarkedDrugs = [];
        List bookamrks = response.data['data'];
        for (int i = 0; i < bookamrks.length; i++) {
          _bookmarkedDrugs.add(bookamrks[i]['item_id']);
        }
        _fetchingBookmarkedDrugs = 2;
        notifyListeners();
      } else {
        _fetchingBookmarkedDrugs = 3;
        notifyListeners();
      }
    } catch (e) {
      log("FAILED $e");

      _fetchingBookmarkedDrugs = 3;
      notifyListeners();
    }
  }

  searchForPharmacy(
      {String? token,
      Map<String, dynamic>? searchParams,
      bool? filter,
      Function? callback}) async {
    _searchingPharmacies = 0;
    _searchingPharmacies = 1;
    notifyListeners();

    Dio dio = Dio();
    String route = filter == true
        ? "/api/v1/pharmacies/search-nearby-pharmacies"
        : "/api/v1/pharmacies/search-for-pharmacy";

    String path = APPBASEURL.BASEURL + route;

    try {
      Response response = await dio.post(path,
          data: searchParams, options: Options(headers: {"auth-token": token}));
      if (response.statusCode == 200) {
        _pharmacySearchResults = [];
        List pharmacies = response.data['data'];
        if (pharmacies.isEmpty) {
          _pharmacySearchResults = [];
        } else {
          for (int pharm = 0; pharm < pharmacies.length; pharm++) {
            _pharmacySearchResults
                .add(AllPharmaciesPreview.fromJson(pharmacies[pharm]));
          }
        }
        _searchingPharmacies = 2;
        notifyListeners();

        callback?.call();
      } else {
        _searchingPharmacies = 3;
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error fetching data",
        );
      }
    } catch (e) {
      _searchingPharmacies = 3;
      notifyListeners();
      ShowToast.ecentialsToast(
        message: "Error making request",
      );
    }
  }

  searchForDrug(
      {String? token,
      Map<String, dynamic>? searchParams,
      bool? filter,
      Function? callback}) async {
    _searchingDrugs = 0;
    _searchingDrugs = 1;
    notifyListeners();

    Dio dio = Dio();

    String path = APPBASEURL.BASEURL + "/api/v1/pharmacy/drugs/drug-search";

    try {
      Response response = await dio.post(path,
          data: searchParams, options: Options(headers: {"auth-token": token}));
      if (response.statusCode == 200) {
        _generalDrugSearchResults = [];
        List pharmacies = response.data['data'];
        if (pharmacies.isEmpty) {
          _generalDrugSearchResults = [];
        } else {
          for (int i = 0; i < pharmacies.length; i++) {
            _generalDrugSearchResults
                .add(PopularPharmacy.fromJson(pharmacies[i]));
          }
        }
        _searchingDrugs = 2;
        notifyListeners();

        callback?.call();
      } else {
        _searchingDrugs = 3;
        notifyListeners();
        ShowToast.ecentialsToast(
          message: "Error fetching data",
        );
      }
    } catch (e) {
      _searchingDrugs = 3;
      notifyListeners();
      ShowToast.ecentialsToast(
        message: "Error making request",
      );
      print(e);
    }
  }

  Future<List<PopularPharmacy>> searchForDrugInPharmacy({
    String? token,
    Map<String, dynamic>? searchParams,
    bool? filter,
  }) async {
    Dio dio = Dio();

    String path = APPBASEURL.BASEURL +
        "/api/v1/pharmacy/drugs/pharmacy-specific-drug-search/";

    List<PopularPharmacy> results = [];
    try {
      Response response = await dio.post(path,
          data: searchParams, options: Options(headers: {"auth-token": token}));
      if (response.statusCode == 200) {
        List pharmacies = response.data['data'];
        if (pharmacies.isEmpty) {
          return results;
        } else {
          for (int i = 0; i < pharmacies.length; i++) {
            results.add(PopularPharmacy.fromJson(pharmacies[i]));
          }
          return results;
        }
      } else {
        ShowToast.ecentialsToast(
          message: "Error fetching data",
        );
        return results;
      }
    } catch (e) {
      ShowToast.ecentialsToast(
        message: "Error making request",
      );
      return results;
    }
  }

  clearPharmacySearch() {
    _searchingPharmacies = 0;
    _pharmacySearchResults = [];
    notifyListeners();
  }

  clearDrugSearch() {
    _searchingDrugs = 0;
    _generalDrugSearchResults = [];
    notifyListeners();
  }
}
