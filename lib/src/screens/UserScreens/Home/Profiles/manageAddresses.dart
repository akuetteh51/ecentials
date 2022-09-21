import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/app_state/cart_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/checkingOut.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/diliveryAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ManageAddress extends StatefulWidget {
  ManageAddress({Key? key, this.checkingOut = false}) : super(key: key);
  bool checkingOut;

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  @override
  Widget build(BuildContext context) {
    CartState cartState = Provider.of<CartState>(context);
    return Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          elevation: 0,
          leading: const BackButton(),
          title: Text(
              widget.checkingOut
                  ? "Pick a dilivery address"
                  : "Dilivery Addresses",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlackColor.withAlpha(180))),
          actions: [
            IconButton(
                onPressed: () async {
                  if (widget.checkingOut) {
                    final i = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DiliveryAddress()),
                    );
                    Navigator.pop(context, i);
                  } else {
                    await Get.to(() => DiliveryAddress())
                        ?.then((value) => setState(() {}));
                  }
                },
                icon: Icon(Icons.add,
                    size: 32, color: AppColors.primaryDeepColor))
          ],
        ),
        body: SingleChildScrollView(
            child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cartState.addresses.length,
          itemBuilder: ((context, index) => ListTile(
                onTap: () {
                  widget.checkingOut
                      ? Navigator.pop(context, index)
                      : Get.to(() =>
                          DiliveryAddress(address: cartState.addresses[index]));
                },
                minVerticalPadding: 20,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${cartState.addresses[index].name},",
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Text(
                      "${cartState.StringifyAddressLocation(cartState.addresses[index])}, GH",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                trailing: widget.checkingOut == false &&
                        cartState.addresses[index].primary != null &&
                        cartState.addresses[index].primary == true
                    ? Icon(Icons.check_circle_rounded,
                        color: AppColors.primaryGreenColor, size: 36)
                    : const SizedBox.shrink(),
              )),
        )));
  }
}
