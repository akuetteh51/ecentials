import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/editProfile.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
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
          child: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black54,
          ),
        ),
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
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
                    radius: 35,
                    backgroundImage: AssetImage(
                      "assets/images/profile.png",
                    ),
                  ),
                ),

                const SizedBox(width: 8,),
                Flexible(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Andrews Opoku",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryBlackColor.withOpacity(.50),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
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
                          ],
                        ),
                        const Text(
                          "My name is Andrews Opoku...",

                        ),
                      // ),
                     const SizedBox(
                        height: 10,
                      ),
                     const Text(
                        "My name is Andrews Opoku Senior jnfnjj...",
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),                          

                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ListTile(
            leading: Icon(EcentialsIcons.account),
            title:  Text(
              "Account",
              style: TextStyle(fontSize: 18),
            ),
            subtitle:  Text(
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
              style: TextStyle(fontSize: 18),
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
              style: TextStyle(fontSize: 18),
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
              style: TextStyle(fontSize: 18),
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
              style: TextStyle(fontSize: 18),
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
                  fontSize: 18,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/heart.png",
            ),
            title: const Text(
              "Favorite",
              style: TextStyle(fontSize: 18),
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
              style: TextStyle(fontSize: 18),
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
              style: TextStyle(fontSize: 18),
            ),
            trailing: const Icon(
              Icons.chevron_right,
            ),
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/darkmode.png",
            ),
            title: const Text(
              "Dark Mode",
              style: TextStyle(fontSize: 18),
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
            leading: Image.asset(
              "assets/images/wifi.png",
            ),
            title: const Text(
              "Only Download via Wifi",
              style: TextStyle(fontSize: 18),
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
