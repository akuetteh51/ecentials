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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).disabledColor.withOpacity(.75),
            )),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Search4(
                  width: MediaQuery.of(context).size.width,
                ),
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
                child: Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("We will deliver your medicines",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Montserrat",
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(                     
                          child: Text("Popular",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                              ),),),
                      SizedBox(
                        // color: Colors.amber,
                        height: 30,                     
                        child: Icon(
                          EcentialsIcons.filter,
                          color: AppColors.primaryBlackColor,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
                          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 210,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Wrap(children: [
                        for (int j = 0; j < 5; j++)
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: drugCard(
                                drugName: "Ibuprofen",
                                drugType: "Tablets",
                                quantity: 50,
                                price: 5.00),
                          ),
                      ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
