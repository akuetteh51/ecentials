
// ignore_for_file: unused_import, must_be_immutable, unused_element, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_equal_for_default_values, no_logic_in_create_state, dead_code, non_constant_identifier_names

// ignore_for_file: unused_import, must_be_immutable, unused_element, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_equal_for_default_values

// ignore_for_file: unused_import, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:ecentialsclone/src/screens/UserScreens/Chat/ChatHomePage.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/homeScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Notifications/notifications.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/store.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';

import 'CurvedBottomBar.dart';

class BottomNavBar extends StatefulWidget {
  final Color backgroundColor;
  final onPressed;

  BottomNavBar(
      {Key? key,
      this.backgroundColor = const Color(0xFF033A64),

      //required SingleChildScrollView body,
      this.onPressed})
      : super(key: key);

  // this.backgroundColor = const Color(0xFF033A64),

  // this.index = 0,
  //this.onPressed = 0, required SingleChildScrollView body,
  //this.onPressed,

  @override
  // State<StatefulWidget> createState() {
  // TODO: implement createState
  // throw UnimplementedError();
  // }
  // }
  //) : super(key: key)
  // {
  // TODO: implement super
  // throw UnimplementedError();
  //
  // }

  

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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

    final _pages = [HomeScreen(), Stores(), Notifications(), ChatHomePage()];

// Icons tooltips
    final _tooltip = [
      "Home",
      "Store",
      "Notifications",
      "Chat Bot",
    ];

    return Container(
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
          color: widget.backgroundColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              4,
              (index) => IconButton(
                onPressed: () {
                  Get.to(() => _pages[index]);
                  print(index);
                },
                tooltip: _tooltip[index],
                icon: _icons[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
