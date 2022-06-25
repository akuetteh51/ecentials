import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: 325,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/profile.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: AppColors.primaryWhiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Andrews",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryWhiteColor),
                ),
                Text(
                  "aopoku255@gmail.com",
                  style: TextStyle(
                      fontSize: 20, color: AppColors.primaryWhiteColor),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: FloatingActionButton(
              tooltip: "Edit Profile",
              backgroundColor: AppColors.primaryOrangeColor,
              child: Icon(
                EcentialsIcons.pencil,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
