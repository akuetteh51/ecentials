// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/recentChatsCard.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LabChat extends StatefulWidget {
  const LabChat({Key? key}) : super(key: key);

  @override
  State<LabChat> createState() => _LabChatState();
}

class _LabChatState extends State<LabChat> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: Icon(Icons.arrow_back),
        actions: [
          Container(
              margin: EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    child: Icon(EcentialsIcons.notification),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      Icons.circle,
                      size: 10,
                      color: Color.fromARGB(255, 215, 20, 6),
                    ),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png")),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        backgroundColor: AppColors.primaryGreenColor,
      ),
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: ListView(
          children: [
            RecentChatsCard(
                image: "assets/images/doctor.png",
                docName: "MyDoc Bot",
                message: "Because the pain is fun",
                time: "12:00 PM"),
            SizedBox(
              height: 10,
            ),
            RecentChatsCard(
                image: "assets/images/doctor-1.png",
                docName: "Dr John Doe",
                message: "Because the pain is fun",
                time: "12:00 PM"),
            SizedBox(
              height: 10,
            ),
            RecentChatsCard(
                image: "assets/images/doctor.png",
                docName: "Dr Sarah Seth",
                message: "Because the pain is fun",
                time: "12:00 PM"),
            SizedBox(
              height: 10,
            ),
            RecentChatsCard(
                image: "assets/images/doctor-1.png",
                docName: "Dr Jane Paul",
                message: "Because the pain is fun",
                time: "12:00 PM"),
            SizedBox(
              height: 10,
            ),
            RecentChatsCard(
                image: "assets/images/doctor2.png",
                docName: "Dr Good Paul",
                message: "Because the pain is fun",
                time: "12:00 PM"),
          ],
        ),
      ),
    );
  }
}
