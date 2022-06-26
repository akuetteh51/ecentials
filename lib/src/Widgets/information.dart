import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final String heading;
  final String text;
  const Information({Key? key, this.heading = "", this.text = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width - 40,
      height: 100,
      child: Card(
        elevation: 10.0,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                heading,
                style: TextStyle(
                  color: AppColors.primaryDeepColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.primaryBlackColor.withOpacity(.50),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
