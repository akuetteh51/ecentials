import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/addSchoolButton.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
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
    return

        //bottom navbar
        // BottomNavBar(
        //   backgroundColor: AppColors.primaryDeepColor,
        // );
        Scaffold(
            body: Center(
                child: LabResultsCrad(
                    image: "assets/images/card-1.png",
                    labName: "labName",
                    openingHours: "openingHours")));
  }
}
