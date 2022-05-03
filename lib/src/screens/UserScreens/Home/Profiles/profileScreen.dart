import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/EducationalInfo.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/personalInfo.dart';
import 'package:get/get.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:ecentialsclone/src/Widgets/profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Text
    final _topText = [
      "Personal",
      "Health",
      "Educational",
    ];

    // Pages
    final _pages = [
      PersonalInfo(),
      PersonalInfo(),
      EducationalInfo(),
    ];
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      floatingActionButton: const FloatingAmbulance(),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SliverFab(
        floatingWidget: FloatingActionButton(
          backgroundColor: AppColors.primaryOrangeColor,
          onPressed: () {},
          child: Image.asset(
            "assets/images/circular_pencil.png",
            scale: 1,
          ),
        ),
        floatingPosition: const FloatingPosition(
          right: 32,
        ),
        expandedHeight: MediaQuery.of(context).size.height * 0.4,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            backgroundColor: AppColors.primaryDeepColor,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  "Andrews",
                  style: TextStyle(
                      color: AppColors.primaryWhiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "aopoku255@gmail.com",
                  style: TextStyle(
                    color: AppColors.primaryWhiteColor,
                  ),
                ),
              ),
              background: Image.asset(
                "assets/images/profile.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              child: Button(
                text: "Complete Profile",
                style: TextStyle(
                  color: AppColors.primaryWhiteColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              mainAxisExtent: 150,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return InfoCard(
                  onTap: () {
                    Get.to(() => _pages[index]);
                  },
                  topText: _topText[index],
                  bottomText: "Information",
                  showlock: index == 1 ? true : false,
                );
              },
              childCount: 3,
            ),
          )
        ],
      ),
    );
  }
}
