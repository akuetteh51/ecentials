// ignore_for_file: unused_import

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/ChatHomePage.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/home.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Notifications/notifications.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widgets/CurvedBottomBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // App Bar
    final _appBar = AppBar(
      backgroundColor: AppColors.primaryWhiteColor,
      foregroundColor: AppColors.primaryBlackColor,
      elevation: 0,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            EcentialsIcons.menu_icon,
            color: AppColors.primaryDeepColor,
          ),
        ),
      ),
      title: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Image.asset(
          "assets/images/logo.png",
          scale: 1.5,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: GestureDetector(
            onTap: () {
              Get.to(
                () => const ProfileScreen(),
                transition: Transition.rightToLeft,
                duration: const Duration(milliseconds: 300),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile_image.png"),
            ),
          ),
        )
      ],
    );

    // Pages
    final _pages = [
      const Home(),
      Stores(),
      const Notifications(),
      const ChatHomePage(),
    ];

    // BottomNavigation Bar

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: currentIndex == 0 ? _appBar : null,
      drawer: const NavDrawer(),
      bottomNavigationBar: CurvedBottomBar(
        currentIndex: onTap,
      ),
      body: _pages[currentIndex],
    );
  }
}
