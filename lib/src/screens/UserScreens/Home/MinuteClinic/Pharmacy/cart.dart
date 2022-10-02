// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/cartCard.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/app_state/cart_state.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/checkingOut.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/pharmacyDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/diliveryAddress.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/manageAddresses.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool expandNote = false;
  @override
  Widget build(BuildContext context) {
    CartState cartState = Provider.of<CartState>(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryWhiteColor,
        // backgroundColor: Colors.amber,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Container(
          margin: const EdgeInsets.only(
              // left: 132.59,
              ),
          child: const Text(
            "Cart",
            style: TextStyle(
                fontSize: 22,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: cartState.cart.isEmpty
                  ? Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                              // color: Colors.amber,
                              height: 250.0,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  // top: 45.83,
                                  // left: 5.36,
                                  // right: 5.36,
                                  ),
                              child: Image.asset(
                                "assets/images/empty_cart.png",
                                scale: 1.0,
                              )),
                          Container(
                              height: 25,
                              // width: 226,
                              margin: const EdgeInsets.only(
                                top: 35.17,
                                // left: 94,
                                // right: 94,
                              ),
                              child: Text("YOUR CART IS EMPTY!",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ))),
                          Container(
                              height: 20,
                              //  width: 202,
                              margin: const EdgeInsets.only(
                                top: 12,
                                // left: 94, right: 118
                              ),
                              child: Text("Start shopping to fill it up",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Montserrat",
                                  ))),
                          Container(
                            height: 53,
                            width: 301.94,
                            margin: const EdgeInsets.only(
                                top: 50.33, left: 56.03, right: 56.03),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 240, 244),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Button(
                              onTap: () {
                                Get.to(() => PharmacyDashboard());
                              },
                              text: "Go Shopping",
                              height: 18,
                              width: 99,
                              style: TextStyle(
                                  color: AppColors.primaryWhiteColor,
                                  fontSize: 15,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ))
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 20),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                      color: AppColors.primaryBlueColor),
                                ),
                                child: Icon(
                                  Icons.card_giftcard_rounded,
                                  color: AppColors.primaryDeepColor,
                                  size: 32,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 8, bottom: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: Offset(-.5, .5),
                                            color: AppColors.primaryGrayColor
                                                .withAlpha(100),
                                            blurRadius: 5,
                                            spreadRadius: 3,
                                          )
                                        ]),
                                    child: Neumorphic(
                                        style: NeumorphicStyle(
                                          shape: NeumorphicShape.concave,
                                          boxShape: NeumorphicBoxShape.rect(),
                                          depth: -5,
                                          lightSource: LightSource.top,
                                          color: Colors.white.withOpacity(.10),
                                        ),
                                        child: TextField(
                                          style: const TextStyle(fontSize: 20),
                                          cursorColor:
                                              AppColors.primaryDeepColor,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 8),
                                            hintText: "Use discount code",
                                            focusColor:
                                                AppColors.primaryDeepColor,
                                            border: const UnderlineInputBorder(
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cartState.cart.length,
                            itemBuilder: (context, index) => CartCard(
                                item: cartState.cart[index], index: index)),
                        SizedBox(height: 120),
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          child: Icon(Icons.note_add,
                                              color:
                                                  AppColors.primaryBlueColor),
                                        ),
                                        Text("Add an order note"),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            expandNote = !expandNote;
                                          });
                                        },
                                        icon: Icon(
                                            expandNote
                                                ? Icons.expand_less_rounded
                                                : Icons.expand_more_rounded,
                                            color: AppColors.primaryBlackColor
                                                .withAlpha(210)))
                                  ]),
                              if (expandNote)
                                Divider(
                                  height: 1,
                                ),
                              if (expandNote)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    maxLines: 8,
                                    cursorColor: AppColors.primaryDeepColor,
                                    onChanged: (value) {
                                      cartState.updateNote(value);
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 8),
                                      hintText: "Add note...",
                                      focusColor: AppColors.primaryDeepColor,
                                      border: const UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                                      color: AppColors.primaryBlackColor
                                          .withAlpha(60),
                                      width: 2))),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Sub Total: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.primaryBlackColor
                                          .withAlpha(210))),
                              Text("GHc ${cartState.subTotal.toString()}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.primaryDeepColor
                                          .withAlpha(180))),
                            ],
                          ),
                        ),
                        SizedBox(height: 120),
                      ],
                    )),
          if (cartState.cart.isNotEmpty)
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhiteColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryBlackColor.withOpacity(.07),
                            blurRadius: 3.0,
                            spreadRadius: 1,
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 26),
                      child: Button(
                          text: "Checkout",
                          onTap: () {
                            Get.to(() => CheckingOut());
                          },
                          style: TextStyle(color: AppColors.primaryWhiteColor)),
                    )))
        ],
      ),
    );
  }
}
