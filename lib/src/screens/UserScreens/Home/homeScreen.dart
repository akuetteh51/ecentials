import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/Dashboard.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/chat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulanceNear.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/minuteClinic.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/setting.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/home.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Notifications/notifications.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        margin: EdgeInsets.only(bottom: 5),
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
                () => ProfileScreen(),
                transition: Transition.rightToLeft,
                duration: Duration(seconds: 1),
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
      Home(),
      Stores(),
      Notifications(),
      Chat(),
    ];

    final _myAppBar = AppBar(
      backgroundColor: AppColors.primaryWhiteColor,
      elevation: 0,
    );

    // BottomNavigation Bar

    final _icons = [
      Icon(
        EcentialsIcons.home,
        color: AppColors.primaryWhiteColor,
      ),
      Icon(
        EcentialsIcons.sell,
        color: AppColors.primaryWhiteColor,
      ),
      Icon(
        EcentialsIcons.notification,
        color: AppColors.primaryWhiteColor,
      ),
      Icon(
        EcentialsIcons.chat_heart,
        color: AppColors.primaryWhiteColor,
      ),
    ];

// Icons tooltips
    final _tooltip = [
      "Home",
      "Store",
      "Notifications",
      "Chat Bot",
    ];

    final _bottomNavigationBar = Container(
      height: 70,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomAppBar(
          color: AppColors.primaryDeepColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              4,
              (index) => IconButton(
                onPressed: () => onTap(index),
                tooltip: _tooltip[index],
                icon: _icons[index],
              ),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: currentIndex == 0
          ? _appBar
          : currentIndex == 1
              ? _myAppBar
              : currentIndex == 2
                  ? null
                  : _myAppBar,
      drawer: NavDrawer(),
      bottomNavigationBar: _bottomNavigationBar,
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _pages[currentIndex],
    );
  }
}
