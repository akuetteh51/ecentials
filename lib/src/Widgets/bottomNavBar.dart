import 'package:flutter/material.dart';

import '../Themes/colors.dart';
import '../Themes/ecentials_icons_icons.dart';

class BottomNavBar extends StatelessWidget {
  final Color backgroundColor;
  final Widget? body;
  final AppBar? appBar;
  final Drawer? drawer;
  const BottomNavBar(
      {Key? key,
      this.backgroundColor = const Color(0xFF033A64),
      this.body,
      this.appBar,
      this.drawer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Icons
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

// Floating Ambulance Center docked
    final _floatinfAmbulance = Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/nav_ambulance.png"),
        ),
      ),
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      floatingActionButton: _floatinfAmbulance,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomAppBar(
            color: backgroundColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => _icons[index],
              ),
            ),
          ),
        ),
      ),
      appBar: appBar,
      body: body,
    );
  }
}
