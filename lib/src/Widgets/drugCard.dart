import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class drug extends StatelessWidget {
  final String drugName;
  final String drugType;
  final int quantity;
  final double price;

  const drug(
      {Key? key,
      required this.drugName,
      required this.drugType,
      required this.quantity,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 191.0,
      width: 174.0,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 10,
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
                  child: Text(
                    "$drugName",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "$drugType * $quantity pieces",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "\$ $price",
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryDeepColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
