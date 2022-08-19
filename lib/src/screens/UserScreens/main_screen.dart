// ignore_for_file: unused_import

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      UserState userState = Provider.of<UserState>(context, listen: false);
      userState.getStoreUserInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      extendBody: true,
      body: const HomeScreen(),
    );
  }
}
