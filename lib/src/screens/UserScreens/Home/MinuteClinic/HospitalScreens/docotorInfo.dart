// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/doctorCard.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter/material.dart';

class DocotorInfo extends StatefulWidget {
  const DocotorInfo({Key? key}) : super(key: key);

  @override
  State<DocotorInfo> createState() => _DocotorInfoState();
}

class _DocotorInfoState extends State<DocotorInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Image(
                  image: AssetImage("assets/images/doctor_hospital.png"),
                ),
                Positioned(
                  top: 80,
                  right: 0,
                  child: doctorCard(
                      fname: "Prince",
                      lname: "Berth",
                      role: "Heart Surgeon",
                      hospital: "National hospital"),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "About",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Center(
                        child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin habitant donec habitant quis arcu aliquet non turpis. "),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Availability",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Reviews",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade200,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "(200)",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.grey),
                              ),
                            ],
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
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        child: Row(
                          children: [
                            TopDoctor(
                              image: "assets/images/doctor.png",
                              docName: "Esther Essien",
                              days: "3 days ago",
                              specialization: "Eye specialist",
                              experience: 6,
                            ),
                            TopDoctor(
                              image: "assets/images/doctor.png",
                              docName: "Esther Essien",
                              days: "3 days ago",
                              specialization: "Eye specialist",
                              experience: 6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: const Color(0xFF033A64),
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
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
