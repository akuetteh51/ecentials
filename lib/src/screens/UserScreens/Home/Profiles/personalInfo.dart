// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/information.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/UserDataModel.dart';
import '../../../../app_state/user_state.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _heading = [
    "NAME",
    "EMAIL",
    "PHONE NUMBER",
    "GENDER",
    "ADDRESS",
    "OCCUPATION",
    "GHANA CARD NUMBER",
    "HEIGHT",
    "WEIGHT",
  ];

  List<String> _text = [];

  getUserDataFromServer() {
    UserState userState = Provider.of<UserState>(context, listen: false);
    // Map<String, dynamic>? res = userState.userInfo;
    // log(res?['token']);
    userState
        .getUserInfoFromServer(token: userState.userInfo?['token'])
        .then((UserDataModel? user) {
      if (user != null) {
        setState(() {
          _text = [
          userState.userDataModel?.name ?? "ANDREWS OPOKU",
          userState.userDataModel?.email ?? "AOPOKU255@GMAIL.COM",
          userState.userDataModel?.phone ?? "+233545098438",
          userState.userDataModel?.gender ?? "MALE",
          userState.userDataModel?.address ?? "PLT 16 BLK III",
          userState.userDataModel?.occupation ?? "MEDICAL DOCTOR",
          userState.userDataModel?.ghana_card_number ?? "093356147",
          userState.userDataModel?.height.toString() ?? "6.0ft",
          userState.userDataModel?.weight.toString() ?? "80 lbs",
        ];
        });      
      }
    });
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
    UserState userState = Provider.of<UserState>(context, listen: false);
    print(userState.fetchInfoLoaderState);
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        title: Text(
          "Personal Information",
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black54,
          ),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        margin: EdgeInsets.all(20),
        child: userState.fetchInfoLoaderState == 2
            ? ListView.builder(
                itemCount: 9,
                itemBuilder: (context, index) => Information(
                  heading: _heading[index],
                  text: _text[index],
                ),
              )
            : userState.fetchInfoLoaderState == 0 ||
                    userState.fetchInfoLoaderState == 1
                ? Center(
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primaryDeepColor)),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      getUserDataFromServer();
                    },
                    child: Center(
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
    );
  }
}
