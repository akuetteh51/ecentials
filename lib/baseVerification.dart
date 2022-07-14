import 'package:ecentialsclone/src/screens/AuthScreens/login.dart';
import 'package:ecentialsclone/src/screens/UserScreens/main_screen.dart';
import 'package:ecentialsclone/src/screens/onboardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/app_state/AuthState.dart';

class BaseVerification extends StatefulWidget {
  const BaseVerification({Key? key}) : super(key: key);

  @override
  State<BaseVerification> createState() => _BaseVerificationState();
}

class _BaseVerificationState extends State<BaseVerification> {
  getLoginStateAndMoveToAppropriateScreen() async {
    AuthState authState = Provider.of<AuthState>(context, listen: false);

    bool? walkedPass = await authState.getWalkThroughPass();

    bool? res = await authState.getLoginState();

    // Check if user has passed walkthrough
    if (walkedPass == true) {
      // Verify if user has logged in already, if not send them to login screen
      if (res == true) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (builder) => const MainScreen()),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (builder) => Login()), (route) => false);
      }
    } else {
      // user has no logged in so send him to OnBoardingScreen
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) => const OnboardingScreen()),
          (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getLoginStateAndMoveToAppropriateScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "LOADING...",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
