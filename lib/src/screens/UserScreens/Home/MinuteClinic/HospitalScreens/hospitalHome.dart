import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/CurvedBottomBar.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/nearbyHospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../../../../Themes/ecentials_icons_icons.dart';
import '../../../../../Widgets/navDrawer.dart';
import '../../../../../Widgets/search.dart';
import '../../../Chat/ChatHomePage.dart';
import '../../../Notifications/notifications.dart';
import '../../../Store/store.dart';
import '../../Profiles/profileScreen.dart';

class HospitalHome extends StatefulWidget {
  const HospitalHome({Key? key}) : super(key: key);

  @override
  State<HospitalHome> createState() => _HospitalHomeState();
}

class _HospitalHomeState extends State<HospitalHome> {
  int currentIndex = 0;
  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // AppBar
    final _appBar = AppBar(
      backgroundColor: AppColors.primaryWhiteColor,
      elevation: 0,
      foregroundColor: AppColors.primaryBlackColor,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(EcentialsIcons.menu_icon),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.to(() => ProfileScreen(), transition: Transition.rightToLeft);
          },
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/profilePic.png"),
            ),
          ),
        ),
      ],
      bottom: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryWhiteColor,
        elevation: 0,
        foregroundColor: AppColors.primaryBlackColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find a Nearby Hospital",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Search(
                    searchPressed: () {},
                    micPressed: () {},
                  ),
                  width: MediaQuery.of(context).size.width - 90,
                ),
                IconButton(
                  padding: EdgeInsets.all(3),
                  color: AppColors.primaryDeepColor,
                  onPressed: () {},
                  icon: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDeepColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset("assets/images/filter.png"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );

    // screens
    final _pages = [
      NearbyHospital(),
      Stores(),
      const Notifications(),
      const ChatHomePage(),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      bottomNavigationBar: CurvedBottomBar(
        currentIndex: onTap,
      ),
      appBar: currentIndex == 0 ? _appBar : null,
      drawer: currentIndex == 0 ? const NavDrawer() : null,
      body: _pages[currentIndex],
    );
  }
}
