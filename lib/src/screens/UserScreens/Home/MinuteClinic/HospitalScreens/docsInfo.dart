import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/doctorCard.dart';
import 'package:ecentialsclone/src/Widgets/sliverFab.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter/material.dart';

class DocsInfo extends StatefulWidget {
  const DocsInfo({Key? key}) : super(key: key);

  @override
  State<DocsInfo> createState() => _DocsInfoState();
}

class _DocsInfoState extends State<DocsInfo> {
  final _days = [
    "Mon",
    "Tue",
    "Wed",
    "Thur",
    "Fri",
  ];
  final _daysNum = [
    "1",
    "2",
    "3",
    "4",
    "5",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: SliverFab(
        expandedHeight: MediaQuery.of(context).size.height * 0.32,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            backgroundColor: AppColors.primaryDeepColor,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/doctor_hospital.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(
                top: 90,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("About"),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "My name is Dr. Andrews Opoku a Heart Surgeon at National Hospital.",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Availability"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          print(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: AppColors.primaryDeepColor,
                          ),
                          height: 70,
                          width: 50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _days[index],
                                style: TextStyle(
                                    color: AppColors.primaryBlackColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                _daysNum[index],
                                style: TextStyle(
                                    color: AppColors.primaryBlackColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text("Reviews"),
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.primaryOrangeColor,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("4.5"),
                      Text(
                        "(200)",
                        style: TextStyle(
                            color:
                                AppColors.primaryBlackColor.withOpacity(.50)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        floatingWidget: const doctorCard(
          fname: "Prince",
          lname: "Berth",
          hospital: "National Hospital",
          role: "Heart Surgeon",
        ),
        floatingPosition: const FloatingPosition(left: 0, right: 0),
      ),
    );
  }
}
