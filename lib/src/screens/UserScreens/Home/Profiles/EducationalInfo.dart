// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/models/UserEducationModel.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/addSchoolButton.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schoolsAttendedCard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/add_education.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app_state/user_state.dart';

class EducationalInfo extends StatefulWidget {
  const EducationalInfo({Key? key}) : super(key: key);

  @override
  State<EducationalInfo> createState() => _EducationalInfoState();
}

class _EducationalInfoState extends State<EducationalInfo> {
  getEducationDataFromServer() {
    UserState userState = Provider.of<UserState>(context, listen: false);
    userState.getEducation(token: userState.userInfo?['token']);
    // .then((UserEducationModel? user) {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      getEducationDataFromServer();
    });
  }

  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context);
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
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(
                      "SCHOOLS ATTENDED",
                      style: TextStyle(
                        color: AppColors.primaryDeepColor,
                      ),
                    ),
                    // SizedBox(
                    //   height: 15.0,
                    //   width: 15.0,
                    //   // child: ,
                    //   //  CircularProgressIndicator(
                    //   //     strokeWidth: 2,
                    //   //     valueColor: AlwaysStoppedAnimation<Color>(
                    //   //         AppColors.primaryDeepColor),),
                    // ),
                    SizedBox(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (pageBuilder, _, __) => AddEducation(
                                    isNew: true,
                                  )));
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.primaryDeepColor,
                          size: 30,
                        ),
                      ),

                      //  CircularProgressIndicator(
                      //     strokeWidth: 2,
                      //     valueColor: AlwaysStoppedAnimation<Color>(
                      //         AppColors.primaryDeepColor),),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              userState.gettingEducationState == 2
                  ? Column(
                      children: [
                       
                          // SchoolsAttendedCard(
                          //   schoolName: "",
                          //   program:"",
                          //   year: "xxxx - xxxx",
                          //   onEdit: () {
                          //     Navigator.of(context).push(PageRouteBuilder(
                          //         opaque: false,
                          //         pageBuilder: (pageBuilder, _, __) =>
                          //             AddEducation(
                          //               isNew: false,
                          //               school: "",
                          //               program: "",
                          //               year: "xxxx - xxxx",
                          //               elementId: "2342rwef",
                          //             )));
                          //   },
                          // ),
                        for (int i = 0;
                            i <= userState.userEducation!.length - 1;
                            i++)
                          SchoolsAttendedCard(
                            schoolName:
                                userState.userEducation![i].school_name ?? "",
                            program: userState.userEducation![i].course ?? "",
                            year: userState.userEducation![i].duration ??
                                "xxxx - xxxx",
                            onEdit: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (pageBuilder, _, __) =>
                                      AddEducation(
                                        isNew: false,
                                        school: userState.userEducation![i]
                                                .school_name ??
                                            "",
                                        program: userState
                                                .userEducation![i].course ??
                                            "",
                                        year: userState
                                                .userEducation![i].duration ??
                                            "xxxx - xxxx",
                                            elementId: userState.userEducation![i].id,
                                      )));
                            },
                          ),
                      ],
                    )
                  : userState.gettingEducationState == 1
                      ? Center(
                          child: SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: AppColors.primaryDeepColor,
                            ),
                          ),
                        )
                      : Center(
                          child: GestureDetector(
                              onTap: () {
                                getEducationDataFromServer();
                              },
                              child: Icon(
                                Icons.replay,
                                color: AppColors.primaryDeepColor,
                                size: 30,
                              )),
                        ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (pageBuilder, _, __) => AddEducation(
                              isNew: true,
                            )));
                  },
                  child: AddSchoolButton()),
            ],
          ),
        ),
      ),
    );
  }

  // Widget editEducationCard({bool? isNew}) {

  //   return ;
  // }

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
