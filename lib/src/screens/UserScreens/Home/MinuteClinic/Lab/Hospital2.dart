// ignore_for_file: unused_import, prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/doctorCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/sliverFab.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class Hospital2 extends StatefulWidget {
  

  const Hospital2({
    Key? key,   }) : super(key: key);

  @override
  State<Hospital2> createState() => _Hospital2State();
}

class _Hospital2State extends State<Hospital2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.primaryWhiteColor ,
    

    body: SliverFab(
     
       floatingWidget: 
       FloatingActionButton(
          backgroundColor: AppColors.primaryOrangeColor,
          onPressed: () {
            Get.to(
              () => doctorCard(fname: 'Dr. Sussy ', hospital: 'National hospital', lname: 'Agams', role: 'Optometry Lab Technician',),
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
           )
       ),
         ]
    )
    );
  }
}
