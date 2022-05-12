
// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class pharmacy5 extends StatefulWidget {
  const pharmacy5({
    Key? key,
  }) : super(key: key);

  @override
  State<pharmacy5> createState() => _pharmacy5State();
}

class _pharmacy5State extends State<pharmacy5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavBar(  ),
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.primaryWhiteColor,

      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading:Icon(Icons.arrow_back),
        title: const Text("The MediShop Pharmacy",
          style: TextStyle(fontSize: 18),
        ),

        actions: [
         
          Container(
             margin: EdgeInsets.only(left:39.78, top: 0  ,right: 24.67),
            child: Icon(EcentialsIcons.scan_cam),
            ),
         
          
        ]
      ),

      body: SingleChildScrollView(
        
        child: Container(
          margin: const EdgeInsets.all(20),  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
            children:[
                 
               Search4(width: MediaQuery.of(context).size.width,)
                
            ],
            
          ),
        ),
      ),
    );
  }
}