// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app_state/hospital_state.dart';
import '../../../../../app_state/user_state.dart';
import 'hospitalHome.dart';

class NearbyHospital extends StatefulWidget {
  final String Searchdata;
  const NearbyHospital({required this.Searchdata,Key? key}) : super(key: key);

  @override
  State<NearbyHospital> createState() => _NearbyHospitalState();
}

// 0201855778
class _NearbyHospitalState extends State<NearbyHospital> {
  @override
  Widget build(BuildContext context) {
    HospitalState hospitalState =
        Provider.of<HospitalState>(context, listen: false);
    HospitalState TopDoctorState =
        Provider.of<HospitalState>(context, listen: false);
    UserState userState = Provider.of<UserState>(context, listen: false);

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
  
    return SingleChildScrollView(
      child: Column(
        children: [
          //Testing Hospital Search and Top Dctor Backend
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
                  style:
                      TextStyle(fontSize: 17, color: AppColors.primaryRedColor),
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: hospitalState.Hospital(SearhData: {"search_text": widget.Searchdata},
                token: userState.userInfo?['token'],
              ),
              builder: (context, AsyncSnapshot hospitalState) {
                String? hospital;
                if (hospitalState.hasData) {
                  List hospital = hospitalState.data;
                  if (hospital.isNotEmpty) {
                    hospital = hospital.first;
                  }
                }
                return Text(
                  "${hospital ?? "no data"}",
                  // "Find a Nearby Hospital",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                );
              }),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: FutureBuilder(
                future: TopDoctorState.TopDoctor(
                  token: userState.userInfo?['token'],
                ),
                builder: (context, AsyncSnapshot TopDoctorState) {
                  if (TopDoctorState.hasData) {
                    List topDoctor = TopDoctorState.data;
                    if (topDoctor.isNotEmpty) {
                      return Row(
                        children: List.generate(
                          topDoctor.length,
                          (index) => TopDoctor(
                            image: topDoctor[index]["image"],
                            docName: topDoctor[index]["name"],
                            days: topDoctor[index]["days"],
                            specialization: topDoctor[index]["area"],
                            experience: topDoctor[index]["experience"],
                          ),
                        ),
                      );
                    }
                    return Text("No Data found");
                  }
                  return CircularProgressIndicator();
                }),
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
    );
  }
}
