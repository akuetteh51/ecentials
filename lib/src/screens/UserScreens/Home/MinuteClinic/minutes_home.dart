import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Widgets/Dashboard.dart';
import 'HospitalScreens/nearbyHospital.dart';
import 'Lab/alllabs.dart';
import 'Pharmacy/pharmacyDashboard.dart';

class MinutesHome extends StatefulWidget {
  const MinutesHome({ Key? key }) : super(key: key);

  @override
  State<MinutesHome> createState() => _MinutesHomeState();
}

class _MinutesHomeState extends State<MinutesHome> {
  
    // Images
    final _images = [
      "assets/images/hospital.png",
      "assets/images/pharmacy.png",
      "assets/images/lab.png",
    ];

    // Button Names
    final _btnNames = [
      "Hospital",
      "Pharmacy",
      "Lab",
    ];

  @override
  Widget build(BuildContext context) {
    return Column(
            children: List.generate(
              3,
              (index) => DashBoard( 
                  image: _images[index],
                  btnName: _btnNames[index],
                  //  if(index == 0){
                  onTap: () {
                    if (index == 0) {
                      Get.to(
                        () => const NearbyHospital(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 300),
                      );
                    } else if (index == 1) {
                      Get.to(
                        () => const PharmacyDashboard(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 300),
                      );
                    } else {
                      Get.to(
                        () => const Alllabs(),
                        transition: Transition.fadeIn,
                        duration: const Duration(milliseconds: 300),
                      );
                    }

                    // }
                  }),
            ),
          );
  }
}