// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/pharmacyCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/pharmacyDashboard2.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';

class pharmacyDashboard4 extends StatefulWidget {
  const pharmacyDashboard4({
    Key? key,
  }) : super(key: key);

  @override
  State<pharmacyDashboard4> createState() => _pharmacyDashboard4State();
}

class _pharmacyDashboard4State extends State<pharmacyDashboard4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(children: [
            Container(
                height: 163.64,
                width: 200,
                margin: const EdgeInsets.only(
                  top: 140.39,
                  left: 107,
                  right: 107,
                ),
                child: Image.asset("assets/images/Vector3.png")),
            Container(
                height: 25.33,
                width: 223.37,
                margin: const EdgeInsets.only(
                  top: 48.57,
                  left: 95.32,
                  right: 95.32,
                ),
                child: Text("Scan your document and  submit ",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF033A64),
                      fontFamily: "Montserrat",
                    ))),
            Container(
              height: 53,
              width: 301.94,
              margin:
                  const EdgeInsets.only(top: 171.79, left: 56.03, right: 56.03),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 230, 240, 244),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Button(
                onTap: () {
              Get.to(() => pharmacyDashboard2());
             },
                text: "Scan",
                height: 20,
                width: 37,
                style: TextStyle(
                    color: AppColors.primaryWhiteColor,
                    fontSize: 15,
                    fontFamily: "Roboto Mono",
                    fontWeight: FontWeight.w400),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
