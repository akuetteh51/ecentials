// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class Hospital3 extends StatefulWidget {
  final bool hasNotification;

  const Hospital3({Key? key, this.hasNotification = false}) : super(key: key);

  @override
  State<Hospital3> createState() => _Hospital3State();
}

class _Hospital3State extends State<Hospital3> {
  // get child => null;

  @override
  Widget build(BuildContext context)=>DefaultTabController(length: 3, child: 
     Scaffold(

      backgroundColor: AppColors.primaryWhiteColor ,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,

         title: const Text("Schedule",
          style: TextStyle(fontSize: 18),
          ),
        centerTitle: true,
        leading:Icon(Icons.arrow_back),
     actions: [
      Container(
        margin: EdgeInsets.all(20),               
    child: Stack(
   children:[
      Positioned(
        child: Icon(EcentialsIcons.notification),
      ),
         Positioned  (
          right: 0,
          top:0,
          child:
          
          Icon(EcentialsIcons.circle_add,
          size:10,
          color: Color.fromARGB(255, 215, 20, 6),),
         
         ), 
  ],
)
      ),


          Container(
             margin: EdgeInsets.all(10),
            child: CircleAvatar(backgroundImage: AssetImage("assets/images/profile.png")
            ),
          ),
         
        ],
       
        bottom: 
           TabBar(
                  tabs: [
                    
                    Tab(text: 'Upcoming',),
                    Tab(text:'Completed',),
                    Tab(text: 'Canceled',),
                  ],
                ),
           
           
        ), 
  
        
        bottomNavigationBar: BottomNavBar(backgroundColor: AppColors.primaryGreenColor,),

        floatingActionButton: FloatingAmbulance(),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

  body:SingleChildScrollView(
     child: SafeArea(
        child: Padding(
           padding: const EdgeInsets.only(top: 30),
           
             
             child: Container(
                margin: EdgeInsets.all(20),
                    child: Column(
                   children: [
                      SchedulesCard(
                        
                        image: "assets/images/doctor.png",
                        docName: "Dr. John Doe",
                        specialization: "Heart Surgeon ",
                        hospitalName: "National Hospital",
                        time: "10:00 AM",
                        date: "12/09/22"),

                        SizedBox(
                           height: 18,
                           ),

                    SchedulesCard(
                        image: "assets/images/doctor.png",
                        docName: "Dr. John Doe",
                        specialization: "Heart Surgeon ",
                        hospitalName: "National Hospital",
                        time: "10:00 AM",
                        date: "12/09/22"),

                        SizedBox(
                          height: 18,
                        ),

                    SchedulesCard(
                        image: "assets/images/doctor.png",
                        docName: "Dr. John Doe",
                        specialization: "Heart Surgeon ",
                        hospitalName: "National Hospital",
                        time: "10:00 AM",
                        date: "12/09/22"),

                    
                   ],
                                
               ),
             ),
           )
        ) 
     )
   ),
     
    );
  }

