import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UseCardWallet extends StatefulWidget {
  const UseCardWallet({Key? key}) : super(key: key);

  @override
  State<UseCardWallet> createState() => _UseCardWalletState();
}

class _UseCardWalletState extends State<UseCardWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.primaryWhiteColor,
            foregroundColor: AppColors.primaryBlackColor,
            elevation: 0,
            expandedHeight: MediaQuery.of(context).size.width * 0.70,
            pinned: true,
            floating: true,
            flexibleSpace: Container(
              margin: const EdgeInsets.only(top: 40),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      "assets/images/walletcard.png",
                    ),
                  ),
                  Positioned(
                    right: 80,
                    top: 60,
                    child: Image.asset("assets/images/chip.png"),
                  ),
                  Positioned(
                    right: 70,
                    child: Image.asset("assets/images/mastercard.png"),
                  ),
                ],
              ),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 600,
              decoration: BoxDecoration(
                color: AppColors.primaryWhiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -5),
                    color: AppColors.primaryBlackColor.withOpacity(.10),
                    blurRadius: 5.0,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          label: Text(
                            "Card Number",
                            style: TextStyle(
                              color:
                                  AppColors.primaryBlackColor.withOpacity(.70),
                              fontSize: 20,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  AppColors.primaryBlackColor.withOpacity(.50),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  AppColors.primaryBlackColor.withOpacity(.50),
                            ),
                          )),
                      cursorColor: AppColors.primaryBlackColor.withOpacity(.70),
                      keyboardType: TextInputType.number,
                      maxLength: 14,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          label: Text(
                            "Name",
                            style: TextStyle(
                              color:
                                  AppColors.primaryBlackColor.withOpacity(.70),
                              fontSize: 20,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  AppColors.primaryBlackColor.withOpacity(.50),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color:
                                  AppColors.primaryBlackColor.withOpacity(.50),
                            ),
                          )),
                      cursorColor: AppColors.primaryBlackColor.withOpacity(.70),
                      keyboardType: TextInputType.name,
                    ),
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
