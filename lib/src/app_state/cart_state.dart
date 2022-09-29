import 'package:dio/dio.dart';
import 'package:ecentialsclone/models/AddressModel.dart';
import 'package:ecentialsclone/models/CartItemModel.dart';
import 'package:ecentialsclone/models/PopularDrugs.dart';
import 'package:ecentialsclone/src/BASEURL/BASEURL.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartState extends ChangeNotifier {
  List<CartItemModel> _cart = <CartItemModel>[];
  List<CartItemModel> get cart => _cart;
  double _subTotal = 0.00;
  double get subTotal => _subTotal;
  String _note = "";
  String get note => _note;
  List<AddressModel> _diliveryAddresses = <AddressModel>[];
  List<AddressModel> get diliveryAddresses => _diliveryAddresses;

  addToCart(PopularPharmacy drug) {
    _cart.add(CartItemModel(
        drug: drug, quantity: 1, price: drug.prize.toDouble() * 1));
    updateSubTotal();
    notifyListeners();
    ShowToast.ecentialsToast(
      message: "Added to Cart",
      warn: false,
    );
  }

  addAllToCart(List<PopularPharmacy> drugs) {
    print("hrhy");
    drugs.forEach((drug) {
      _cart.add(CartItemModel(
          drug: drug, quantity: 1, price: drug.prize.toDouble() * 1));
    });
    updateSubTotal();
    notifyListeners();
    ShowToast.ecentialsToast(
      message: "Added to Cart",
      warn: false,
    );
  }

  removeFromCart(index, [String? type = "index"]) {
    if (type == "id") {
      int nIndex = _cart.indexWhere((element) => element.drug.id == index);
      _rmvFromCart(nIndex);
    } else {
      _rmvFromCart(index);
    }
  }

  _rmvFromCart(index) {
    _cart.removeAt(index);
    updateSubTotal();
    notifyListeners();
    ShowToast.ecentialsToast(
      message: "Removed from Cart",
    );
  }

  increaseItemQuantity(int index) {
    // if(_cart[index].quantity<50)
    _cart[index].quantity += 1;
    _cart[index].price =
        _cart[index].drug.prize.toDouble() * _cart[index].quantity;
    updateSubTotal();
    notifyListeners();
  }

  decreaseItemQuantity(int index) {
    if (_cart[index].quantity > 1) _cart[index].quantity -= 1;
    _cart[index].price =
        _cart[index].drug.prize.toDouble() * _cart[index].quantity;
    updateSubTotal();
    notifyListeners();
  }

  updateNote(newVal) {
    _note = newVal;
    notifyListeners();
  }

  updateSubTotal() {
    _subTotal = 0.00;
    for (var i = 0; i < _cart.length; i++) {
      _subTotal += _cart[i].price ?? 0.00;
    }
    notifyListeners();
  }

  clearCart() {
    _cart = [];
    updateSubTotal();
    notifyListeners();
  }

  checkOut(
      {String? token, int? diliveryAddressIndex, Function? callback}) async {
    DateTime now = DateTime.now();
    DateTime fromDiliveryDate = DateTime(now.year, now.month + 1, now.day);
    DateTime toDiliveryDate = DateTime(now.year, now.month + 1, now.day + 8);
    final DateFormat formatter = DateFormat('EEEE, d, MMMM, y');

    Dio dio = Dio();

    Map<String, dynamic> data = {
      "delivery_address": diliveryAddressIndex == null
          ? StringifyAddress(_diliveryAddresses
              .firstWhere((address) => address.primary == true))
          : StringifyAddress(_diliveryAddresses[diliveryAddressIndex]),
      "delivery_date":
          "Between ${formatter.format(fromDiliveryDate)} and ${formatter.format(toDiliveryDate)}",
      "total_items_cost": _subTotal,
      "shipping_fee": 20,
      "total": _subTotal + 20,
      "note": _note,
      "shipment_summary": _cart
          .map<Map<String, dynamic>>((item) => {
                "drug_name": item.drug.name,
                "total_number": item.quantity,
                "pharmacy": item.drug.store_id
              })
          .toList()
    };

    String path =
        APPBASEURL.BASEURL + "/api/v1/user/checkout/create-checkout-item";

    try {
      Response response = await dio.post(path,
          data: data, options: Options(headers: {"auth-token": token}));
      if (response.statusCode == 200) {
        ShowToast.ecentialsToast(
          message: "Your order has been successfully placed",
          warn: false,
        );
        clearCart();
        return 2;
      } else {
        ShowToast.ecentialsToast(
          message: "There was an error placing your order, please try again.",
        );
        return 3;
      }
    } catch (e) {
      ShowToast.ecentialsToast(
        message: "There was an error placing your order, please try again.",
      );
      return 3;
    }
  }

  addDiliveryAddress(
      {String? token,
      required AddressModel address,
      Function? callback}) async {
    Dio dio = Dio();
    String path = APPBASEURL.BASEURL +
        "/api/v1/user/shipping-address/add-user-shipping-address";

    try {
      Response response = await dio.post(path,
          data: JSONifyAddress(address),
          options: Options(headers: {"auth-token": token}));
      if (response.statusCode == 200) {
        ShowToast.ecentialsToast(
          message: "Address added",
          warn: false,
        );
        _diliveryAddresses.add(address);
        return _diliveryAddresses.length - 1;
      } else {
        ShowToast.ecentialsToast(
          message: "There was an error adding address, please try again.",
        );
        return -1;
      }
    } catch (e) {
      print(e);
      ShowToast.ecentialsToast(
        message: "There was an error adding address, please try again.",
      );
      return -1;
    }
  }

  Future<int> fetchAddresses({required String? token}) async {
    Dio dio = Dio();
    String path = APPBASEURL.BASEURL +
        "/api/v1/user/shipping-address/fetch-all-shipping-addresses";

    try {
      Response response =
          await dio.get(path, options: Options(headers: {"auth-token": token}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data["data"]);
        List addresses = response.data["data"];
        if (addresses.isEmpty) {
          _diliveryAddresses = [];
        } else {
          for (int i = 0; i < addresses.length; i++) {
            _diliveryAddresses.add(AddressModel.fromJSON(addresses[i]));
          }
        }
        return 2;
      } else {
        ShowToast.ecentialsToast(
          message: "Error retrieving addresses",
        );
        return 3;
      }
    } catch (e) {
      print("Error: ${e}");
      ShowToast.ecentialsToast(
        message: "Error retrieving addresses",
      );
      return 3;
    }
  }

  Map<String, dynamic> JSONifyAddress(AddressModel address) {
    return {
      "name_of_recipient": address.name,
      "mobile": address.mobile,
      "street_name": address.street,
      "town": address.town,
      "district": address.district,
      "region": address.region,
      "primary": address.primary
    };
  }

  String StringifyAddress(AddressModel? address) {
    return address == null
        ? ""
        : "${address.name}, ${address.mobile}, ${address.street}, ${address.town}, ${address.district}, ${address.region}";
  }

  String StringifyAddressLocation(AddressModel? address) {
    return address == null
        ? ""
        : "${address.mobile}, ${address.street}, ${address.town}, ${address.district}, ${address.region}";
  }
}
