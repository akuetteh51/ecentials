// ignore_for_file: unused_import, prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/doctorCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/sliverFab.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/TechnicianSchedule.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class DoctorInformation extends StatefulWidget {
  const DoctorInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<DoctorInformation> createState() => _DoctorInformationState();
}

class _DoctorInformationState extends State<DoctorInformation> {
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
            Get.to(() => TechnicianSchedule());
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
        body: SliverFab(
            floatingWidget: FloatingActionButton(
              backgroundColor: AppColors.primaryOrangeColor,
              onPressed: () {
                Get.to(
                  () => doctorCard(
                    fname: 'Dr. Sussy ',
                    hospital: 'National hospital',
                    lname: 'Agams',
                    role: 'Optometry Lab Technician',
                  ),
                  transition: Transition.circularReveal,
                  duration: Duration(seconds: 1),
                );
              },
              // child: doctorCard(fname: "err", lname: "errr", role: "errr", hospital: "errr"),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            slivers: [
              SliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height * 0.4,
                  backgroundColor: AppColors.primaryDeepColor,
                  pinned: true,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/images/hospital2.png",
                      fit: BoxFit.cover,
                    ),
                  )),

            ]
            )
            );
  }
}
