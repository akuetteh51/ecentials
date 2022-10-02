// ignore_for_file: unused_import

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/app_state/pharmacy_state.dart';
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

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      UserState userState = Provider.of<UserState>(context, listen: false);
      PharmacyState pharmacyState =
          Provider.of<PharmacyState>(context, listen: false);
      await userState.getStoreUserInfo();
      await pharmacyState.fetchBookmarkedDrugs(
          token: userState.userInfo?['token']);
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
