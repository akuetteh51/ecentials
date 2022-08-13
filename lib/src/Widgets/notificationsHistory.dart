import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class NotificationsHistory extends StatelessWidget {
  const NotificationsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //color: AppColors.primaryRedColor,
            width: 50,
            child: Stack(
              children: [
                const SizedBox(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/profile.png",
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryRedColor,
                    radius: 10,
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: AppColors.primaryWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SCAN RESULT IS READY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Hello Andrews please note that your scan results is reaady...",
                ),
              ],
            ),
          ),
          Text(
            "1m ago",
            style: TextStyle(
              color: AppColors.primaryBlackColor.withOpacity(.50),
            ),
          ),
        ],
      ),
    );
  }
}
