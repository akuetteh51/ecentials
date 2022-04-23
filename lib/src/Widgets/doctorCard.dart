import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class doctorCard extends StatelessWidget {
  final String fname;
  final String lname;
  final String role;
  final String hospital;

  const doctorCard(
      {Key? key,
      required this.fname,
      required this.lname,
      required this.role,
      required this.hospital})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 160.0,
        width: 301.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: const Color(0xFF033A64),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Dr. $fname $lname",
                  style: TextStyle(
                      color: AppColors.primaryWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 23.0),
                ),
                Text(
                  "$role",
                  style: TextStyle(
                      color: AppColors.primaryWhiteColor, fontSize: 14.0),
                ),
                Text(
                  "$hospital",
                  style: TextStyle(
                      color: AppColors.primaryWhiteColor, fontSize: 14.0),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side:
                                BorderSide(color: AppColors.primaryGreenColor),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        print("chat");
                      },
                      icon: Icon(Icons.message_rounded),
                      label: Text("Chat"),
                    ),
                    ElevatedButton.icon(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(
                                  color: AppColors.primaryGreenColor),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ),
                        ),
                        onPressed: () {
                          print("chat");
                        },
                        icon: Icon(Icons.call),
                        label: Text("Call")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
