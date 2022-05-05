import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/notificationsHistory.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          elevation: 0,
          title: const Text("Notification"),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryDeepColor,
                child: Icon(
                  EcentialsIcons.settings_2,
                  color: AppColors.primaryWhiteColor,
                ),
              ),
            ),
          ],
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(
                fontSize: 20,
              ),
              labelColor: AppColors.primaryBlackColor,
              indicatorColor: AppColors.primaryDeepColor,
              indicatorWeight: 3.0,
              tabs: [
                Tab(
                  text: "General",
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Recommended"),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 22,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColors.primaryRedColor,
                        ),
                        child: Center(
                          child: Text(
                            "10+",
                            style: TextStyle(
                              color: AppColors.primaryWhiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                "OPPS!!! Nothing for you at the moment",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: ListView(
                children: List.generate(10, (index) => NotificationsHistory()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
