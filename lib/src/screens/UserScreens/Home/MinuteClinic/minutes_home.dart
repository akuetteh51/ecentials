import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/hospitalHome.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labsHome.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/pharmacyHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Widgets/Dashboard.dart';

class MinutesHome extends StatefulWidget {
  const MinutesHome({Key? key}) : super(key: key);

  @override
  State<MinutesHome> createState() => _MinutesHomeState();
}

class _MinutesHomeState extends State<MinutesHome> {
  // Images
  final _images = [
    "assets/images/pharmacy.png",
    "assets/images/hospital.png",
    "assets/images/lab.png",
  ];

  // Button Names
  final _btnNames = [
    "Pharmacy",
    "Hospital",
    "Lab",
  ];

  // Pages
  final _pages = [
    const PharmacyHome(),
    const HospitalHome(),
    const LabsHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        children:[
          Column(
            children:List.generate(
          3,
          (index) => DashBoard(
              image: _images[index],
              btnName: _btnNames[index],
              onTap: () {
                Get.to(() => _pages[index]);
              }),
        ),
          ),
          const SizedBox(height: 120,),
        ],
      ),
    );
  }
}
