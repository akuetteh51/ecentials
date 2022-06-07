import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:flutter/material.dart';

class pinCheck extends StatelessWidget {
  const pinCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(child: Center(
        child: Column(
            children:[SizedBox(height: 70,),Padding(
              padding: const EdgeInsets.only(left: 50.0,right: 50.0),
              child: Text("Create a 4-digit PIN to Secure your Store",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            ),SizedBox(height: 60,),Image.asset("assets/images/store_pin.png"),SizedBox(height: 20,),Button(text: "Next" ,width: 250,style: TextStyle(color: Colors.white,fontSize: 24), radius: 20,),
        ],),
      ),),
    );
  }
}
