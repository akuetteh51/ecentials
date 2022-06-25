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
                            mainAxisSize: MainAxisSize.min,
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
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Courier",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryDeepColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Icon(
                                          EcentialsIcons.arrowback,
                                          color: AppColors.primaryDeepColor,
                                          size: 20,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Andrews Kwadwo Opoku",
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "GH 039-899",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryBlueColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
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
                              ),
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
