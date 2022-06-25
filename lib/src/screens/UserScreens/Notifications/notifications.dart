import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/notificationsHistory.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    // Notification App Bar
    final _notificationAppBar = AppBar(
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
      title: const Text("Notification"),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(
            right: 10,
          ),
          child: CircleAvatar(
            backgroundColor: AppColors.primaryDeepColor,
            child: IconButton(
              icon: Icon(
                EcentialsIcons.settings_2,
                color: AppColors.primaryWhiteColor,
              ),
              onPressed: () {
                Get.to(
                  () => const Settings(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                );
              },
            ),
          ),
        ),
      ],
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: _notificationAppBar,
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                    fontSize: 20,
                  ),
                  labelColor: AppColors.primaryBlackColor,
                  indicatorColor: AppColors.primaryDeepColor,
                  indicatorWeight: 3.0,
                  tabs: [
                    const Tab(
                      text: "General",
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Recommended"),
                          const SizedBox(
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
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: const Center(
                      child: Text(
                        "OPPS!!! Nothing for you at the moment",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 40,
                    ),
                    child: ListView(
                      children: List.generate(
                          10, (index) => const NotificationsHistory()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
