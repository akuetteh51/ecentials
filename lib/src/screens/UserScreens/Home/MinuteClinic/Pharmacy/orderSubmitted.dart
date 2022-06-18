// ignore_for_file: unused_import, prefer_const_constructors, camel_case_types

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class OrderSubmitted extends StatefulWidget {
  const OrderSubmitted({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderSubmitted> createState() => OrderSubmittedState();
}

class OrderSubmittedState extends State<OrderSubmitted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(            
            children: [              
              Container(
                height: 250,
                width: 300,
                margin: const EdgeInsets.only(
                  top: 45.9,
                ),
                child: Image.asset("assets/images/order_submitted.png"),
              ),
              Container(
                  height: 22,
                  margin: const EdgeInsets.only(
                    top: 30.1,
                  ),
                  child: Text("Order submitted!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                      ))),
              Container(
                  height: 16,
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text("Hold on! Your order is being processed.",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Montserrat",
                      ))),
              Container(
                  height: 35,
                  width: 35,
                  margin: const EdgeInsets.only(
                    top: 30.43,
                  ),
                  child: Image.asset("assets/images/Vector1.png")),
            ],
          ),
        ),
      ),
    );
  }
}
