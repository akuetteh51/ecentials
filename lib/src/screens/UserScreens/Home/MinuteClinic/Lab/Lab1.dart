// ignore_for_file: unused_import, no_logic_in_create_state, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, empty_statements, avoid_print

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';

import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
//import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Sreen3.dart';
//import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Lab5.dart';
import 'package:flutter/material.dart';

class lab1 extends StatefulWidget {
  const lab1({Key? key}) : super(key: key);

  @override
  State<lab1> createState() => _lab1State();
}

class _lab1State extends State<lab1> {
  get size => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar( backgroundColor: AppColors.primaryGreenColor,),
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

       backgroundColor: AppColors.primaryWhiteColor ,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: Icon(EcentialsIcons.menu_icon),

        actions: [
      
          Container(
             margin: EdgeInsets.all(10),
            child: CircleAvatar(backgroundImage: AssetImage("assets/images/profile.png")
            ),
             
          ),
        ]
  
        ),

     body:Container(

       
 margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,    
                         ),

           child: ListView(
          children: [
            Text(
              "Search for labs",
              style: TextStyle(
                  color: AppColors.primaryBlackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),


              SizedBox(
                    height: 20,
                  ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SizedBox(
                     width: 314.02,
                     child: Search()
                     ),

                     Container(
                       padding: const EdgeInsets.all(5.0),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:Colors.teal,
                        ),
                        
                        child: Icon(
                          EcentialsIcons.filter,
                            size: 20,
                            color: AppColors.primaryWhiteColor,
                         
                       ),
                     ),

       
          ]
           ),
           SizedBox(
                    height: 60,
                  ),
               LabResultsCard(image: "assets/images/card.png", 
               labName: "Ziky Clinical Laboratory", 
               openingHours: "Weekdays | 7:00am - 5:00pm"),
            
            
            SizedBox(
                    height: 20,
                  ),
              LabResultsCard(image: "assets/images/card-1.png", 
              labName: "AnuTech Medical Laboratory", 
              openingHours: "Weekdays | 7:00am - 5:00pm"),    
           SizedBox(
                    height: 20,
                  ),
              LabResultsCard(image: "assets/images/card-2.png", 
              labName: "AnuTech Medical Laboratory", 
              openingHours: "Weekdays | 7:00am - 5:00pm"),
  

  
          ]
     )  
     )
    );
  }
}
