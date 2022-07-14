import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Wallet/topupSuccessful.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CardTopup extends StatelessWidget {
  const CardTopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Stack(
                    children: [
                      Positioned(
                        child: Image.asset("assets/images/walletcard.png"),
                      ),
                      Positioned(
                        top: 45,
                        right: 45,
                        left: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Holder name",
                                    style: TextStyle(
                                      color: AppColors.primaryWhiteColor
                                          .withOpacity(.50),
                                    ),
                                  ),
                                  Text(
                                    "Andrews Opoku Senior Antwi Opoku Gyapwata",
                                    style: TextStyle(
                                      color: AppColors.primaryWhiteColor,
                                      fontSize: 20,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset("assets/images/chip.png"),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 100,
                        right: 45,
                        left: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card number",
                              style: TextStyle(
                                color: AppColors.primaryWhiteColor
                                    .withOpacity(.50),
                              ),
                            ),
                            Text(
                              "5627 21** **** 8869",
                              style: TextStyle(
                                color: AppColors.primaryWhiteColor,
                                fontSize: 24,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 30,
                        left: 50,
                        top: 175,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Exp. Date",
                                  style: TextStyle(
                                    color: AppColors.primaryWhiteColor
                                        .withOpacity(.50),
                                  ),
                                ),
                                Text(
                                  "16/19",
                                  style: TextStyle(
                                    color: AppColors.primaryWhiteColor,
                                    fontSize: 18,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "CVC",
                                  style: TextStyle(
                                    color: AppColors.primaryWhiteColor
                                        .withOpacity(.50),
                                  ),
                                ),
                                Text(
                                  "***",
                                  style: TextStyle(
                                    color: AppColors.primaryWhiteColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ],
                            ),
                            Image.asset("assets/images/mastercard.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                        color: AppColors.primaryBlackColor.withOpacity(.70),
                      ),
                    ),
                    Text(
                      "Balance GHC 20.00",
                      style: TextStyle(
                        color: AppColors.primaryBlackColor.withOpacity(.70),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Neumorphic(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 20,
                  ),
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    depth: 0,
                    color: Colors.grey.withOpacity(.20),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 20),
                    cursorColor: AppColors.primaryDeepColor,
                    decoration: const InputDecoration(
                      hintText: "0.00",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Button(
                  width: 150,
                  radius: 8,
                  text: "Top up",
                  style: TextStyle(
                    color: AppColors.primaryWhiteColor,
                  ),
                  onTap: () {
                    Get.to(() => TopupSuccessful());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
