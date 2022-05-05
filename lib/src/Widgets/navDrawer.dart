import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulanceNear.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/minuteClinic.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavDrawer extends StatelessWidget {
  final bool hasShop;
  const NavDrawer({Key? key, this.hasShop = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 100,
      backgroundColor: AppColors.primaryWhiteColor,
      child: ListView(
        children: [
          Container(
            width: double.maxFinite,
            height: 170,
            child: Stack(
              children: [
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Image.asset(
                    "assets/images/logo.png",
                    scale: 1.2,
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            onTap: () {
              Get.to(
                () => ProfileScreen(),
                transition: Transition.rightToLeft,
                duration: Duration(
                  seconds: 1,
                ),
              );
              Scaffold.of(context).openEndDrawer();
            },
            leading: Image.asset(
              "assets/images/profileicon.png",
            ),
            title: Text(
              "Profile",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Image.asset(
              "assets/images/cart.png",
            ),
            title: Text(
              "Cart",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          hasShop == true
              ? ListTile(
                  leading: Icon(
                    EcentialsIcons.shop,
                    size: 25,
                    color: AppColors.primaryBlackColor,
                  ),
                  title: Text(
                    "My Shop",
                    style: TextStyle(
                        fontSize: 20, color: AppColors.primaryBlackColor),
                  ),
                )
              : Container(),
          ListTile(
            onTap: () {
              Get.to(
                () => MinuteClinic(),
                transition: Transition.rightToLeft,
                duration: Duration(
                  seconds: 1,
                ),
              );
              Scaffold.of(context).openEndDrawer();
            },
            leading: Image.asset(
              "assets/images/hospitalicon.png",
            ),
            title: Text(
              "Minute Clinic",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(
                () => AmbulanceNear(),
                transition: Transition.rightToLeft,
                duration: Duration(
                  seconds: 1,
                ),
              );
              Scaffold.of(context).openEndDrawer();
            },
            leading: Image.asset(
              "assets/images/ambulanceicon.png",
            ),
            title: Text(
              "Ambulance",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(() => Settings());
              Scaffold.of(context).openEndDrawer();
            },
            leading: Image.asset(
              "assets/images/settings.png",
            ),
            title: Text(
              "Settings",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Image.asset(
              "assets/images/ecentialcard.png",
            ),
            title: Text(
              "Ecentials Wallet",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Image.asset(
              "assets/images/circlearrow.png",
            ),
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 20, color: AppColors.primaryRedColor),
            ),
          ),
        ],
      ),
    );
  }
}
