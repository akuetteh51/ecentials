// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanDocument.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class DrugDashboard extends StatefulWidget {
  const DrugDashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<DrugDashboard> createState() => _DrugDashboardState();
}

class _DrugDashboardState extends State<DrugDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          elevation: 0,
          leading: Icon(Icons.arrow_back),
          title: const Text(
            "The MediShop Pharmacy",
            style: TextStyle(fontSize: 18),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(left: 39.78, top: 0, right: 24.67),
              child: IconButton(
                onPressed: () {
                  Get.to(() => ScanDocument());
                },
                icon: Icon(EcentialsIcons.scan_cam),
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Search4(
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: 200,
                width: 360,
                margin:
                    const EdgeInsets.only(top: 16, left: 22.79, right: 25.21),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 240, 244),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text("We will deliver your medicines",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Montserrat",
                        )),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                      height: 33.33,
                      width: 101.62,
                      margin: const EdgeInsets.only(
                        top: 32,
                        left: 22.39,
                      ),
                      child: Text("Popular",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ))),
                  Container(
                    height: 20,
                    width: 22.86,
                    margin: const EdgeInsets.only(
                      right: 20.51,
                      left: 242.55,
                    ),
                    child: Icon(
                      EcentialsIcons.filter,
                      color: AppColors.primaryBlackColor,
                      size: 30,
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 7.78,
                  left: 27.8,
                ),
                child: Row(
                  children: [
                    drugCard(
                        drugName: "Ibuprofen",
                        drugType: "Tablets",
                        quantity: 50,
                        price: 5.00),
                    Container(
                        margin: const EdgeInsets.only(
                          left: 17,
                        ),
                        child: drugCard(
                            drugName: "Biotin",
                            drugType: "Tablets",
                            quantity: 50,
                            price: 5.00))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 22.8,
                  left: 27.8,
                ),
                child: Row(
                  children: [
                    drugCard(
                        drugName: "Ibuprofen",
                        drugType: "Tablets",
                        quantity: 50,
                        price: 5.00),
                    Container(
                        margin: const EdgeInsets.only(
                          left: 17.8,
                        ),
                        child: drugCard(
                            drugName: "Biotin",
                            drugType: "Tablets",
                            quantity: 50,
                            price: 5.00))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
