// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NearbyHospital extends StatefulWidget {
  const NearbyHospital({Key? key}) : super(key: key);

  @override
  State<NearbyHospital> createState() => _NearbyHospitalState();
}

class _NearbyHospitalState extends State<NearbyHospital> {
  @override
  Widget build(BuildContext context) {
    final _docsInfo = [
      {
        "image": "assets/images/doctor1.png",
        "name": "Sussan Agams Ayarega",
        "days": "3 days ago",
        "area": "Heart Surgeon",
        "experience": "5",
      },
      {
        "image": "assets/images/sussan.png",
        "name": "Jennifer Harrison",
        "days": "1 week ago",
        "area": "Dentist, Neurologist",
        "experience": "5",
      },
      {
        "image": "assets/images/doctor.png",
        "name": "Andrews Kwadwo dhgfhsgfh",
        "days": "8 hours ago",
        "area": "Optometry",
        "experience": "8",
      },
    ];

    final _hospitalInfo = [
      {
        "image": "assets/images/hospitalNational.png",
        "labName": "ZIky National Hospital",
        "openingHours": "Weekdays |7:00am -8:pm",
      },
      {
        "image": "assets/images/hospitalna.png",
        "labName": "Andrews Medical Hospital",
        "openingHours": "Weekdays |8:00am -4:pm",
      },
      {
        "image": "assets/images/hospitaln.png",
        "labName": "Quame Medical Center",
        "openingHours": "Weekdays |7:00am -8:pm",
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      extendBody: true,
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        elevation: 0,
        foregroundColor: AppColors.primaryBlackColor,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(EcentialsIcons.menu_icon),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => ProfileScreen(), transition: Transition.rightToLeft);
            },
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/profilePic.png"),
              ),
            ),
          ),
        ],
        bottom: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryWhiteColor,
          elevation: 0,
          foregroundColor: AppColors.primaryBlackColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find a Nearby Hospital",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Search(
                      searchPressed: () {},
                      micPressed: () {},
                    ),
                    width: MediaQuery.of(context).size.width - 90,
                  ),
                  IconButton(
                    padding: EdgeInsets.all(3),
                    color: AppColors.primaryDeepColor,
                    onPressed: () {},
                    icon: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primaryDeepColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset("assets/images/filter.png"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Doctors",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 17, color: AppColors.primaryRedColor),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                _docsInfo.length,
                (index) => TopDoctor(
                  image: _docsInfo[index]["image"],
                  docName: _docsInfo[index]["name"],
                  days: _docsInfo[index]["days"],
                  specialization: _docsInfo[index]["area"],
                  experience: 5,
                ),
              )),
            ),
            SingleChildScrollView(
              child: Column(
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: LabResultsCard(
                      image: _hospitalInfo[index]["image"],
                      labName: _hospitalInfo[index]["labName"],
                      openingHours: "Weekdays |7:00am -8:pm",
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
