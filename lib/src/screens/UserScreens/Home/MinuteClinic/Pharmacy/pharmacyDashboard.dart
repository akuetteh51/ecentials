// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/pharmacyCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';

class pharmacyDashboard extends StatefulWidget {
  const pharmacyDashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<pharmacyDashboard> createState() => _pharmacyDashboardState();
}

class _pharmacyDashboardState extends State<pharmacyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset("assets/images/Vector.png"),
        title: Text("Ghana"),
        titleSpacing: 0,
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        bottom: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                EcentialsIcons.menu_icon,
                color: AppColors.primaryDeepColor,
              ),
            ),
          ),
          title: RichText(
            text: const TextSpan(
              text: "Hi, ",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Montserrat",
              ),
              children: [
                TextSpan(
                    text: "Sussan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    )),
              ],
            ),
          ),
          actions: [
            GestureDetector(
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 20,
                left: 10,
              ),
              child: Icon(
                EcentialsIcons.cart,
                color: AppColors.primaryDeepColor,
                size: 30,
              ),
            )
          ],
        ),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Search4(
                width: MediaQuery.of(context).size.width,
                text: "Enter your search term here ",
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 38, // left: 24.78
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(
                      //  top: 38, // left: 24.78
                      // ),
                      width: 150,
                      height: 150,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          depth: 10,
                          lightSource: LightSource.top,
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/upload.png"),
                            SizedBox(
                              height: 20,
                            ),
                            Button(
                              text: "Upload",
                              height: 30,
                              width: 100,
                              style:
                                  TextStyle(color: AppColors.primaryWhiteColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          depth: 10,
                          lightSource: LightSource.top,
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/find.png"),
                            SizedBox(
                              height: 20,
                            ),
                            Button(
                              text: "Find",
                              height: 30,
                              width: 100,
                              style:
                                  TextStyle(color: AppColors.primaryWhiteColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 27.9, // left: 24.78
                ),
                child: Text(
                  "Pharmacies  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: "Montserrat",
                  ),
                ),
              ),
              Row(
                children: [
                  PharmacyCard(
                      pharmacyName: "Top up pharmacy ",
                      location: "Spintex",
                      address: "Accra",
                      country: "Ghana"),
                  SizedBox(
                    width: 16,
                  ),
                  PharmacyCard(
                    pharmacyName: "The Medishop ",
                    location: "Pharmacy",
                    address: "Accra",
                    country: "Ghana",
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 27.9, // left: 24.78
                ),
                child: Row(
                  children: [
                    Text(
                      "Popular OTC Drugs",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Container(
                        height: 20,
                        width: 22.86,
                        margin: const EdgeInsets.only(
                          left: 67.03,
                        ),
                        child: Icon(
                          EcentialsIcons.filter,
                          size: 30,
                          color: Color.fromARGB(255, 69, 68, 68),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 11.37),
                child: Row(
                  children: [
                    drugCard(
                        drugName: "Ibuprofen",
                        drugType: "Tablets",
                        quantity: 50,
                        price: 5.00),
                    Container(
                      margin: EdgeInsets.only(left: 17.03),
                      child: drugCard(
                          drugName: "Ibuprofen",
                          drugType: "Tablets",
                          quantity: 50,
                          price: 5.00),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 22.88),
                child: Row(
                  children: [
                    drugCard(
                        drugName: "Ibuprofen",
                        drugType: "Tablets",
                        quantity: 50,
                        price: 5.00),
                    Container(
                      margin: EdgeInsets.only(left: 17.03),
                      child: drugCard(
                          drugName: "Ibuprofen",
                          drugType: "Tablets",
                          quantity: 50,
                          price: 5.00),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
