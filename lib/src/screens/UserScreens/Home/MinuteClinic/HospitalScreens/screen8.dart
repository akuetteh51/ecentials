import 'package:flutter/material.dart';

class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:   Row(
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



        ),
      ),
    );
  }
}
