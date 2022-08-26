// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/models/PopularDrugs.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugInfo.dart';
import 'package:ecentialsclone/src/Widgets/sliverFab.dart';
import 'package:ecentialsclone/src/app_state/cart_state.dart';
import 'package:ecentialsclone/src/app_state/pharmacy_state.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DrugDetails extends StatefulWidget {
  DrugDetails({Key? key, required this.details}) : super(key: key);
  PopularPharmacy details;

  @override
  State<DrugDetails> createState() => _DrugDetailsState();
}

class _DrugDetailsState extends State<DrugDetails> {
  late bool _addedToCart;
  bool _bookmarkingDrug = false;
  @override
  Widget build(BuildContext context) {
    CartState cartState = Provider.of<CartState>(context);
    PharmacyState pharmacyState = Provider.of<PharmacyState>(context);
    UserState userState = Provider.of<UserState>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    PopularPharmacy details = widget.details;
    int index = cartState.cart.indexWhere((e) => e.drug.id == details.id);
    _addedToCart = index > -1 ? true : false;
    bool _isBookmarked = pharmacyState.bookmarkedDrugs.contains(details.id);
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              foregroundColor: AppColors.primaryBlackColor,
              backgroundColor: AppColors.primaryWhiteColor,
              expandedHeight: height * 0.45,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/images/acetalx.png"
                    // details.images?[0],
                    // width: double.maxFinite,
                    // fit: BoxFit.cover,
                    ),
              ),
              bottom: PreferredSize(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32)),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, -.5),
                          color: AppColors.primaryBlackColor.withOpacity(.07),
                          blurRadius: 3.0,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          offset: Offset(0, 5),
                          color: Colors.white,
                          blurRadius: 2.0,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                                width: 60,
                                height: 4.5,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryBlackColor
                                        .withAlpha(70),
                                    borderRadius: BorderRadius.circular(9999))),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  details.name ?? "Drug",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryBlackColor
                                        .withAlpha(210),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    if (_bookmarkingDrug) return;
                                    setState(() {
                                      _bookmarkingDrug = true;
                                    });
                                    await pharmacyState.bookmarkDrug(
                                        token: userState.userInfo?['token'],
                                        drugId: details.id ?? "");
                                    setState(() {
                                      _bookmarkingDrug = false;
                                    });
                                  },
                                  icon: _bookmarkingDrug
                                      ? Center(
                                          child: CircularProgressIndicator(
                                              color:
                                                  AppColors.primaryDeepColor),
                                        )
                                      : Icon(
                                          _isBookmarked
                                              ? Icons.favorite_rounded
                                              : Icons.favorite_border_rounded,
                                          size: 32,
                                          color: Colors.red[700]))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(80)),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                        "${details.dosage_form} * ${details.quantity.toString()} pieces",
                        style: TextStyle(
                            color:
                                AppColors.primaryBlackColor.withOpacity(.60))),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text("In Stock",
                        style: TextStyle(
                            color:
                                AppColors.primaryBlackColor.withOpacity(.60))),
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(
                      width: width * .45,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("GHc ${details.prize}",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryDeepColor
                                          .withAlpha(170))),
                            ),
                          ]),
                    ),
                    SizedBox(
                      width: width * .45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text("10 in stock"),
                              ),
                              SizedBox(
                                height: 8,
                                width: 120,
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                    shape: NeumorphicShape.concave,
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(99999)),
                                    depth: -5,
                                    lightSource: LightSource.top,
                                    color: Colors.grey.withOpacity(.10),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        width: 70,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9999),
                                            color:
                                                AppColors.primaryOrangeColor)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * .44,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                DrugInfo(
                                    title: "Dosage form",
                                    info: details.dosage_form ?? "Pills"),
                                DrugInfo(
                                    title: "Dosage",
                                    info: details.dosage ?? "0.2g",
                                    size: 17),
                              ]),
                        ),
                        SizedBox(width: 18),
                        SizedBox(
                          width: width * .44,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DrugInfo(
                                  title: "Active substance", info: "Ibuprofen"),
                              DrugInfo(
                                  title: "Manufacturer",
                                  info: details.manufacturer ?? "Manufacturer",
                                  size: 17),
                            ],
                          ),
                        ),
                      ]),
                  SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("Description",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20)),
                  ),
                  Text("${details.description}"),
                  SizedBox(height: 120),
                ],
              ),
            ))
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -1),
                        color: AppColors.primaryBlackColor.withOpacity(.07),
                        blurRadius: 3.0,
                        spreadRadius: 1,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 62.0, vertical: 26),
                  child: Button(
                      text: _addedToCart ? "Added to Cart " : "Add to Cart",
                      color: _addedToCart
                          ? AppColors.primaryGrayColor
                          : AppColors.primaryDeepColor,
                      onTap: () {
                        setState(() {
                          _addedToCart
                              ? cartState.removeFromCart(details.id!, "id")
                              : cartState.addToCart(details);
                          Get.to(() => Cart());

                          _addedToCart = !_addedToCart;
                        });
                      },
                      style: TextStyle(
                          color: _addedToCart
                              ? AppColors.primaryDeepColor
                              : AppColors.primaryWhiteColor)),
                )))
      ]),
    );
  }
}
