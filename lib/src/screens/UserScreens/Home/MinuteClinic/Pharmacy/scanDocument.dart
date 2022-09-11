// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:io';

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/image_upload_options.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/pharmacyCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ScanDocument extends StatefulWidget {
  const ScanDocument({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanDocument> createState() => _ScanDocumentState();
}

class _ScanDocumentState extends State<ScanDocument> {
  final ImagePicker _picker = ImagePicker();
  File? image;

  Future pickImage(ImageSource source) async {
    UserState userState = Provider.of<UserState>(context, listen: false);
    final XFile? capture;
    Get.back();
    try {
      if (source == ImageSource.camera) {
        capture = await _picker.pickImage(source: ImageSource.camera);
        if (capture == null) return;
        setState(() {
          image = File(capture!.path);
        });
      } else {
        capture = await _picker.pickImage(source: ImageSource.gallery);
        if (capture == null) return;
        setState(() {
          image = File(capture!.path);
        });
      }
      await userState.uploadPrescription(
          token: userState.userInfo?['token'], picture: image);
    } on PlatformException catch (e) {
      log("Error: $e");
    }
  }

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
        body: image == null
            ? SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.primaryDeepColor
                                      .withOpacity(.035),
                                  borderRadius: BorderRadius.circular(8.0)),
                              height: 200,
                              width: 200,
                              child: Center(
                                  child: Image.asset(
                                      "assets/images/Vector3.png"))),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 32.0),
                          child: Text("Scan your document and  submit ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF033A64),
                                fontFamily: "Montserrat",
                              )),
                        ),
                        Container(
                          height: 46,
                          width: 320,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 230, 240, 244),
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Button(
                            onTap: () {
                              _showPickImageOptions(context);
                            },
                            text: "Scan",
                            height: 20,
                            width: 32,
                            style: TextStyle(
                                color: AppColors.primaryWhiteColor,
                                fontSize: 15,
                                fontFamily: "Roboto Mono",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ]),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                    color: AppColors.primaryDeepColor),
              ));
  }

  void _showPickImageOptions(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 1,
        backgroundColor: Theme.of(ctx).canvasColor,
        context: ctx,
        builder: (ctx) => Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UploadOption(
                    label: "Camera",
                    description: "Take a picture",
                    onTap: () => pickImage(ImageSource.camera),
                  ),
                  UploadOption(
                    label: "Gallery",
                    description: "Select picture from gallery",
                    onTap: () => pickImage(ImageSource.gallery),
                  ),
                ],
              ),
            ));
  }
}
