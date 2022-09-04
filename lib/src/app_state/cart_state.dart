import 'package:dio/dio.dart';
import 'package:ecentialsclone/models/CartItemModel.dart';
import 'package:ecentialsclone/models/PopularDrugs.dart';
import 'package:ecentialsclone/src/BASEURL/BASEURL.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:flutter/material.dart';

class CartState extends ChangeNotifier {
  List<CartItemModel> _cart = <CartItemModel>[];
  List<CartItemModel> get cart => _cart;
  double _subTotal = 0.00;
  double get subTotal => _subTotal;

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

  checkOut({String? token, Function? callback}) async {
    Dio dio = Dio();

    Map<String, dynamic> data = {
      "delivery_address": "Kumi Guitar, 24th street. Adabraka Accra",
      "delivery_date": "Between 26th July and 30th August",
      "total_items_cost": _subTotal,
      "shipping_fee": 20,
      "total": _subTotal + 20,
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

    Response response = await dio.post(path,
        data: data, options: Options(headers: {"auth-token": token}));
    if (response.statusCode == 200) {
      ShowToast.ecentialsToast(
        message: "Your order has been successfully placed",
        warn: false,
      );
      clearCart();
    } else {
      ShowToast.ecentialsToast(
        message: "There was an error placing your order, please try again.",
      );
    }
  }
}
