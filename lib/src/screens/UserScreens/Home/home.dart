import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/Dashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulanceNear.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/minuteClinic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DashBoard(
            image: "assets/images/minute_clinic.png",
            btnName: "Minute Clinic",
            onTap: () {
              Get.to(
                () => const MinuteClinic(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 300),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          DashBoard(
            onTap: () {
              Get.to(
                () => const AmbulanceNear(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 300),
              );
            },
            image: "assets/images/ambulance.png",
            btnName: "Ambulance Services",
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
