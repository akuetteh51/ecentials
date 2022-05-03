// ignore_for_file: file_names, prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/Dashboard.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/chat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/homeScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Notifications/notifications.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MinuteClinic extends StatefulWidget {
  const MinuteClinic({Key? key}) : super(key: key);

  @override
  State<MinuteClinic> createState() => _MinuteClinicState();
}

class _MinuteClinicState extends State<MinuteClinic> {
  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      backgroundColor: AppColors.primaryWhiteColor,
      foregroundColor: AppColors.primaryBlackColor,
      elevation: 0,
      title: Row(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12, right: 10),
            child: Image.asset(
              "assets/images/logo.png",
              scale: 2,
            ),
          ),
          const Text(
            "Minute Clinic",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );

    // Images
    final _images = [
      "assets/images/hospital.png",
      "assets/images/pharmacy.png",
      "assets/images/lab.png",
    ];

    // Button Names
    final _btnNames = [
      "Hospital",
      "Pharmacy",
      "Lab",
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      bottomNavigationBar: BottomNavBar(
        backgroundColor: AppColors.primaryDeepColor,
      ),
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: _appBar,
      body: ListView(
        children: List.generate(
          3,
          (index) => DashBoard(
            image: _images[index],
            btnName: _btnNames[index],
          ),
        ),
      ),
    );
  }
}
