import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloatingAmbulance extends StatelessWidget {
  const FloatingAmbulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("Ambulance Tapped");
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
