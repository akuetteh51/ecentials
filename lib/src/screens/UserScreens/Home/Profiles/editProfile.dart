import 'dart:developer';

import 'package:ecentialsclone/models/UserDataModel.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:ecentialsclone/src/Widgets/sliverFab.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/EcentialsToast.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController idCardController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weigthController = TextEditingController();

  giveControllerToUse(int value) {
    switch (value) {
      case 0:
        return nameController;
      case 1:
        return emailController;
      case 2:
        return phoneController;
      case 3:
        return addressController;
      case 4:
        return occupationController;
      case 5:
        return idCardController;
      case 6:
        return heightController;
      case 7:
        return weigthController;
      default:
        return nameController;
    }
  }

  final _heading = [
    "Name *",
    "Email *",
    "Phone Number *",
    "Address *",
    "Occupation *",
    "Ghana Card Number *",
    "Height (ft)",
    "Weight (lbs)",
  ];
  // final _text = [
  //   "ANDREWS OPOKU",
  //   "AOPOKU255@GMAIL.COM",
  //   "+233545098438",
  //   "MALE",
  //   "PLT 16 BLK III",
  //   "MEDICAL DOCTOR",
  //   "093356147",
  //   "6.0",
  //   "80",
  // ];

  getUserDataFromServer() {
    UserState userState = Provider.of<UserState>(context, listen: false);
    // Map<String, dynamic>? res = userState.userInfo;
    // log(res?['token']);
    userState
        .getUserInfoFromServer(token: userState.userInfo?['token'])
        .then((UserDataModel? user) {
      if (user == null) {
      } else {
        setState(() {
          nameController.text = user.name!;
          emailController.text = user.email!;
          phoneController.text = user.phone!;
          addressController.text = user.address!;
          occupationController.text = user.occupation!;
          idCardController.text = user.ghana_card_number!;
          heightController.text = user.height.toString();
          weigthController.text = user.weight.toString();
          selectedDate = user.dob?.split(" ").first;
        });
      }
    });
  }

  keyInputType(int value) {
    switch (value) {
      case 0:
        return TextInputType.name;
      case 1:
        return TextInputType.emailAddress;
      case 2:
        return TextInputType.phone;
      case 3:
        return TextInputType.streetAddress;
      case 4:
        return TextInputType.text;
      case 5:
        return TextInputType.text;
      case 6:
        return TextInputType.number;
      case 7:
        return TextInputType.number;
      default:
        return TextInputType.name;
    }
  }

  handleInputUpdateValidate() {
    UserState userState = Provider.of<UserState>(context, listen: false);

    // Check if compulsory fields are not empty
    if (nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        idCardController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        occupationController.text.isNotEmpty) {
      if (selectedGender != null && selectedDate != null) {
        Map<String, dynamic>? dataToSend = {
          "name": nameController.text,
          "address": addressController.text,
          "gender": selectedGender,
          "occupation": occupationController.text,
          "phone_number": phoneController.text,
          "dob": "${pickedDate.toUtc()}",
          "ghana_card_number": idCardController.text,
        };

        bool heightIsNull = false;
        bool weightIsNull = false;

        if (heightController.text.isNotEmpty) {
          if (num.tryParse(heightController.text) == null) {
            heightIsNull = true;
          } else {
            dataToSend["height"] = num.tryParse(heightController.text) ?? 0.0;
          }
        } else {
          heightIsNull = false;
        }
        if (weigthController.text.isNotEmpty) {
          if (num.tryParse(weigthController.text) == null) {
            weightIsNull = true;
          } else {
            dataToSend["weight"] = num.tryParse(weigthController.text) ?? 0.0;
          }
        } else {
          weightIsNull = false;
        }

        if (heightIsNull == true || weightIsNull == true) {
          ShowToast.ecentialsToast(
            message: "Height or Weight not properly formated",
          );
        } else {
          // Request to update data          
          userState.updateUserInfo(
              data: dataToSend, token: userState.userInfo?['token']);
        }
      } else {
        ShowToast.ecentialsToast(
          message: "Gender & DOB must not be empty",
        );
      }
    } else {
      ShowToast.ecentialsToast(
        message: "Fields marked (*) are required",
      );
    }
  }

  DateTime pickedDate = DateTime.now();

  String? selectedGender;

  List<String> genders = ["Male", "Female", "Other"];

  String? selectedDate;

  Future selectDate(
    BuildContext context,
  ) async {
    final DateTime? response = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (response != null && response != pickedDate) {
      setState(() {
        pickedDate = response;
        selectedDate = pickedDate.day.toString() +
            "-" +
            pickedDate.month.toString() +
            "-" +
            pickedDate.year.toString();

        log("DAte: ${pickedDate.toUtc()}");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getUserDataFromServer();
    });
  }

  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: const FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SliverFab(
        floatingWidget: Center(
          child: GestureDetector(
            onTap: () {
              Get.to(() => const ProfileScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border:
                    Border.all(color: AppColors.primaryWhiteColor, width: 5),
              ),
              child: CircleAvatar(
                radius: 70,
                backgroundColor: AppColors.primaryWhiteColor,
                backgroundImage: const AssetImage(
                  "assets/images/profile.png",
                ),
              ),
            ),
          ),
        ),
        floatingPosition: const FloatingPosition(
          right: 0,
          left: 0,
        ),
        expandedHeight: MediaQuery.of(context).size.height * 0.2,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.27,
            backgroundColor: AppColors.primaryDeepColor,
            pinned: true,
            floating: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
              ),
            ),
            title: const Text("Edit Profile"),
            centerTitle: true,
            actions: [
              Container(
                child: const Icon(Icons.share),
                margin: const EdgeInsets.only(
                  right: 10,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                top: 70,
              ),
              child: Center(
                child: TextButton(
                  child: Text(
                    "Change Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryBlackColor.withOpacity(.50),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 2,
              ),
              child: userState.fetchInfoLoaderState == 2
                  ? Column(
                      children: List.generate(
                        _heading.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _heading[index],
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                enabled: index == 1 &&
                                        emailController.text.isNotEmpty
                                    ? false
                                    : true,
                                keyboardType: keyInputType(index),
                                controller: giveControllerToUse(index),
                                cursorColor: AppColors.primaryDeepColor,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3,
                                        color: AppColors.primaryDeepColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: AppColors.primaryDeepColor
                                          .withOpacity(.5),
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 3,
                                      color: Theme.of(context)
                                          .disabledColor
                                          .withOpacity(.06),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : userState.fetchInfoLoaderState == 0 ||
                          userState.fetchInfoLoaderState == 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                                width: 25,
                                child: Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          AppColors.primaryDeepColor)),
                                ),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            getUserDataFromServer();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.replay,
                                color: AppColors.primaryDeepColor,
                                size: 40,
                              ),
                            ),
                          ),
                        ),
            ),
          ),
          SliverToBoxAdapter(
            child: userState.fetchInfoLoaderState == 2
                ? Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender *",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: PopupMenuButton<String>(
                          onSelected: (String value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color:
                                    AppColors.primaryDeepColor.withOpacity(.2),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      selectedGender == null
                                          ? 'Select'
                                          : selectedGender.toString(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Theme.of(context)
                                            .disabledColor
                                            .withOpacity(.3),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(.3),
                                        )),
                                  ),
                                ],
                              )),
                          itemBuilder: (BuildContext context) =>
                              List<PopupMenuEntry<String>>.generate(
                            genders.length,
                            (index) => PopupMenuItem<String>(
                              value: genders[index],
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  genders[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "Dob *",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                color: AppColors.primaryDeepColor,
                                onPressed: () {
                                  selectDate(context);
                                },
                                child: Text(
                                  selectedDate == null
                                      ? 'Pick Date'
                                      : selectedDate!,
                                  style: TextStyle(
                                      color: Theme.of(context).canvasColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                left: 60,
                right: 60,
                bottom: 100,
                top: 5,
              ),
              child: userState.fetchInfoLoaderState == 2
                  ? (userState.updateInfoLoaderState == 0 ||
                          userState.updateInfoLoaderState == 2
                      ? Button(
                          text: "Update",
                          style: TextStyle(
                            color: AppColors.primaryWhiteColor,
                            fontSize: 20,
                          ),
                          onTap: () {
                            handleInputUpdateValidate();
                          },
                        )
                      : userState.updateInfoLoaderState == 3
                          ? loadingButton(
                              isRetry: true,
                              tap: () {
                                handleInputUpdateValidate();
                              })
                          : loadingButton())
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingButton({bool? isRetry, Function? tap}) {
    return GestureDetector(
      onTap: () {
        tap?.call();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryDeepColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: SizedBox(
            height: 15,
            width: 15,
            child: isRetry == true
                ? Icon(
                    Icons.replay_outlined,
                    color: Theme.of(context).canvasColor,
                  )
                : CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Theme.of(context).canvasColor,
                  ),
          ),
        ),
      ),
    );
  }
}
