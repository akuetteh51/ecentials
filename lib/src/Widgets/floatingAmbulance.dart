import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulanceNear.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingAmbulance extends StatelessWidget {
  const FloatingAmbulance({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AmbulanceNear());
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/nav_ambulance.png"),
          ),
        ),
      ),
    );
  }
}
