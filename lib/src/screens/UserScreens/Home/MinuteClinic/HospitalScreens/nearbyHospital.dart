import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter/material.dart';

class NearbyHospital extends StatefulWidget {
  const NearbyHospital({Key? key}) : super(key: key);

  @override
  State<NearbyHospital> createState() => _NearbyHospitalState();
}

class _NearbyHospitalState extends State<NearbyHospital> {
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
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    EcentialsIcons.menu_icon,
                  ),
                  SizedBox(
                    width: 250,
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage("assets/images/profilePic.png"),
                  ),
                ],
              ),
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
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.toggle_off_outlined),
                      Icon(Icons.toggle_off_outlined),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    "Top Doctors",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  SizedBox(
                    width: 90,
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
                    TopDoctor(
                        image: "assets/images/doctor1.png",
                        docName: "Dr Esther Agams",
                        specialization: "Heart Surgery",
                        experience: 5),
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
                    LabResultsCard(
                        image: "assets/images/hospitalNational.png",
                        labName: "ZIky National Hospital",
                        openingHours: "Weekdays |7:00am -8:pm"),
                    SizedBox(
                      height: 20,
                    ),
                    LabResultsCard(
                        image: "assets/images/hospitaln.png",
                        labName: "ZIky National Hospital",
                        openingHours: "Weekdays |7:00am -8:pm"),
                    SizedBox(
                      height: 20,
                    ),
                    LabResultsCard(
                        image: "assets/images/hospitalna.png",
                        labName: "ZIky National Hospital",
                        openingHours: "Weekdays |7:00am -8:pm")
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
