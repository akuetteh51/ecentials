import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labDetails.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labDetails.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  final String image;
  final String btnName;
  final onTap;
  

  const DashBoard(
      {Key? key, required this.image, required this.btnName,  this.onTap,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: width,
      child: Column(
        children: [
          Image.asset(
            image,
          ),
         const SizedBox(
            height: 10,
          ),
          Button(
            onTap: onTap,
            text: btnName,
            width: width - 200,
            height: 40,
            radius: 50,
            color: AppColors.primaryOrangeColor,
            style: TextStyle(
              color: AppColors.primaryWhiteColor,
            ),
          )
        ],
      ),
    );
  }
}
