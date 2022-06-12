import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulance_map.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Payments/paymentMethod.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmbulanceDirection extends StatefulWidget {
  const AmbulanceDirection({Key? key}) : super(key: key);

  @override
  State<AmbulanceDirection> createState() => _AmbulanceDirectionState();
}

class _AmbulanceDirectionState extends State<AmbulanceDirection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black54,
          ),
        ),
        title: const Text("Zicky Clinical Laboratory"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: mapScreen(),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 15,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("assets/images/profile.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Andrews Opoku",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.location_on,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("10 Mtr Left")
                                    ],
                                  )
                                ],
                              ),
                              Icon(
                                EcentialsIcons.arrowback,
                                color: AppColors.primaryDeepColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Button(
                          width: 150,
                          color: AppColors.primaryGreenColor,
                          text: "Start Trip",
                          style: TextStyle(color: AppColors.primaryWhiteColor),
                          onTap: () {
                            Get.to(() => const PaymentMethod());
                          },
                        ),
                        Button(
                          width: 150,
                          color: AppColors.primaryRedColor,
                          text: "Cancel",
                          style: TextStyle(color: AppColors.primaryWhiteColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
