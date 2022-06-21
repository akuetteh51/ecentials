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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        elevation: 0,
        foregroundColor: AppColors.primaryBlackColor,
        title: Text("Notifications and Sounds"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primaryDeepColor.withOpacity(.50),
              child: Icon(
                EcentialsIcons.notification,
                color: AppColors.primaryWhiteColor,
              ),
            ),
            title: Text("Mobile Notifications"),
            trailing: Switch(
              onChanged: ((value) {}),
              value: true,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primaryDeepColor.withOpacity(.50),
              child: Icon(
                Icons.speaker_sharp,
                color: AppColors.primaryWhiteColor,
              ),
            ),
            title: Text("Play Sound"),
            trailing: Switch(
              onChanged: ((value) {}),
              value: true,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.primaryDeepColor.withOpacity(.50),
              child: Icon(
                Icons.phone,
                color: AppColors.primaryWhiteColor,
              ),
            ),
            title: Text("Accept calls on this app"),
            trailing: Switch(
              onChanged: ((value) {}),
              value: true,
            ),
          ),
        ],
      ),
    );
  }
}
