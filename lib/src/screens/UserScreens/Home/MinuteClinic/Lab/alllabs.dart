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
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
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
      backgroundColor: AppColors.primaryWhiteColor,
      drawer: const NavDrawer(),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            for (int y = 0; y <= 4; y++)
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
          ],
        ),
      ),
    );
  }
}
