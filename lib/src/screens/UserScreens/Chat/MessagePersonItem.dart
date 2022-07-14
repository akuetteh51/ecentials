import 'dart:ui';

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class MessagePersonItem extends StatelessWidget {
  const MessagePersonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //color: AppColors.primaryRedColor,
            width: 50,
            child: Stack(
              children: [
                 SizedBox(
                  child: Card(
                     elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:const CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/profile.png",
                      ),
                    ),
                  ),
                ),
               const Positioned(
                  right: 4,
                  top: 4,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 6,                    
                  ),
                )
              ],
            ),
          ),
          Flexible(
            child: SizedBox(
              // width: MediaQuery.of(context).size.width * 0.6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    const Text(
                      "SCAN RESULT IS READY",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "Hello Andrews please note that your scan results is reaady...",
                      style: TextStyle(
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            "1m",
            style: TextStyle(
              color: AppColors.primaryBlackColor.withOpacity(.50),
            ),
          ),
        ],
      ),
    );
  }
}