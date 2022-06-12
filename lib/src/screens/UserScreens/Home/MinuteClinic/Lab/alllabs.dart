// ignore_for_file: unused_import, no_logic_in_create_state, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_statements, avoid_print

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';

import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labDetails.dart';
//import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Sreen3.dart';
//import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Lab5.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Alllabs extends StatefulWidget {
  const Alllabs({Key? key}) : super(key: key);

  @override
  State<Alllabs> createState() => _AlllabsState();
}

class _AlllabsState extends State<Alllabs> {
  get size => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavBar(
          backgroundColor: AppColors.primaryGreenColor,
        ),
        floatingActionButton: FloatingAmbulance(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
            backgroundColor: AppColors.primaryWhiteColor,
            foregroundColor: AppColors.primaryBlackColor,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  EcentialsIcons.menu_icon,
                  color: AppColors.primaryDeepColor,
                ),
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.all(10),
                child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png")),
              ),
            ]),
        drawer: const NavDrawer(),
        body: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: ListView(children: [
              Text(
                "Search for labs",
                style: TextStyle(
                    color: AppColors.primaryBlackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
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
                        color: Colors.teal,
                      ),
                      child: Icon(
                        EcentialsIcons.filter,
                        size: 20,
                        color: AppColors.primaryWhiteColor,
                      ),
                    ),
                  ]),
              SizedBox(
                height: 60,
              ),
              for (int y = 0; y <= 4;y++)
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(() => LabDetails());
                      },
                      child: LabResultsCard(
                          image: "assets/images/card.png",
                          labName: "Ziky Clinical Laboratory",
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
