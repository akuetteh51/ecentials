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
      extendBody: true,
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(
                      "SCHOOLS ATTENDED",
                      style: TextStyle(
                        color: AppColors.primaryDeepColor,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                      width: 15.0,
                      // child: CircularProgressIndicator(
                      //     strokeWidth: 2,
                      //     valueColor: AlwaysStoppedAnimation<Color>(
                      //         AppColors.primaryDeepColor)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    opaque: false,                    
                    pageBuilder: (pageBuilder,_,__)=>editEducationCard()));
                },
                child: SchoolsAttendedCard(
                  schoolName:
                      "Kwame Nkrumah University of Science and Technology",
                  program: "Bsc. Computer Science",
                  year: "2016 - 2020",
                ),
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

  Widget editEducationCard() {
    return Container(
      color: Colors.black.withOpacity(.4),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("School"),
                   SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    // controller: ,
                    cursorColor: AppColors.primaryDeepColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: AppColors.primaryDeepColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: AppColors.primaryDeepColor.withOpacity(.5),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color:
                              Theme.of(context).disabledColor.withOpacity(.06),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 12,
                  ),
                  Text("Degree, program"),
                   SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    // controller: ,
                    cursorColor: AppColors.primaryDeepColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: AppColors.primaryDeepColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: AppColors.primaryDeepColor.withOpacity(.5),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color:
                              Theme.of(context).disabledColor.withOpacity(.06),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 12,
                  ),
                  Text("Year"),
                   SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    // controller: ,
                    cursorColor: AppColors.primaryDeepColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: AppColors.primaryDeepColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: AppColors.primaryDeepColor.withOpacity(.5),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color:
                              Theme.of(context).disabledColor.withOpacity(.06),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  loadingButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loadingButton({bool? isRetry, Function? tap}) {
    return GestureDetector(
      onTap: () {
        tap?.call();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.primaryDeepColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: SizedBox(
            height: 15,
            width: 15,
            child: isRetry == true
                ? Icon(
                    Icons.replay_outlined,
                    color: Theme.of(context).canvasColor,
                  )
                : CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Theme.of(context).canvasColor,
                  ),
          ),
        ),
      ),
    );
  }
}
