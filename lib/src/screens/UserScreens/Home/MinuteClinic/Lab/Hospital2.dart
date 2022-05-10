// ignore_for_file: unused_import, prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
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
     /* appBar: AppBar(

       backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading:Icon(Icons.arrow_back),

      ),*/
      
    );
  }
}
