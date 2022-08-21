import 'package:ecentialsclone/models/CartItemModel.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/app_state/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCard extends StatelessWidget {
  CartItemModel item;
  int index;
  CartCard({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    CartState cartState = Provider.of<CartState>(context);

    return Container(
      decoration: BoxDecoration(color: AppColors.primaryWhiteColor, boxShadow: [
        BoxShadow(
          offset: Offset(0, .5),
          color: AppColors.primaryBlackColor.withOpacity(.07),
          blurRadius: 3.0,
          spreadRadius: 1,
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Row(
          children: [
            SizedBox(
                width: width / 7, child: Image.asset("assets/images/drug.png")),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${cartState.cart[index].drug.store_id} - Spintex",
                        style: TextStyle(
                          color: AppColors.primaryDeepColor.withAlpha(180),
                        )),
                    Text(cartState.cart[index].drug.name ?? "Drug",
                        style: TextStyle(
                            color: AppColors.primaryBlackColor.withAlpha(210),
                            fontSize: 22)),
                    Row(children: [
                      Text("Quantity",
                          style: TextStyle(
                              color:
                                  AppColors.primaryBlackColor.withAlpha(120))),
                      IconButton(
                          onPressed: () {
                            cartState.decreaseItemQuantity(index);
                          },
                          icon: const Icon(Icons.remove)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(cartState.cart[index].quantity.toString()),
                      ),
                      IconButton(
                          onPressed: () {
                            cartState.increaseItemQuantity(index);
                          },
                          icon: const Icon(Icons.add)),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("GHc ${cartState.cart[index].price.toString()}",
                            style: TextStyle(
                              fontSize: 17,
                              color: AppColors.primaryDeepColor.withAlpha(180),
                            )),
                        IconButton(
                            onPressed: () {
                              cartState.removeFromCart(index);
                            },
                            icon: const Icon(
                              EcentialsIcons.bin,
                              size: 22,
                            ))
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
