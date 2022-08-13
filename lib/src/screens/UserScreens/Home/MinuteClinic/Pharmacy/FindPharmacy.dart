// ignore_for_file: unused_import, prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labDetails.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/drugDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanDocument.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class FindPharmacy extends StatefulWidget {
  const FindPharmacy({
    Key? key,
  }) : super(key: key);

  @override
  State<FindPharmacy> createState() => _FindPharmacyState();
}

class _FindPharmacyState extends State<FindPharmacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: FloatingAmbulance(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                )),
            actions: [
              Container(
                margin: EdgeInsets.all(10),
                child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png")),
              ),
            ]),
        body: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: ListView(children: [
              Text(
                "Find Nearby Pharmacies",
                style: TextStyle(
                    color: AppColors.primaryBlackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(width: 314.02, child:
                    Flexible(child: Search()),
                    SizedBox(
                      width: 16.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF033A64),
                      ),
                      child: Icon(
                        EcentialsIcons.filter,
                        size: 20,
                        color: AppColors.primaryWhiteColor,
                      ),
                    ),
                  ]),
              Container(
                margin: EdgeInsets.only(top: 56),
                child: Row(
                  children: [
                    Text(
                      "Top Pharmacists",
                      style: TextStyle(
                          color: AppColors.primaryBlackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 140.01),
                      child: Text(
                        "See all",
                        style: TextStyle(
                            color: const Color(0xFFCB3F04),
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              for (int y = 0; y <= 4; y++)
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => DrugDashboard());
                      },
                      child: LabResultsCard(
                          image: "assets/images/pharHome.png",
                          labName: "Sussan Drug Store",
                          openingHours: "Weekdays | 7:00am - 5:00pm"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
            ])));
  }
}
