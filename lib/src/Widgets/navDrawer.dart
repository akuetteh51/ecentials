import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/minuteClinic.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
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
            leading: Icon(
              EcentialsIcons.profile,
              size: 30,
              color: AppColors.primaryBlackColor,
            ),
            title: Text(
              "Profile",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            leading: Icon(
              EcentialsIcons.cart,
              size: 30,
              color: AppColors.primaryBlackColor,
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
            leading: Icon(
              EcentialsIcons.hospital,
              size: 25,
              color: AppColors.primaryBlackColor,
            ),
            title: Text(
              "Minute Clinic",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            leading: Icon(
              EcentialsIcons.ambulance,
              size: 25,
              color: AppColors.primaryBlackColor,
            ),
            title: Text(
              "Ambulance",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            leading: Icon(
              EcentialsIcons.settings,
              size: 30,
              color: AppColors.primaryBlackColor,
            ),
            title: Text(
              "Settings",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            leading: Icon(
              EcentialsIcons.wallet,
              size: 25,
              color: AppColors.primaryDeepColor,
            ),
            title: Text(
              "Ecentials Wallet",
              style:
                  TextStyle(fontSize: 20, color: AppColors.primaryBlackColor),
            ),
          ),
          ListTile(
            leading: Icon(
              EcentialsIcons.circle_arrow_right,
              size: 25,
              color: AppColors.primaryRedColor,
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
