import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/UserScreens/Home/MinuteClinic/HospitalScreens/ambulance_map.dart';

class FloatingAmbulance extends StatelessWidget {
  const FloatingAmbulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // debugPrint("Ambulance Tapped");
        Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> const MapScreen()));
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/nav_ambulance.png"),
          ),
        ),
      ),
    );
  }
}
