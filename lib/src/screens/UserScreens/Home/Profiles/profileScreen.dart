// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/EducationalInfo.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/HealthInformation.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/editProfile.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/personalInfo.dart';
import 'package:get/get.dart';
// import 'package:sliver_fab/sliver_fab.dart';
import 'package:ecentialsclone/src/Widgets/sliverFab.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:ecentialsclone/src/Widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Text
    final _topText = [
      "Personal",
      "Health",
      "Educational",
    ];

    // Pages
    final _pages = [
      PersonalInfo(),
      PersonalInfo(),
      EducationalInfo(),
    ];
    String text = "";
    String text2 = "";

    Future confirmPin() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SizedBox(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text == text2
                        ? Icon(
                            EcentialsIcons.secure,
                            color: AppColors.primaryGreenColor,
                          )
                        : Icon(
                            EcentialsIcons.lock,
                            color: AppColors.primaryDeepColor,
                          ),
                    const Text(
                      "Re-enter 4-digit Pincode",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    PinCodeTextField(
                      enableActiveFill: true,
                      appContext: context,
                      length: 4,
                      onChanged: (String value) {},
                      onCompleted: (pintwo) {
                        text2 = pintwo;
                        Navigator.of(context).pop();
                        text == text2
                            ? Get.to(
                                () => HealthInformation(),
                              )
                            : ProfileScreen();
                      },
                      enablePinAutofill: false,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      showCursor: false,
                      autoFocus: true,
                      obscuringWidget: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.primaryDeepColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        fieldHeight: 30,
                        fieldWidth: 30,
                        activeFillColor: AppColors.primaryDeepColor,
                        inactiveColor:
                            AppColors.primaryBlackColor.withOpacity(.10),
                        selectedColor:
                            AppColors.primaryBlackColor.withOpacity(.20),
                        selectedFillColor:
                            AppColors.primaryBlackColor.withOpacity(.20),
                        activeColor: AppColors.primaryDeepColor,
                        borderWidth: 0.0,
                        errorBorderColor:
                            AppColors.primaryBlackColor.withOpacity(.20),
                        inactiveFillColor:
                            AppColors.primaryBlackColor.withOpacity(.20),
                      ),
                      animationType: AnimationType.fade,
                    ),
                  ],
                ),
              ),
            ));

    Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      EcentialsIcons.lock,
                      color: AppColors.primaryDeepColor,
                    ),
                    const Text(
                      "Enter your 4-digit Pincode",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    PinCodeTextField(
                      enableActiveFill: true,
                      appContext: context,
                      length: 4,
                      onChanged: (String value) {},
                      onCompleted: (pinone) {
                        Navigator.of(context).pop();
                        text = pinone;

                        confirmPin();
                      },
                      enablePinAutofill: false,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      showCursor: false,
                      autoFocus: true,
                      obscuringWidget: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.primaryDeepColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.circle,
                        fieldHeight: 30,
                        fieldWidth: 30,
                        activeFillColor: AppColors.primaryDeepColor,
                        inactiveColor:
                            AppColors.primaryBlackColor.withOpacity(.10),
                        selectedColor:
                            AppColors.primaryBlackColor.withOpacity(.20),
                        selectedFillColor:
                            AppColors.primaryBlackColor.withOpacity(.20),
                        activeColor: AppColors.primaryDeepColor,
                        borderWidth: 0.0,
                        errorBorderColor:
                            AppColors.primaryBlackColor.withOpacity(.20),
                        inactiveFillColor:
                            AppColors.primaryBlackColor.withOpacity(.20),
                      ),
                      animationType: AnimationType.fade,
                    ),
                  ],
                ),
              ),
            ));

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      body: SliverFab(
        floatingWidget: FloatingActionButton(
          backgroundColor: AppColors.primaryOrangeColor,
          onPressed: () {
            Get.to(
              () => EditProfile(),
              transition: Transition.circularReveal,
              duration: Duration(seconds: 1),
            );
          },
          child: Image.asset(
            "assets/images/circular_pencil.png",
            scale: 1,
          ),
        ),
        floatingPosition: const FloatingPosition(
          right: 32,
        ),
        expandedHeight: MediaQuery.of(context).size.height * 0.4,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            backgroundColor: AppColors.primaryDeepColor,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
              ),
            ),
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  "Andrews",
                  style: TextStyle(
                      color: AppColors.primaryWhiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "aopoku255@gmail.com",
                  style: TextStyle(
                    color: AppColors.primaryWhiteColor,
                  ),
                ),
              ),
              background: Image.asset(
                "assets/images/profile.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Button(
                text: "Complete Profile",
                style: TextStyle(
                  color: AppColors.primaryWhiteColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 40,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 40.0,
                mainAxisExtent: 150,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return InfoCard(
                    onTap: () {
                      index == 1 ? openDialog() : Get.to(() => _pages[index]);
                    },
                    topText: _topText[index],
                    bottomText: "Information",
                    showlock: index == 1 ? true : false,
                  );
                },
                childCount: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
