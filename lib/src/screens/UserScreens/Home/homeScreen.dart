import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/dashboard.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulanceNear.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/minuteClinic.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // App Bar
    final _appBar = AppBar(
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
      title: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Image.asset(
          "assets/images/logo.png",
          scale: 1.5,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: () {
              Get.to(
                () => ProfileScreen(),
                transition: Transition.rightToLeft,
                duration: Duration(seconds: 1),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile_image.png"),
            ),
          ),
        )
      ],
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: _appBar,
      drawer: NavDrawer(),
      body: Column(
        children: [
          DashBoard(
            image: "assets/images/minute_clinic.png",
            btnName: "Minute Clinic",
            onTap: () {
              Get.to(
                () => const MinuteClinic(),
                transition: Transition.fadeIn,
                duration: const Duration(seconds: 1),
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          DashBoard(
            onTap: () {
              Get.to(
                () => AmbulanceNear(),
                transition: Transition.rightToLeft,
                duration: Duration(seconds: 1),
              );
            },
            image: "assets/images/ambulance.png",
            btnName: "Ambulance Services",
          ),
        ],
      ),
    );
  }
}
