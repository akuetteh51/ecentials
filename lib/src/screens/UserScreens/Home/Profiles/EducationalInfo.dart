// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/addSchoolButton.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schoolsAttendedCard.dart';
import 'package:flutter/material.dart';

class EducationalInfo extends StatefulWidget {
  const EducationalInfo({Key? key}) : super(key: key);

  @override
  State<EducationalInfo> createState() => _EducationalInfoState();
}

class _EducationalInfoState extends State<EducationalInfo> {
  openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Add Educational Inlformation",
          ),
          content: Container(
            height: 150,
            child: Column(children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("School Name"),
                  border: OutlineInputBorder(),
                ),
              )
            ]),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: const FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black54,
          ),
        ),
        title: const Text("Educational Information"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SCHOOLS ATTENDED",
                style: TextStyle(
                  color: AppColors.primaryDeepColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SchoolsAttendedCard(
                schoolName:
                    "Kwame Nkrumah University of Science and Technology",
                program: "Bsc. Computer Science",
                year: "2016 - 2020",
              ),
              SizedBox(
                height: 20,
              ),
              SchoolsAttendedCard(
                schoolName: "Zion Senior High",
                program: "General Science",
                year: "2013 - 2016",
              ),
              SizedBox(
                height: 30,
              ),
              AddSchoolButton(),
            ],
          ),
        ),
      ),
    );
  }
}
