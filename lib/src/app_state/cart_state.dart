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
  final List<AddressModel> _addresses = <AddressModel>[
    AddressModel(
        name: "Kwabena Gyasi",
        mobile: "+233 248 555 678",
        street: "Kpodo St",
        town: "Nelo",
        district: "Kyerepone",
        region: "Savanah",
        primary: true),
    AddressModel(
        name: "Kofi Kofi",
        mobile: "+233 244 444 444",
        street: "Nuckemborough St",
        town: "George Town",
        district: "Wihensky",
        region: "Eastern")
  ];
  List<AddressModel> get addresses => _addresses;
  // AddressModel? _diliveryAddress;
  // AddressModel? get diliveryAddress => _diliveryAddress;

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
          ? StringifyAddress(
              _addresses.firstWhere((address) => address.primary == true))
          : StringifyAddress(_addresses[diliveryAddressIndex]),
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

    print(data);

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
    // Dio dio = Dio();
    // String path = APPBASEURL.BASEURL + "/api/v1/user/add-dilivery-address";

    // try {
    //   Response response = await dio.post(path,
    //       data: JSONifyAddress(address),
    //       options: Options(headers: {"auth-token": token}));
    //   if (response.statusCode == 200) {
    ShowToast.ecentialsToast(
      message: "Address added",
      warn: false,
    );
    _addresses.add(address);
    return _addresses.length - 1;
    //   } else {
    //     ShowToast.ecentialsToast(
    //       message: "There was an error adding address, please try again.",
    //     );
    // return -1;
    //   }
    // } catch (e) {
    //   ShowToast.ecentialsToast(
    //     message: "There was an error adding address, please try again.",
    //   );
    // return -1;
    // }
  }

  Map<String, dynamic> JSONifyAddress(AddressModel address) {
    return {
      "name": address.name,
      "mobile": address.mobile,
      "street": address.street,
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
