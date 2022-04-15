import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/addSchoolButton.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/schoolsAttendedCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:flutter/material.dart';

class TestWidgetsScreen extends StatefulWidget {
  const TestWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<TestWidgetsScreen> createState() => _TestWidgetsScreenState();
}

class _TestWidgetsScreenState extends State<TestWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return const BottomNavBar(
      body: Center(
          child: LabResultsCrad(
        image: "assets/images/card.png",
        labName: "Ziky Clinical Laboratory",
        openingHours: "7:00am - 5:00pm",
        service1: " Research |",
        service2: " Test |",
        service3: " Examination |",
        service4: " X-Rays ",
        price: "12",
      )),
    );
  }
}
