// ignore_for_file: file_names, prefer_const_constructors, unused_import

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/dashboard.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/chat.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/screen2.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/Hospital2.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/Hospital3.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/Hospital4Chat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/lab1.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/lab3.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/EmptyCart.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/Order_completed.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/Order_submitted.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/PharmacyDashboard2.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/pharmacy5.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/pharmacyDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/EmptyCart.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/pharmacyDashboard3.dart';
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
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.primaryDeepColor,
        ),
        onPressed: () {
          Get.to(
            () => HomeScreen(),
          );
        },
      ),
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
    // screens
    final _pages = [
      lab1(),
      // lab3(),
      // lab3(),

     // Hospital3(),
     Order_submitted(),
     Order_completed(),
     pharmacyDashboard3(),
     pharmacyDashboard3(),
     pharmacyDashboard2(),
     pharmacyDashboard2(),

     Order_completed(),
     Order_completed(),
    // EmptyCard(),
    // EmptyCard(),
// pharmacy5(),
     // pharmacy5(),
     // Hospital2(),
     // Hospital2(),
      //EmptyCart(),
      //EmptyCart(),

      //lab3(),
      Hospital4Chat(),
      Hospital2(),
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
            onTap: () {
              Get.to(() => _pages[index]);
            },
            image: _images[index],
            btnName: _btnNames[index],
          ),
        ),
      ),
    );
  }
}
