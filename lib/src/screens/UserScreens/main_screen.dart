import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/chat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/homeScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Notifications/notifications.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/store.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Setting index to navigate to current page
  int currentIndex = 0;
  Future<void> onPress(int index) async {
    int myIndex = index;
    setState(() {
      currentIndex = myIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pages
    final _pages = [
      HomeScreen(),
      Stores(),
      Notifications(),
      Chat(),
    ];

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
          icon: const Icon(EcentialsIcons.menu_icon),
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
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/profile_image.png"),
          ),
        )
      ],
    );

    return Scaffold(
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        onPressed: onPress,
      ),
      appBar: _appBar,
      drawer: const NavDrawer(),
      body: _pages[currentIndex],
    );
  }
}
