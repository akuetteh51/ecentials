// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/information.dart';
import 'package:flutter/material.dart';

class HealthInformation extends StatefulWidget {
  const HealthInformation({Key? key}) : super(key: key);

  @override
  State<HealthInformation> createState() => _HealthInformationState();
}

class _HealthInformationState extends State<HealthInformation> {
  final _heading = [
    "BLOOD GROUP",
    "GENOTYPE",
    "ALERGIES",
    "MEDICAL ID NUMBER",
    "PULSE RATE",
    "RESPIRATION RATE",
    "BLOOD PRESSURE",
    "TEMPERATURE",
  ];
  final _text = [
    "O RhD positive(O+)",
    "AA",
    "Cats, Pepper",
    "EC4744643",
    "200 bpm",
    "80 bpm",
    "40mm HG",
    "35.6 C",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        title: const Text(
          "Health Information",
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
          itemCount: _heading.length,
          itemBuilder: (context, index) => Information(
            heading: _heading[index],
            text: _text[index],
          ),
        ),
      ),
    );
  }
}
