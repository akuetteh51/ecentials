// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/information.dart';
import 'package:flutter/material.dart';

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
  final _text = [
    "ANDREWS OPOKU",
    "AOPOKU255@GMAIL.COM",
    "+233545098438",
    "MALE",
    "PLT 16 BLK III",
    "MEDICAL DOCTOR",
    "093356147",
    "6.0ft",
    "80 lbs",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) => Information(
            heading: _heading[index],
            text: _text[index],
          ),
        ),
      ),
    );
  }
}
