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
      bottomNavigationBar: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: AppColors.primaryWhiteColor,
        child: Center(
          child: Button(
            color: AppColors.primaryRedColor,
            width: MediaQuery.of(context).size.width - 40,
            text: "Pay Now",
            onTap: () {
              Get.to(() => const Payed());
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
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            color: AppColors.primaryOrangeColor,
            child: const MapScreen(),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("How would like to pay"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "GHC 250",
                  style: TextStyle(color: AppColors.primaryGreenColor),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrangeColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    height: 80,
                    child: Stack(
                      children: [
                        Container(
                          height: 75,
                          decoration: BoxDecoration(
                              color: AppColors.primaryWhiteColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, -1),
                                  color: AppColors.primaryBlackColor
                                      .withOpacity(.10),
                                  blurRadius: 5,
                                  spreadRadius: 1.5,
                                )
                              ]),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/logo.png",
                                        height: 30,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 10,
                                        ),
                                        child: Text(
                                          "Wallet",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.deepPurple,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 10,
                                    ),
                                    Text("Ending 8988")
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Card(
                        elevation: 10,
                        child: Button(
                          height: 60,
                          text: "Cash",
                          hasIcon: true,
                          icon: EcentialsIcons.cash,
                          iconColor: AppColors.primaryGreenColor,
                          color: AppColors.primaryWhiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: Card(
                        elevation: 10,
                        child: Button(
                          height: 60,
                          text: "Cash",
                          hasIcon: true,
                          icon: EcentialsIcons.circle_add,
                          iconColor: AppColors.primaryBlueColor,
                          color: AppColors.primaryWhiteColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
