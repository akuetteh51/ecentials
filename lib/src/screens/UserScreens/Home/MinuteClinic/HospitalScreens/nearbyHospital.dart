
import 'package:ecentialsclone/src/Themes/colors.dart';

import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../Widgets/hospitalResultsCard.dart';
import '../../../../../app_state/hospital_state.dart';
import '../../../../../app_state/user_state.dart';
import 'Lab5.dart';


class NearbyHospital extends StatefulWidget {
  final String Searchdata;
  const NearbyHospital({required this.Searchdata, Key? key}) : super(key: key);

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
          FutureBuilder(
            future: hospitalState.Hospital(
              SearhData: {"search_text": widget.Searchdata},
              token: userState.userInfo?['token'],
            ),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if(snapshot.hasError) {
                  return Text("Error Occured: ${snapshot.error}");
                }

                if (snapshot.hasData) {
                  List hospitals = snapshot.data;
                  // print("-- Results: $hospitals");

                   return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: hospitals.length,
                    itemBuilder: (context, index) {
                      Map hospital = hospitals[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)  => LabScreen(
                            data: hospital,
                          )));
                        },
                        child: HospitalResultsCard(
                          image: hospital["images"][0],
                          labName: hospital["name"],
                          openingHours: hospital["opening_hours"],
                        ),
                      );
                    },
                  );
                }
              }

              return Center(child: Column(
                children: [SizedBox(
            height: 40,
          ),CircularProgressIndicator(),SizedBox(
            height: 10,
          ),
                  Text("Loading..."),
                ],
              ),);
            },
          ),
         
        ],
      ),
    );
  }
}
