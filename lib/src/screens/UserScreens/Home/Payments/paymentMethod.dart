

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulance_map.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Payments/Payed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: AppColors.primaryWhiteColor,
        child: Center(
          child: Button(
            color: AppColors.primaryRedColor,
            width: MediaQuery.of(context).size.width - 40,
            text: "Pay Now",
            onTap: () {
              Get.to(() => Payed());
            },
            style: TextStyle(
              color: AppColors.primaryWhiteColor,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            color: AppColors.primaryOrangeColor,
            child: const mapScreen(),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("How would you like to pay,"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "GHC 120",
                        style: TextStyle(
                          color: AppColors.primaryGreenColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 70,
                      child: Card(
                        shadowColor: AppColors.primaryRedColor,
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide())),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/logo.png",
                                    scale: 1.9,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      "Wallet",
                                      style: TextStyle(
                                        color: AppColors.primaryBlueColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 12,
                                ),
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text("Ending 8988"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 10,
                          child: Button(
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            text: "Cash",
                            icon: EcentialsIcons.cash,
                            iconColor: AppColors.primaryGreenColor,
                            hasIcon: true,
                            color: AppColors.primaryWhiteColor,
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: Button(
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            text: "Add New",
                            icon: EcentialsIcons.circle_add,
                            iconColor: AppColors.primaryBlueColor,
                            hasIcon: true,
                            color: AppColors.primaryWhiteColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
