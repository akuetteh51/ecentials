// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print, non_constant_identifier_names

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/Hospital2DocProfile.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/doctorInformation.dart';

import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labChat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/homeScreen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class TechnicianSchedule extends StatefulWidget {
  final bool hasNotification;

  const TechnicianSchedule({Key? key, this.hasNotification = false})
      : super(key: key);

  @override
  State<TechnicianSchedule> createState() => _TechnicianScheduleState();
}

class _TechnicianScheduleState extends State<TechnicianSchedule> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: AppColors.primaryWhiteColor,
            appBar: AppBar(
              backgroundColor: AppColors.primaryWhiteColor,
              foregroundColor: AppColors.primaryBlackColor,
              elevation: 0,
              title: const Text(
                "Schedule",
                style: TextStyle(fontSize: 18),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryDeepColor,
                ),
                onPressed: () {
                  Get.to(
                    () => LabChat(),
                  );
                },
              ),
              actions: [
                Container(
                    margin: EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Icon(EcentialsIcons.notification),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Icon(
                            Icons.circle,
                            size: 10,
                            color: Color.fromARGB(255, 215, 20, 6),
                          ),
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.all(10),
                  child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.png")),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavBar(
                // backgroundColor: AppColors.primaryGreenColor,
                ),
            floatingActionButton: FloatingAmbulance(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: SingleChildScrollView(
                child: SafeArea(
                    child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(30),
                      width: 420,
                      height: 55,

                      decoration: BoxDecoration(
                        color: AppColors.primaryGreyColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      // VerticalDivider(width: 1),
                      // backgroundColor:AppColors.primaryGreyColor,
                      child: TabBar(
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.teal,
                        ),
                        indicatorColor: AppColors.primaryGreenColor,
                        // labelColor: AppColors.primaryBlackColor,

                        unselectedLabelColor: AppColors.primaryBlackColor,
                        // labelStyle: ,
                        //  unselectedLabelStyle: ,
                        //overlayColor:AppColors.primaryGreenColor,
                        labelPadding: EdgeInsets.only(left: 10.0, right: 10.0),

                        tabs: [
                          Tab(
                            text: 'Upcoming',
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    //  left: BorderSide(
                                    // width: 1,
                                    // ),
                                    // right: BorderSide(width: 1),
                                    )),
                            child: Tab(
                              text: 'Completed',
                            ),
                          ),
                          Tab(
                            text: 'Canceled',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 56,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => DoctorInformation());
                      },
                      child: SchedulesCard(
                          image: "assets/images/doctor.png",
                          docName: "Dr. John Doe",
                          specialization: "Heart Surgeon ",
                          hospitalName: "National Hospital",
                          time: "10:00 AM",
                          date: "12/09/22"),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => DoctorInformation());
                      },
                      child: SchedulesCard(
                          image: "assets/images/doctor.png",
                          docName: "Dr. John Doe",
                          specialization: "Heart Surgeon ",
                          hospitalName: "National Hospital",
                          time: "10:00 AM",
                          date: "12/09/22"),
                    ),
                  ],
                ),
              ),
            )))),
      );
}
