import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Agreement extends StatelessWidget {
  const Agreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Agreement Button
    final _agreementButton = Button(
      text: "Agree and Continue",
      height: 60,
      radius: 0,
      style: TextStyle(
        color: AppColors.primaryWhiteColor,
        fontSize: 20,
      ),
      onTap: () {
        Get.to(() => Registration());
      },
    );

    // App Bar
    final _appBar = AppBar(
      backgroundColor: AppColors.primaryWhiteColor,
      foregroundColor: AppColors.primaryBlackColor,
      elevation: 0,
      title: const Text(
        "Summary Terms and Conditions",
        style: TextStyle(fontSize: 16),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      extendBody: true,
      bottomNavigationBar: _agreementButton,
      appBar: _appBar,
    );
  }
}
