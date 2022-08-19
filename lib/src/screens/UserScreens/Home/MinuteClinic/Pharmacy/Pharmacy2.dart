// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/availableDrugsCard.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/pharmacyCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';

class Pharmacy2 extends StatefulWidget {
  const Pharmacy2({
    Key? key,
  }) : super(key: key);

  @override
  State<Pharmacy2> createState() => _Pharmacy2State();
}

class _Pharmacy2State extends State<Pharmacy2> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 1,
        ),
        child: GestureDetector(
          onTap: () {},
          child: Button(
            text: "Add to cart",
            color: const Color(0xFF033A64),
            style: TextStyle(
              color: AppColors.primaryWhiteColor,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).disabledColor.withOpacity(.75),
          ),
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          elevation: 0,
          foregroundColor: AppColors.primaryBlackColor,
          backgroundColor: AppColors.primaryWhiteColor,
          expandedHeight: height * 0.45,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "assets/images/drug.png",
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 10),
            width: width,
            decoration: BoxDecoration(
              color: AppColors.primaryWhiteColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -5),
                  color: AppColors.primaryBlackColor.withOpacity(.10),
                  blurRadius: 5.0,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 56.71, left: 24.60),
                      //  height: 32.48,
                      // width: 245.91,
                      child: Row(
                        children: [
                          Text(
                            "Ibuprofen",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primaryBlackColor),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 90.95, right: 27),
                            height: 22.29,
                            width: 25,
                            child: Image.asset(
                              "assets/images/heart.png",
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24.66, top: 5.52),
                      height: 25.33,
                      width: 114.89,
                      child: Text(
                        "Tablets * 50 pieces",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryBlackColor),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 24.66, top: 3.52),
                      height: 25.33,
                      width: 63.34,
                      child: Text(
                        "In Stock",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryBlackColor),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 24.66, top: 3.52),
                          height: 32.48,
                          width: 85.23,
                          child: Text(
                            "\$5.68",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF033A64),
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 30.48, top: 22),
                              height: 25.35,
                              width: 92.45,
                              child: Text(
                                "10 in stock",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryBlackColor,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            Container(
                                height: 7,
                                width: 128,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                ),
                                child: Container(
                                  height: 7,
                                  width: 70.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xFFF69B2B),
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 22.48, top: 21),
                          height: 25.33,
                          width: 86.64,
                          child: Text(
                            "Dosage form",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryBlackColor,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 59.93, top: 21),
                          height: 25.33,
                          width: 128,
                          child: Text(
                            "Active Substance",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryBlackColor,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 26.07, top: 4.15),
                          height: 32.48,
                          width: 85.23,
                          child: Text(
                            "Pills",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlackColor,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 64.58, top: 21),
                          height: 32.48,
                          width: 120.12,
                          child: Text(
                            "Ibuprofen",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlackColor,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 22.48, top: 19),
                          height: 25.33,
                          width: 49.57,
                          child: Text(
                            "Dosage",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryBlackColor,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 97, top: 21),
                          height: 25.33,
                          width: 94,
                          child: Text(
                            "Manufacturer",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryBlackColor,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 26.07, top: 4.15),
                          height: 25.33,
                          width: 85.23,
                          child: Text(
                            "0.2g",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlackColor,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 64.58, top: 21),
                          height: 25.33,
                          width: 168.69,
                          child: Text(
                            "Biosyn, Russia",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryBlackColor,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
