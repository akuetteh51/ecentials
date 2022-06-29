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

import '../../../../../Widgets/CurvedBottomBar.dart';
import '../../../Chat/ChatHomePage.dart';
import '../../../Notifications/notifications.dart';
import '../../../Store/store.dart';

class NearbyHospital extends StatefulWidget {
  const NearbyHospital({Key? key}) : super(key: key);

  @override
  State<NearbyHospital> createState() => _NearbyHospitalState();
}

class _NearbyHospitalState extends State<NearbyHospital> {

  int currentIndex = 0;

  Widget hospitalBody() {
    
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
    
    return  Scaffold(
          // floatingActionButton: FloatingAmbulance(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
          // bottomNavigationBar: BottomNavBar(),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        EcentialsIcons.menu_icon,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            AssetImage("assets/images/profilePic.png"),
                      ),
                    ],
                  ),
                  SizedBox(height: 40, width: 0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Find a Nearby Hospital",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        child: Search4(),
                        width: MediaQuery.of(context).size.width - 80,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Icon(EcentialsIcons.filter),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Doctors",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
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
                          onTap: () {
                            // Get.to(
                            //   () => const chat(),
                            //   transition: Transition.fadeIn,
                            //   duration: Duration(seconds: 1),
                            // );
                          },
                          child: TopDoctor(
                            image: "assets/images/doctor1.png",
                            docName: "Dr Esther Agams",
                            specialization: "Heart Surgery",
                            experience: 95,
                          ),
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
                ]),
              ),
            ),
          ),
        );
  }  


  @override
  Widget build(BuildContext context) {
  // Pages
  final _pages = [
     hospitalBody(),
    const Stores(),
    const Notifications(),
    // const ChatRoom(),
    const ChatHomePage(),
  ];
      
    return Stack(
      children: [
       
        SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
          child: _pages[currentIndex]),
        CurvedBottomBar(
          color: AppColors.primaryGreenColor,
          currentIndex: (int curIndex) {
            setState(() {
              currentIndex = curIndex;
            });
          },
        ),
      ],
    );
  }


}
