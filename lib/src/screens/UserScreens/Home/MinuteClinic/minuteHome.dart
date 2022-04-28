import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/Dashboard.dart';
import 'package:flutter/material.dart';

class MinuteHome extends StatelessWidget {
  const MinuteHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
