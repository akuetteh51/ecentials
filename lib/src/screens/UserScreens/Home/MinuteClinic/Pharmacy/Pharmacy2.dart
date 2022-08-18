// ignore_for_file: unused_import, prefer_const_constructors

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
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Ibuprofen",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryBlackColor),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
