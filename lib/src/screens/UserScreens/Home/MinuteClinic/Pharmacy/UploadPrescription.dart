// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/orderProcessed.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/orderSubmitted.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanDocument.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class UploadPrescription extends StatefulWidget {
  const UploadPrescription({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadPrescription> createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
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
          title: Container(
            //   margin: EdgeInsets.only(left: 19.75,),
            child: const Text(
              "UPLOAD PRESCRIPTION",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(left: 55.41, top: 0, right: 24.67),
              child: IconButton(
                onPressed: () {
                  Get.to(() => ScanDocument());
                },
                icon: Icon(
                  EcentialsIcons.cart,
                  color: AppColors.primaryDeepColor,
                  size: 30,
                ),
              ),
            ),
          ]),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        child: GestureDetector(
          onTap: () {
            Get.to(() => OrderSubmitted());
          },
          child: Button(
            text: "Submit order",
            color: const Color(0xFF033A64),
            style: TextStyle(
              color: AppColors.primaryWhiteColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(children: [
              Container(
                  margin: const EdgeInsets.only(top: 69.72, left: 130.88),
                  height: 66.67,
                  width: 50,
                  child: Image.asset("assets/images/vector2.png")),
              Container(
                margin: const EdgeInsets.only(top: 78.67, left: 10.65),
                height: 33.33,
                width: 91.59,
                child: RichText(
                  text: TextSpan(
                    text: "Upload ",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Roboto Mono",
                      color: const Color(0xFF033A64),
                    ),
                    children: [
                      TextSpan(
                          text: "Prescription",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto Mono",
                            color: const Color(0xFF033A64),
                          )),
                    ],
                  ),
                ),
              ),
            ]),
            Container(
              margin:
                  const EdgeInsets.only(top: 22.67, right: 193.6, left: 79.4),
              height: 20.54,
              width: 141,
              child: Text(
                "Fellow these steps ",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Roboto Mono",
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF033A64),
                ),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(top: 22.67, right: 193.6, left: 79.4),
              height: 20.54,
              width: 141,
              child: Text(
                "Fellow these steps ",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Roboto Mono",
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF033A64),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
