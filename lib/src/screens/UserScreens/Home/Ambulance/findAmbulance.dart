import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/ambulanceResultsList.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulanceDirection.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulance_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FindAmulance extends StatefulWidget {
  const FindAmulance({Key? key}) : super(key: key);

  @override
  State<FindAmulance> createState() => _FindAmulanceState();
}

class _FindAmulanceState extends State<FindAmulance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        title: const Text("Find Ambulance"),
        centerTitle: true,
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        child: Button(
          onTap: () {
            Get.to(() => AmbulanceDirection());
          },
          text: "Confirm",
          color: AppColors.primaryRedColor,
          style: TextStyle(
            color: AppColors.primaryWhiteColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * 0.8,
            width: MediaQuery.of(context).size.width,
            child: const mapScreen(),
          ),
          const SizedBox(
            height: 10,
          ),
          const ambulanceResultsList(
            type: "Normal",
            discount: 0,
            description: "With oxygen",
            prize: 45,
          ),
          const SizedBox(
            height: 10,
          ),
          const ambulanceResultsList(
            type: "Mid-level",
            discount: 10,
            description: "With oxygen",
            prize: 45,
          ),
        ],
      ),
    );
  }
}
