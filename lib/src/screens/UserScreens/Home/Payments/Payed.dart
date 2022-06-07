import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter/material.dart';

class Payed extends StatefulWidget {
  const Payed({Key? key}) : super(key: key);

  @override
  State<Payed> createState() => _PayedState();
}

class _PayedState extends State<Payed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                EcentialsIcons.circle_correct,
                color: AppColors.primaryRedColor,
                size: 100,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Payment Successful!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "13 Mar 2022, 05:25 PM",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 40,
                child: Text(
                  "Transaction ID: dae6au-4ksne9e-9lkj",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(
                      color: AppColors.primaryBlackColor.withOpacity(.50),
                    ),
                  ),
                  Text(
                    "GhC 120",
                    style: TextStyle(
                      color: AppColors.primaryBlackColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 1,
                color: AppColors.primaryBlackColor.withOpacity(.30),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Payment Method",
                  style: TextStyle(
                    color: AppColors.primaryBlackColor.withOpacity(.50),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Credit Card",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Button(
                text: "Ok",
                color: AppColors.primaryRedColor,
                width: 150,
                radius: 10,
                style: TextStyle(color: AppColors.primaryWhiteColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
