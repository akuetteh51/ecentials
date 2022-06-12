// ignore_for_file: unused_import, prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/availableDrugsCard.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/pharmacyCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';

class UploadResults extends StatefulWidget {
  const UploadResults({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadResults> createState() => _UploadResultsState();
}

class _UploadResultsState extends State<UploadResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: Icon(Icons.arrow_back),
        title: Container(
          height: 34,
          width: 141.53,
          margin: const EdgeInsets.only(
            left: 84.24,
          ),
          child: const Text(
            "Upload Result",
            style: TextStyle(
                fontSize: 18,
                fontFamily: " Montserrat",
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 33.33,
                  width: 165.83,
                  margin: EdgeInsets.only(top: 41, left: 21.01),
                  child: Text(
                    "Available Drugs",
                    style: TextStyle(
                        color: const Color(0xFF033A64),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Montserrat"),
                  ),
                ),
                AvailableDrugsCard(),
                AvailableDrugsCard(),
                Container(
                  height: 33.33,
                  width: 198.28,
                  margin: EdgeInsets.only(
                    top: 32,
                    left: 18.67,
                  ),
                  child: Text(
                    "Unavailable Drugs",
                    style: TextStyle(
                        color: const Color(0xFF033A64),
                        fontSize: 18,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700),
                  ),
                ),
                AvailableDrugsCard(),
                Container(
                  height: 53,
                  width: 301.94,
                  margin: const EdgeInsets.only(
                      top: 117.49, left: 56.03, right: 56.03),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 230, 240, 244),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Button(
                    text: "Check out",
                    height: 18,
                    width: 99,
                    style: TextStyle(
                        color: AppColors.primaryWhiteColor,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
