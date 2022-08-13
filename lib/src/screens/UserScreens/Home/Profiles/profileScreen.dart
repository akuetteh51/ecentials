// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/pinloader.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/EducationalInfo.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/HealthInformation.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/editProfile.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/personalInfo.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
// import 'package:sliver_fab/sliver_fab.dart';
import 'package:ecentialsclone/src/Widgets/sliverFab.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/resetPinGuardPassword.dart';
import '../../../../app_state/Health_Info_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  getPinLocallyBeforeVerify(
      {required HealthInformationState healthInformationState,
      required Function showDialog}) {
    showDialog.call();
  }

  Future openDialog(
          {required HealthInformationState healthInformationState,
          required UserState userState}) =>
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * .45,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.close,
                                color: Theme.of(context).disabledColor,
                                // size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            EcentialsIcons.lock,
                            color: AppColors.primaryDeepColor,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Enter your 4-digit Pincode to Login/Create",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PinCodeTextField(
                            enableActiveFill: true,
                            appContext: context,
                            length: 4,
                            onChanged: (String pinone) {
                              if (pinone.length == 4) {
                                text = pinone;
                                // text = pinone;
                                healthInformationState.createPin(
                                    context: context,
                                    actions: ["Verifying", "Verified"],
                                    token: userState.userInfo?['token'],
                                    dataToSend: {
                                      "pin": text,
                                    },
                                    callback: () {
                                      // save pin code
                                      healthInformationState
                                          .saveHealthPinLocally(text);
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  HealthInformation()));
                                    });
                              }
                            },
                            onCompleted: (pinone) {
                              // Navigator.of(context).pop();

                              // confirmPin();
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
                      PinLoader(),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Forgot your pin?",
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                              )),
                          // PinCheck
                          TextSpan(
                              text: "  reset your pin",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (builder) =>
                                          ResetPinGuardPassword()));
                                },
                              style:
                                  TextStyle(color: AppColors.primaryDeepColor))
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ));

  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context);
    HealthInformationState healthInformationState =
        Provider.of<HealthInformationState>(context);

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
              centerTitle: true,
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    userState.userInfo?['name'] ?? "no username",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.primaryWhiteColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userState.userInfo?['email'] ?? "aopoku255@gmail.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.primaryWhiteColor,
                    ),
                  ),
                ],
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
                      if (index == 0) {
                        userState.setFetchInfoLoaderState(0);
                      } else if (index == 1) {
                        getPinLocallyBeforeVerify(
                            healthInformationState: healthInformationState,
                            showDialog: () {
                              healthInformationState.saveHealthPinLocally("");
                              openDialog(
                                  healthInformationState:
                                      healthInformationState,
                                  userState: userState);
                            });
                      } else {
                        Get.to(() => _pages[index]);
                      }
                    },
                    topText: _topText[index],
                    bottomText: "Information",
                    showlock: index == 1 ? true : false,
                  );
                },
                childCount: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
