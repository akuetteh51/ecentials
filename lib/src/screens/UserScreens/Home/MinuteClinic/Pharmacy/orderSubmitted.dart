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
                height: 300,
                width: 300,
                margin: const EdgeInsets.only(
                  top: 167.9,
                  left: 57,
                  right: 57,
                ),
                child: Image.asset("assets/images/order_submitted.png"),
              ),
              Container(
                  height: 22,
                  margin: const EdgeInsets.only(
                    top: 15.1,
                    left: 131.1,
                    right: 130.5,
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
                    left: 86.5,
                    right: 76.5,
                  ),
                  child: Text("Hold on! Your order is being processed.",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Montserrat",
                      ))),
              Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(
                    top: 59.43,
                    left: 182,
                    right: 182,
                  ),
                  child: Image.asset("assets/images/Vector1.png")),
            ],
          ),
        ),
      ),
    );
  }
}
