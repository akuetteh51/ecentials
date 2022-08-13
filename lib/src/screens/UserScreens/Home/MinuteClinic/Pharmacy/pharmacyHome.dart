// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/CurvedBottomBar.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/FindDrug.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/pharmacyDashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Themes/ecentials_icons_icons.dart';
import '../../../../../Widgets/navDrawer.dart';
import '../../../../../Widgets/searchForh.dart';
import '../../../Chat/ChatHomePage.dart';
import '../../../Notifications/notifications.dart';
import '../../../Store/store.dart';
import '../../Profiles/profileScreen.dart';
import 'cart.dart';

class PharmacyHome extends StatefulWidget {
  const PharmacyHome({Key? key}) : super(key: key);

  @override
  State<PharmacyHome> createState() => _PharmacyHomeState();
}

class _PharmacyHomeState extends State<PharmacyHome> {
  int currentIndex = 0;
  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      toolbarHeight: 70,
      elevation: 0,
      backgroundColor: AppColors.primaryWhiteColor,
      // backgroundColor: Colors.amber,
      foregroundColor: AppColors.primaryBlackColor,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(
            EcentialsIcons.menu_icon,
            color: AppColors.primaryDeepColor,
            size: 20,
          ),
        ),
      ),
      title: RichText(
        text: TextSpan(
          text: "Hi, ",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Montserrat",
            color: AppColors.primaryDeepColor,
          ),
          children: [
            TextSpan(
                text: "Sussan",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                  color: AppColors.primaryDeepColor,
                )),
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: (() {
            Get.to(
              () => const ProfileScreen(),
              transition: Transition.leftToRight,
            );
          }),
          child: const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/profile.png"),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            right: 20,
            left: 10,
          ),
          child: IconButton(
            onPressed: () {
              Get.to(() => const Cart());
            },
            icon: Icon(
              EcentialsIcons.cart,
              color: AppColors.primaryDeepColor,
              size: 40,
            ),
          ),
        )
      ],
      bottom: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        title: Search4(
          searchPressed: () {
            Get.to(() => FindDrug()); 
          },
          micPressed: () {},
          width: MediaQuery.of(context).size.width,
          text: "Enter your search term here ",
        ),
        centerTitle: true,
      ),
    );

    // Screens
    final _pages = [
      const PharmacyDashboard(),
      Stores(),
      const Notifications(),
      const ChatHomePage(),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: currentIndex == 0 ? _appBar : null,
      drawer: currentIndex == 0 ? const NavDrawer() : null,
      bottomNavigationBar: CurvedBottomBar(
        currentIndex: onTap,
      ),
      body: _pages[currentIndex],
    );
  }
}
