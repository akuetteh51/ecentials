import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
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
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(6),
                  width: 420,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreyColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.primaryDeepColor,
                    ),
                    indicatorColor: AppColors.primaryGreenColor,
                    unselectedLabelColor: AppColors.primaryBlackColor,
                    labelPadding: EdgeInsets.only(left: 10.0, right: 10.0),
                    tabs: [
                      Tab(
                        text: 'Upcoming',
                      ),
                      Container(
                        decoration: BoxDecoration(border: Border()),
                        child: Tab(
                          text: 'Completed',
                        ),
                        //  )
                      ),
                      Tab(
                        text: 'Canceled',
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    BackButton(color: Colors.black),
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
                      backgroundImage:
                          AssetImage("assets/images/profilePic.png"),
                    ),
                  ],
                ),
                SizedBox(
                  width: 384,
                  height: 55,
                ),
                SchedulesCard(
                    image: "assets/images/doctor.png",
                    docName: "Dr. John Doe",
                    specialization: "Heart Surgeon ",
                    hospitalName: "National Hospital",
                    time: "10:00 AM",
                    date: "12/09/22"),
                SchedulesCard(
                    image: "assets/images/doctor.png",
                    docName: "Dr. John Doe",
                    specialization: "Heart Surgeon ",
                    hospitalName: "National Hospital",
                    time: "10:00 AM",
                    date: "12/09/22"),
                SchedulesCard(
                    image: "assets/images/doctor.png",
                    docName: "Dr. John Doe",
                    specialization: "Heart Surgeon ",
                    hospitalName: "National Hospital",
                    time: "10:00 AM",
                    date: "12/09/22")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
