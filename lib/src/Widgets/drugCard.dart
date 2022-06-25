// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class drugCard extends StatelessWidget {
  final String drugName;
  final String drugType;
  final int quantity;
  final double price;

  const drugCard(
      {Key? key,
      required this.drugName,
      required this.drugType,
      required this.quantity,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 174.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Image.asset(
                  "assets/images/drug.png",
                  height: 66.0,
                  width: 66.0,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 4, 20, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$drugName",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$drugType * $quantity pieces",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "\$ $price",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryDeepColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
