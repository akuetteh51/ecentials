import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/Dashboard.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/chat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/nearbyHospital.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/homeScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Notifications/notifications.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Hospital1.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
      NearbyHospital(),
      NearbyHospital(),
      NearbyHospital(),
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
              //  if(index == 0){
              onTap: () {
                Get.to(
                  () => const NearbyHospital(),
                  transition: Transition.fadeIn,
                  duration: Duration(seconds: 1),
                );
                // }
              }),
        ),
      ),
    );
  }
}
