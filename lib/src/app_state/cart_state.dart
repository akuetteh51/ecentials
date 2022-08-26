import 'package:ecentialsclone/models/CartItemModel.dart';
import 'package:ecentialsclone/models/PopularDrugs.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:flutter/material.dart';

class CartState extends ChangeNotifier {
  final List<CartItemModel> _cart = <CartItemModel>[];
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
  }
}
