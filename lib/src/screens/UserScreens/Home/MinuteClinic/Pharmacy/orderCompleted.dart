// ignore_for_file: unused_import, file_names, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/drugDashboard.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class OrderCompleted extends StatefulWidget {
  const OrderCompleted({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderCompleted> createState() => _OrderCompletedState();
}

class _OrderCompletedState extends State<OrderCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 250.07,
                  width: 300,
                  child: Image.asset("assets/images/order_complete.png")),
              Container(
                  height: 22,
                  margin: const EdgeInsets.only(
                    top: 20.25,
                  ),
                  child: Text("Order completed!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                      ))),
              Container(
                  height: 16,
                  width: 133,
                  margin: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Text("Order number:#987",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Montserrat",
                      ))),
              Wrap(
                children: [
                  Container(
                    height: 20,
                    // width: 116,
                    margin: const EdgeInsets.only(
                      top: 42.28,
                    ),
                    child: Text("Ordered Items",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Montserrat",
                          color: const Color(0xFF424347),
                        )),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 16,
                      //  width: 116,
                      margin: const EdgeInsets.only(
                        top: 43.28,
                      ),
                      child: Text("Order",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                            color: const Color(0xFF3E3E3E),
                          )),
                    ),
                    Container(
                      height: 16,
                      margin: const EdgeInsets.only(
                        top: 43.28,
                        // left: 245,
                      ),
                      child: Text("\$28.00",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                            color: const Color(0xFF3E3E3E),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 16,
                      //  width: 116,
                      margin: const EdgeInsets.only(
                        top: 7,
                      ),
                      child: Text("Delivery",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                            color: const Color(0xFF3E3E3E),
                          )),
                    ),
                    Container(
                      height: 16,
                      margin: const EdgeInsets.only(
                        top: 7,
                      ),
                      child: Text("\$7.20",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                            color: const Color(0xFF3E3E3E),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 16,
                      margin: const EdgeInsets.only(
                        top: 7,
                      ),
                      child: Text("Summary",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            color: const Color(0xFF424347),
                          )),
                    ),
                    Container(
                      height: 16,
                      margin: const EdgeInsets.only(
                        top: 7,
                      ),
                      child: Text("\$35.20",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                            color: const Color(0xFF424347),
                          )),
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                width: 338,
                margin: const EdgeInsets.only(top: 61.72, left: 35, right: 35),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 240, 244),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Button(
                  onTap: () {
                    Get.to(() => DrugDashboard());
                  },
                  text: "Continue Shopping",
                  height: 18,
                  width: 99,
                  style: TextStyle(
                      color: AppColors.primaryWhiteColor,
                      fontSize: 14,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.only(top: 10,left: 35, right: 35),
                  child: Wrap(
                    children: [
                    ButtonOutlined(
                      text: "Track Delivery",
                      style: TextStyle(color: const Color(0xFF033A64)),
                      color: const Color(0xFF033A64),
                      width: 338,
                      height: 55,
                      radius: 10,
                    ),
                  ]),),
            ],
          ),
        ),
      ),
    );
  }
}
