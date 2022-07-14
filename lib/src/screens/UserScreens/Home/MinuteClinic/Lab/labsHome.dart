import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/CurvedBottomBar.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../../Themes/ecentials_icons_icons.dart';
import '../../../../../Widgets/search.dart';
import '../../../Chat/ChatHomePage.dart';
import '../../../Notifications/notifications.dart';
import '../../../Store/store.dart';
import '../../Profiles/profileScreen.dart';
import 'alllabs.dart';

class LabsHome extends StatefulWidget {
  const LabsHome({Key? key}) : super(key: key);

  @override
  State<LabsHome> createState() => _LabsHomeState();
}

class _LabsHomeState extends State<LabsHome> {
  int currentIndex = 0;
  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  // screens
  final _pages = [
    Alllabs(),
    Stores(),
    const Notifications(),
    const ChatHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: currentIndex == 0
          ? AppBar(
              backgroundColor: AppColors.primaryWhiteColor,
              foregroundColor: AppColors.primaryBlackColor,
              elevation: 0,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    EcentialsIcons.menubars,
                    color: AppColors.primaryDeepColor,
                  ),
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => ProfileScreen(),
                      transition: Transition.leftToRight,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/profile.png")),
                  ),
                ),
              ],
              bottom: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 100,
                backgroundColor: AppColors.primaryWhiteColor,
                foregroundColor: AppColors.primaryBlackColor,
                elevation: 0,
                centerTitle: true,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Search for labs",
                      style: TextStyle(
                          color: AppColors.primaryBlackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(width: 314.02, child:
                        Search(
                          width: MediaQuery.of(context).size.width - 90,
                          searchPressed: () {},
                          micPressed: () {},
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.teal,
                          ),
                          child: Image.asset("assets/images/filter.png"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : null,
      drawer: currentIndex == 0 ? const NavDrawer() : null,
      bottomNavigationBar: CurvedBottomBar(
        color: AppColors.primaryGreenColor,
        currentIndex: onTap,
      ),
      body: _pages[currentIndex],
    );
  }
}
