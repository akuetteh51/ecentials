// ignore_for_file: unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/pharmacyDashboard.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryWhiteColor,
        // backgroundColor: Colors.amber,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Container(
          margin: const EdgeInsets.only(
            // left: 132.59,
          ),
          
          child: const Text(
            "Cart",
            style: TextStyle(
                fontSize: 18,
                fontFamily: " Montserrat",
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  // color: Colors.amber,
                    height: 250.0,
                    width:MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      // top: 45.83,
                      // left: 5.36,
                      // right: 5.36,
                    ),
                    child: Image.asset("assets/images/empty_cart.png",scale: 1.0,)),
                Container(
                    height: 25,
                    // width: 226,
                    margin: const EdgeInsets.only(
                      top: 35.17,
                      // left: 94,
                      // right: 94,
                    ),
                    child: Text("YOUR CART IS EMPTY!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ))),
                Container(
                    height: 20,
                    //  width: 202,
                    margin:
                        const EdgeInsets.only(
                          top: 12, 
                          // left: 94, right: 118
                          ),
                    child: Text("Start shopping to fill it up",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Montserrat",
                        ))),
                Container(
                  height: 53,
                  width: 301.94,
                  margin: const EdgeInsets.only(
                      top: 50.33, left: 56.03, right: 56.03),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 230, 240, 244),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Button(
                    onTap: () {
                      Get.to(() => PharmacyDashboard());
                    },
                    text: "Go Shopping",
                    height: 18,
                    width: 99,
                    style: TextStyle(
                        color: AppColors.primaryWhiteColor,
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
