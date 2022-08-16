
// ignore_for_file: prefer_
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/editProfile.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/Favorite.dart';

import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/downloads.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/downloads.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/langauge.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/notification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isDarkmode = false;
  bool isDownloadViaWifi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },


          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black54,
          ),
        ),
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ProfileScreen());
                  },
                  child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/images/profile.png",
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Andrews Opoku Kwadwo",
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "USER",
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.to(() => EditProfile());
                      },
                      icon: Icon(
                        EcentialsIcons.pen_underlined,
                        color: AppColors.primaryBlueColor,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(EcentialsIcons.qrcode),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(EcentialsIcons.account),
            title: const Text(
              "Account",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: const Text(
              "Privacy, security, change email or number",
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/message.png",
              scale: 1.2,
            ),
            title: const Text(
              "Chats",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: const Text(
              "Themes, wallpapers, chat history",
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(() => NotificationsAndSounds());
            },
            leading: Image.asset(
              "assets/images/notifications.png",
              scale: 1.2,
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: const Text(
              "Message, group and call tones",
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/storage.png",
              scale: 1.2,
            ),
            title: const Text(
              "Storage",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: const Text(
              "Network usage, auto-download",
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/headphone.png",
              scale: 1.2,
            ),
            title: const Text(
              "Help",
              style: TextStyle(fontSize: 20),
            ),
            subtitle: const Text(
              "Help center, contact us, privacy policy",
            ),
          ),
          Container(
            color: AppColors.primaryBlackColor.withOpacity(
              .05,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                "Contents",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ListTile(

             onTap: () {
              Get.to(() => const Favorite());
            },

            leading: Image.asset(
              "assets/images/heart.png",
            ),
            title: const Text(
              "Favorite",
              style: TextStyle(fontSize: 20),
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(() => const Downloads());
            },
            leading: Image.asset(
              "assets/images/download.png",
            ),
            title: const Text(
              "Download",
              style: TextStyle(fontSize: 20),
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
          ),
          Container(
            color: AppColors.primaryBlackColor.withOpacity(
              .05,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text(
                "Preferences",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(() => const Language());
            },
            leading: Image.asset(
              "assets/images/translate.png",
            ),
            title: const Text(
              "Languages",
              style: TextStyle(fontSize: 20),
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                isDarkmode = !isDarkmode;
              });
            },
            leading: Image.asset(
              "assets/images/darkmode.png",
            ),
            title: const Text(
              "Dark Mode",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Switch.adaptive(
              value: isDarkmode,
              onChanged: (isDarkmode) {
                setState(
                  () {
                    this.isDarkmode = isDarkmode;
                  },
                );
              },
            ),
          ),
          ListTile(
            onTap: () {
              setState(() {
                isDownloadViaWifi = !isDownloadViaWifi;
              });
            },
            leading: Image.asset(
              "assets/images/wifi.png",
            ),
            title: const Text(
              "Only Download via Wifi",
              style: TextStyle(fontSize: 20),
            ),
            trailing: Switch.adaptive(
              value: isDownloadViaWifi,
              onChanged: (isDownloadViaWifi) {
                setState(
                  () {
                    this.isDownloadViaWifi = isDownloadViaWifi;
                  },
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20,
              bottom: 40,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                child: Text(
                  "Invite a friend",
                  style: TextStyle(
                    color: AppColors.primaryBlueColor,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
