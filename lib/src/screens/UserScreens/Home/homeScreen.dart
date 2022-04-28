import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/Dashboard.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/minuteClinic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: Column(
        children: [
          DashBoard(
            image: "assets/images/minute_clinic.png",
            btnName: "Minute Clinic",
            onTap: () {
              Get.to(
                () => const MinuteClinic(),
                transition: Transition.fadeIn,
                duration: Duration(seconds: 1),
              );
            },
          ),
          SizedBox(
            height: 40,
          ),
          DashBoard(
            image: "assets/images/ambulance.png",
            btnName: "Ambulance Services",
          ),
        ],
      ),
    );
  }
}
