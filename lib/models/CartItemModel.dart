import 'package:ecentialsclone/models/PopularDrugs.dart';

class CartItemModel {
  PopularPharmacy drug;
  int quantity;
  double? price;

  CartItemModel({required this.drug, required this.quantity, this.price});
}
