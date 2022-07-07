import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';

import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';

import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/Widgets/searchLocation.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/docotorInfo.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/labScreen.dart';

import 'package:flutter/material.dart';

class NearbyH extends StatefulWidget {
  const NearbyH({Key? key}) : super(key: key);

  @override
  State<NearbyH> createState() => _NearbyHState();
}

class _NearbyHState extends State<NearbyH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white12,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            print(" NavDrawer");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NavDrawer()));
          },
          icon: Icon(
            EcentialsIcons.menu_icon,
          ),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/profilePic.png"),
          ),
        ],
      ),
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(children: [
              SizedBox(height: 40, width: 0),
              Text(
                "Find a Nearby Hospital",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Search4(),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xFF033A64),
                      ),
                      child: Image.asset("assets/images/filter.png"),
                    ),
                    onTap: () => filterDrop(),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Top Doctors",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 17, color: Colors.red),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      child: TopDoctor(
                          image: "assets/images/doctor1.png",
                          docName: "Dr Esther Agams",
                          specialization: "Heart Surgery",
                          experience: 5),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DocotorInfo()));
                      },
                    ),
                    TopDoctor(
                        image: "assets/images/doctor2.png",
                        docName: "Sussan Agams",
                        specialization: "Heart Surgery",
                        experience: 5)
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: LabResultsCard(
                          image: "assets/images/hospitalNational.png",
                          labName: "ZIky National Hospital",
                          openingHours: "Weekdays |7:00am -8:pm"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => labScreen()));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: LabResultsCard(
                          image: "assets/images/hospitaln.png",
                          labName: "ZIky National Hospital",
                          openingHours: "Weekdays |7:00am -8:pm"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => labScreen()));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: LabResultsCard(
                          image: "assets/images/hospitalna.png",
                          labName: "ZIky National Hospital",
                          openingHours: "Weekdays |7:00am -8:pm"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => labScreen()));
                      },
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  void filterDrop() {
    // showModelBottomSheet(context: context, builder: (context) {});
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 30),
                      child: Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 230,
                    ),
                  ],
                ),
                search_bar(),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Service Type",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 190,
                    ),
                    // Icon(
                    //   Icons.compare_arrows_sharp,
                    //   color: const Color(0xFF033A64),
                    // ),
                    GestureDetector(
                      child: Image.asset("assets/images/Control.png"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        backgroundColor: const Color(0xFF033A64),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Biological"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        backgroundColor: Colors.grey,
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Chemical"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        backgroundColor: Colors.grey,
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("DNA test"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        backgroundColor: Colors.grey,
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Biological"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        backgroundColor: Colors.grey,
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Chemical"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        backgroundColor: Colors.grey,
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Pathology"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        backgroundColor: Colors.grey,
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Hematology"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        backgroundColor: Colors.grey,
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Microbiology"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        backgroundColor: Colors.grey,
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 13),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Blood test"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 30),
                      child: Text(
                        "Distance",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 230,
                    ),
                  ],
                ),
                search_bar(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 85.0, right: 85.0, top: 10.0, bottom: 10),
                        backgroundColor: const Color(0xFF033A64),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 15),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Show results"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 15),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Clear"),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
