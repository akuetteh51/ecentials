import 'package:ecentialsclone/src/screens/UserScreens/Home/Wallet/confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../../../Themes/colors.dart';
import '../../../../Widgets/button.dart';

class Load extends StatefulWidget {
  const Load({Key? key}) : super(key: key);

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Image.asset("assets/images/walletcard.png"),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 90,
                      child: Column(
                        children: [
                          Text(
                            "Balance",
                            style:
                                TextStyle(color: AppColors.primaryWhiteColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "GHC 200.00",
                            style: TextStyle(
                              color: AppColors.primaryWhiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Order ID",
                style: TextStyle(
                  color: AppColors.primaryBlackColor.withOpacity(.70),
                ),
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
                  color: Colors.grey.withOpacity(.10),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(fontSize: 20),
                  cursorColor: AppColors.primaryDeepColor,
                  decoration: const InputDecoration(
                    hintText: "#ORD-234566",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Button(
                  radius: 10,
                  text: "Load",
                  width: 250,
                  style: TextStyle(
                    color: AppColors.primaryWhiteColor,
                  ),
                  onTap: () {
                    Get.to(() => Confirm());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
