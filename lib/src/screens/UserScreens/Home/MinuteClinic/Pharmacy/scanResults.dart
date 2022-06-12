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

class ScanResults extends StatefulWidget {
  const ScanResults({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanResults> createState() => _ScanResultsState();
}

class _ScanResultsState extends State<ScanResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).disabledColor.withOpacity(.75),
            )),
        centerTitle: true,
        title: Text(
          "Scan Result",
          style: TextStyle(
              fontSize: 18,
              fontFamily: " Montserrat",
              color: Theme.of(context).disabledColor.withOpacity(.75),
              fontWeight: FontWeight.w500),
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
                SizedBox(
                  height: 60,
                ),
                Center(
                  child: Container(
                    height: 53,
                    width: 301.94,
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
                ),
              ],
            )),
      ),
    );
  }
}
