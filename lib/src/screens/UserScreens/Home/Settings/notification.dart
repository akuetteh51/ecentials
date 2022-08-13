// ignore_for_file: unnecessary_import, implementation_imports, prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationsAndSounds extends StatefulWidget {
  const NotificationsAndSounds({Key? key}) : super(key: key);

  @override
  State<NotificationsAndSounds> createState() => _NotificationsAndSoundsState();
}

class _NotificationsAndSoundsState extends State<NotificationsAndSounds> {
  bool isMobile = false;
  bool isSound = false;
  bool isCall = false;

  @override
  Widget build(BuildContext context) {
    final _icons = [
      EcentialsIcons.notification,
      Icons.volume_up_outlined,
      EcentialsIcons.phone
    ];

    final _text = [
      "Mobile Notifications",
      "Play Sound",
      "Accept calls on this app",
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        elevation: 0,
        foregroundColor: AppColors.primaryBlackColor,
        title: Text("Notifications and Sounds"),
        centerTitle: true,
      ),
      body: ListView(children: [
        ListTile(
          onTap: () {
            setState(() {
              isMobile = !isMobile;
            });
          },
          leading: CircleAvatar(
            backgroundColor: AppColors.primaryDeepColor.withOpacity(.50),
            child: Icon(
              EcentialsIcons.notification,
              color: AppColors.primaryWhiteColor,
            ),
          ),
          title: const Text(
            "Mobile Notifications",
          ),
          trailing: Switch.adaptive(
            value: isMobile,
            onChanged: (isMobile) {
              setState(
                () {
                  this.isMobile = isMobile;
                },
              );
            },
          ),
        ),
        ListTile(
          onTap: () {
            setState(() {
              isSound = !isSound;
            });
          },
          leading: CircleAvatar(
            backgroundColor: AppColors.primaryDeepColor.withOpacity(.50),
            child: Icon(
              Icons.volume_up_outlined,
              color: AppColors.primaryWhiteColor,
            ),
          ),
          title: const Text(
            "Play sounds",
          ),
          trailing: Switch.adaptive(
            value: isSound,
            onChanged: (isSound) {
              setState(
                () {
                  this.isSound = isSound;
                },
              );
            },
          ),
        ),
        ListTile(
          onTap: () {
            setState(() {
              isCall = !isCall;
            });
          },
          leading: CircleAvatar(
            backgroundColor: AppColors.primaryDeepColor.withOpacity(.50),
            child: Icon(
              Icons.phone,
              color: AppColors.primaryWhiteColor,
            ),
          ),
          title: const Text(
            "Accept calls on this appp",
          ),
          trailing: Switch.adaptive(
            value: isCall,
            onChanged: (isCall) {
              setState(
                () {
                  this.isCall = isCall;
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
