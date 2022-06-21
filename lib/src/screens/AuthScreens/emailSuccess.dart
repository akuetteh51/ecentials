import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/login.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/reset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/button.dart';

class EmailSuccess extends StatelessWidget {
  EmailSuccess({Key? key}) : super(key: key);

  final _proceed = GestureDetector(
    onTap: () {
      Get.to(
        () => PasswordReset(),
        transition: Transition.fadeIn,
        duration: const Duration(seconds: 1),
      );
    },
    child: Button(
      onTap: () {
        Get.to(() => PasswordReset());
      },
      text: "Proceed",
      style: TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => Login());
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/email_success.png",
            ),
            const Text(
              "You have an account with us!",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Proceed to reset your password",
              style: TextStyle(),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(width: 200, child: _proceed)
          ],
        ),
      ),
    );
  }
}
