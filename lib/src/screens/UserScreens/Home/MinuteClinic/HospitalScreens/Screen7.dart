import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
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
                    width: 40,
                  ),
                  Text(
                    "Schedule",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Icon(Icons.alarm),
                  SizedBox(
                    width: 40,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage("assets/images/profilePic.png"),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
