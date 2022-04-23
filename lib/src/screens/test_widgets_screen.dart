import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/addSchoolButton.dart';

import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/cartCard.dart';
import 'package:ecentialsclone/src/Widgets/doctorCard.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';

import 'package:ecentialsclone/src/Widgets/schoolsAttendedCard.dart';
import 'package:ecentialsclone/src/Widgets/storeList.dart';
import 'package:flutter/material.dart';

class TestWidgetsScreen extends StatefulWidget {
  const TestWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<TestWidgetsScreen> createState() => _TestWidgetsScreenState();
}

class _TestWidgetsScreenState extends State<TestWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return BottomNavBar(
      body: Center(
          child: doctorCard(
              fname: "Jesse",
              lname: "Anim",
              role: "Doctor",
              hospital: "Hospital")),
    );
  }
}
