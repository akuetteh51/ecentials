// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, no_logic_in_create_state

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/doctorCard.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter/material.dart';

class Hospital2DocProfile extends StatefulWidget {
  const Hospital2DocProfile({Key? key}) : super(key: key);

  @override
  State<Hospital2DocProfile> createState() => _Hospital2DocProfileState();
}

class _Hospital2DocProfileState extends State<Hospital2DocProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Positioned(
                    top: 100,
                    child: Image(
                      image: AssetImage("assets/images/doctor_hospital.png"),
                    ),
                  ),
                  Positioned(
                    top: 190,
                    child: Container(
                      //  color: Colors.teal,
                      child: doctorCard(
                          fname: "Prince",
                          lname: "Berth",
                          role: "Heart Surgeon",
                          hospital: "National hospital"),
                    ),
                  ),
                  Text(
                    "About",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Center(
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin habitant donec habitant quis arcu aliquet non turpis. "),
                  ),
                  Text("Availability"),
                  Row(
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          // backgroundColor: const Color(0xFF033A64),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 18),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Column(
                          children: [Text("Mon"), Text("2")],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          // backgroundColor: const Color(0xFF033A64),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 18),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Column(
                          children: [Text("Tue"), Text("3")],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          backgroundColor: const Color(0xFF033A64),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Column(
                          children: [Text("Wed"), Text("4")],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          // backgroundColor: const Color(0xFF033A64),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 18),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Column(
                          children: [Text("Thur"), Text("5")],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          // backgroundColor: const Color(0xFF033A64),
                          primary: Colors.black,
                          textStyle: const TextStyle(fontSize: 18),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Column(
                          children: [Text("Fri"), Text("6")],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Reviews",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        "(200)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: const Color(0xFFCB3F04)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      children: [
                        TopDoctor(
                            image: "assets/images/doctor.png",
                            docName: "Esther Essien",
                            specialization: "Eye specialist",
                            experience: 6),
                        TopDoctor(
                            image: "assets/images/doctor.png",
                            docName: "Esther Essien",
                            specialization: "Eye specialist",
                            experience: 6),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: Colors.teal,
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 18),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                      print("booked");
                    },
                    child: Text("Book Appointment"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
