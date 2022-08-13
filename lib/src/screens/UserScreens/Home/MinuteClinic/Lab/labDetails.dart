// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, avoid_print, unnecessary_import, unused_label, duplicate_import

import 'dart:ui';

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';
import 'package:ecentialsclone/src/Widgets/prominentDoctors.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';

import 'package:ecentialsclone/src/Widgets/topDoctor.dart ';

import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/Hospital2DocProfile.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/Hospital2DocProfile.dart';

import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/LabDirection.dart';


import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/doctorInformation.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labSchedules.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labChat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labDetails.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class LabDetails extends StatefulWidget {
  const LabDetails({Key? key}) : super(key: key);

  @override
  State<LabDetails> createState() => _LabDetailsState();
}

class _LabDetailsState extends State<LabDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        child: GestureDetector(
          onTap: () {
            Get.to(() => LabSchedules());
          },
          child: Button(
            text: "Book session",
            color: Colors.teal,
            style: TextStyle(
              color: AppColors.primaryWhiteColor,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: AppColors.primaryDeepColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/lab3.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Spintex Community Lab",
                style: TextStyle(
                    color: AppColors.primaryBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Wrap(children: [
                Container(
                  margin: EdgeInsets.only(left: 22.97, top: 9.5),
                  child: Text(
                    "3.5km away",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25.53, top: 9.5),
                  child: Row(
                    children: [
                      Text(
                        "Address:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Flexible(
                        child: Text(
                          "  Accra,Ghana",
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.39, top: 9.46),
                  child: Row(
                    children: [
                      Text(
                        "Hours:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(left: 5.5),
                          child: Text(
                            "24H",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.39, top: 9.46),
                  child: Row(
                    children: [
                      Text(
                        "Phone:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(left: 19.5),
                          child: Text(
                            "+233 xxxxxxxxxxxxx",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.39, top: 9.46),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ratings: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16, left: 12),
                        child: Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.primaryOrangeColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.primaryOrangeColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.primaryOrangeColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.primaryOrangeColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: AppColors.primaryOrangeColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 24.2, top: 20.63),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            left: 14,
                            right: 14,
                          ),
                          backgroundColor: Colors.teal,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 12),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => LabChat());
                        },
                        child: Row(children: [Text(" Chat")]),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12, top: 0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(
                              top: 4,
                              bottom: 4,
                              left: 14,
                              right: 14,
                            ),
                            backgroundColor: Colors.teal,
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 18),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => LabChat());
                          },
                          child: Row(children: [
                            Icon(Icons.phone_in_talk),
                            Text("  Call"),
                          ]),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14.36, top: 0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(
                              top: 4,
                              bottom: 4,
                              left: 14,
                              right: 14,
                            ),
                            backgroundColor: Colors.teal,
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 18),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => LabDirection());
                          },
                          child: Row(children: [
                            Text("Direction"),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 22.82, top: 41),
              child: Text(
                "Prominent doctors",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              margin: EdgeInsets.only(left: 24.09, top: 25.38),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [

                  InkWell(
                    onTap: () {
                      Get.to(() => Hospital2DocProfile());
                    },
                    child: ProminentDoctors(
                        image: "assets/images/doctor1.png",
                        docName: "Clara",
                        specialization: "Neuro Surgeon"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.97, top: 0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => Hospital2DocProfile());
                      },
                      child: ProminentDoctors(
                          image: "assets/images/doctor2.png",
                          docName: "Clara",
                          specialization: "Cardio Surgeon"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.05, top: 0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => Hospital2DocProfile());
                      },
                      child: ProminentDoctors(
                          image: "assets/images/doctor.png",
                          docName: "Clara",
                          specialization: "Neuro Surgeon"),
                    ),
                  ),

                  for (int j = 0; j < 5; j++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => DoctorInformation());
                        },
                        child: ProminentDoctors(
                            image: "assets/images/doctor1.png",
                            docName: "Clara",
                            specialization: "Neuro Surgeon"),
                      ),
                    ),
       ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
            children: [
                  Container(
                    margin: EdgeInsets.only(left: 22.82, top: 29),
                    child: Text(
                      "Lab Coverage",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print("clicked");
                    },
                    icon: Container(
                      margin: EdgeInsets.only(left: 189.24, top: 0),
                      child: Icon(
                        Icons.compare_arrows_sharp,
                        color: Colors.teal,
                      ),
                    ),
                  )
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 24.2, top: 24.63),
              child: Row(children: [
                ButtonOutlined(
                  text: "Blood Test",
                  style: TextStyle(color: Colors.teal),
                  color: Colors.teal,
                  width: 100,
                  height: 40,
                  radius: 8,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.8, top: 0),
                  child: ButtonOutlined(
                    text: "Urine Test",
                    style: TextStyle(color: Colors.teal),
                    color: Colors.teal,
                    width: 100,
                    height: 40,
                    radius: 8,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8.8, top: 0),
                  child: ButtonOutlined(
                    text: "DNA test",
                    style: TextStyle(color: Colors.teal),
                    color: Colors.teal,
                    width: 100,
                    height: 40,
                    radius: 8,
                  ),
                ),
              ]),
            ),
          SizedBox(height: 100,),
                ],
              )),
          // SliverToBoxAdapter(
          //   child: ,
          // ),
        ],
      ),
    );
  }
}
