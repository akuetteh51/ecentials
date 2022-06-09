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
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';

class ScanDocument extends StatefulWidget {
  const ScanDocument({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanDocument> createState() => _ScanDocumentState();
}

class _ScanDocumentState extends State<ScanDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Scan document",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).disabledColor.withOpacity(.75),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).disabledColor.withOpacity(.75),
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(children: [
            Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryDeepColor.withOpacity(.035),
                    borderRadius: BorderRadius.circular(8.0)),
                height: 163.64,
                width: 200,
                margin: const EdgeInsets.only(
                  top: 60.39,
                  left: 80,
                  right: 80,
                ),
                child: Image.asset("assets/images/Vector3.png")),
            Container(
                // color: Colors.amber,
                // height: 25.33,
                // width: 223.37,
                margin: const EdgeInsets.only(
                  top: 48.57,
                  // left: 95.32,
                  // right: 95.32,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Scan your document and  submit ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF033A64),
                        fontFamily: "Montserrat",
                      )),
                )),
            const SizedBox(
              height: 80.0,
            ),
            Container(
              height: 53,
              width: 301.94,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 230, 240, 244),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Button(
                onTap: () {
                  Get.to(() => ScanResults());
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
