import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulanceNear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingAmbulance extends StatelessWidget {
  const FloatingAmbulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
<<<<<<< HEAD
        debugPrint("Ambulance Tapped");
=======
        Get.to(() => AmbulanceNear());
>>>>>>> 3c5899f4628a7793782dcf8f4d0e9936e279d8d3
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/nav_ambulance.png"),
          ),
        ),
      ),
    );
  }
}
