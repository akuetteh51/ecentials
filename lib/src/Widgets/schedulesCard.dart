// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';
import 'package:flutter/material.dart';

class SchedulesCard extends StatelessWidget {
  final bool isConfirmed;
  final String image;
  final String docName;
  final String specialization;
  final String hospitalName;
  final String time;
  final String date;
  final Color buttonColor;
  const SchedulesCard({
    Key? key,
    this.isConfirmed = false,
    required this.image,
    required this.docName,
    required this.specialization,
    required this.hospitalName,
    required this.time,
    required this.date,
    this.buttonColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width - 40,
      // height: height,
      child: Card(
        elevation: 20,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          docName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        RichText(
                          text: TextSpan(
                            text: specialization,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            children: [
                              const TextSpan(
                                text: " - ",
                              ),
                              TextSpan(
                                text: hospitalName,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right:4.0),
                                  child: const Icon(
                                    EcentialsIcons.clock,
                                    size: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  time,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right:4.0),
                                  child: const Icon(
                                    EcentialsIcons.calender,
                                    size: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  date,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        isConfirmed == false
                            ? Wrap(
                                // mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Icon(
                                    EcentialsIcons.times,
                                    color: AppColors.primaryRedColor,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Unconfirmed",
                                    style: TextStyle(
                                      color: AppColors.primaryRedColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            : Wrap(
                                // mainAxisSize: MainAxisSize.min,
                                children:const [
                                  Icon(
                                    EcentialsIcons.correct,
                                    size: 12,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Confirmed",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover),
                    ),
                  ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: Image.asset(
                  //     image,
                  //     fit: BoxFit.contain,
                  //     height: 80.0,
                  //     width: 50.0,
                  //   ),
                  // )
                  // CircleAvatar(
                  //   backgroundColor: AppColors.primaryWhiteColor,
                  //   backgroundImage: AssetImage(
                  //     image,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonOutlined(
                    text: "Cancel",
                    style: TextStyle(color: AppColors.primaryGreenColor),
                    width: 130,
                    height: 40,
                  ),
                  Button(
                    text: "Reschedule",
                    color: buttonColor,
                    style: TextStyle(color: AppColors.primaryWhiteColor),
                    width: 130,
                    height: 40,
                    onTap: () {
                      print("Reschedule");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
