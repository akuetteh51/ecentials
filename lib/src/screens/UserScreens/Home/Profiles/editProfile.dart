import 'dart:developer';

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
  TextEditingController genderController = TextEditingController();
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
        return genderController;
      case 4:
        return addressController;
      case 5:
        return occupationController;
      case 6:
        return idCardController;
      case 7:
        return heightController;
      case 8:
        return weigthController;
      default:
        return nameController;
    }
  }

  final _heading = [
    "Name *",
    "Email *",
    "Phone Number *",
    "Gender *",
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

  keyInputType(int value) {
    switch (value) {
      case 0:
        return TextInputType.name;
      case 1:
        return TextInputType.emailAddress;
      case 2:
        return TextInputType.phone;
      case 3:
        return TextInputType.name;
      case 4:
        return TextInputType.streetAddress;
      case 5:
        return TextInputType.text;
      case 6:
        return TextInputType.text;
      case 7:
        return TextInputType.number;
      case 8:
        return TextInputType.number;
      default:
        return TextInputType.name;
    }
  }

  handleInputUpdateValidate() {
    UserState userState = Provider.of<UserState>(context, listen: false);

    // Check if compulsory fields are not empty
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        idCardController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        occupationController.text.isNotEmpty) {
      if (genderController.text.toLowerCase() == "male" ||
          genderController.text.toLowerCase() == "female" ||
          genderController.text.toLowerCase() == "other") {
        Map<String, dynamic>? dataToSend = {
          "name": nameController.text,
          "address": addressController.text,
          "gender": genderController.text,
          "occupation": occupationController.text,
          "phone": phoneController.text,
        };

        if (heightController.text.isNotEmpty) {
          dataToSend["height"] = num.tryParse(heightController.text) ?? 0.0;
        }
        if (weigthController.text.isNotEmpty) {
          dataToSend["weight"] = num.tryParse(weigthController.text) ?? 0.0;
        }

        // Request to update data
        userState.updateUserInfo(data: dataToSend);
      } else {
        ShowToast.ecentialsToast(
          message: "Gender must be male female or other",
        );
      }
    } else {
      ShowToast.ecentialsToast(
        message: "Fiels marked (*) are required",
      );
    }
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
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                children: List.generate(
                  _heading.length,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 20),
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

// borderRadius: BorderRadius.circular(10),
                      
                      // child:
                       TextFormField(                        
                        keyboardType: keyInputType(index),
                        controller: giveControllerToUse(index),
                        cursorColor: AppColors.primaryDeepColor,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10,

                          ),
                        ),
      ),],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(

                margin: const EdgeInsets.only(
                left: 60,
                right: 60,
                bottom: 100,
                top: 5,

              ),
              child: userState.updateInfoLoaderState == 0 ||
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
                  : loadingButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.primaryDeepColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: SizedBox(
          height: 15,
          width: 15,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
    );
  }
}
