import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/recentChatsCard.dart';
import 'package:flutter/material.dart';

class chat4 extends StatefulWidget {
  const chat4({Key? key}) : super(key: key);

  @override
  State<chat4> createState() => _chat4State();
}

class _chat4State extends State<chat4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  Icon(Icons.alarm),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage("assets/images/profilePic.png"),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              RecentChatsCard(
                  image: "assets/images/doctor-1.png",
                  docName: "Dr. John Doe",
                  message: "having pains all over",
                  time: "12:00 PM"),
              RecentChatsCard(
                  image: "assets/images/img.png",
                  docName: "Dr. John Doe",
                  message: "having pains all over",
                  time: "12:00 PM"),
              RecentChatsCard(
                  image: "assets/images/doctor-1.png",
                  docName: "Dr. John Doe",
                  message: "having pains all over",
                  time: "12:00 PM"),
              RecentChatsCard(
                  image: "assets/images/doctor-1.png",
                  docName: "Dr. John Doe",
                  message: "having pains all over",
                  time: "12:00 PM"),
              RecentChatsCard(
                  image: "assets/images/doctor-1.png",
                  docName: "Dr. John Doe",
                  message: "having pains all over",
                  time: "12:00 PM")
            ]),
          ),
        ),
      ),
    );
  }
}
