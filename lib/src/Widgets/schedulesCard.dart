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
  const SchedulesCard(
      {Key? key,
      this.isConfirmed = false,
      required this.image,
      required this.docName,
      required this.specialization,
      required this.hospitalName,
      required this.time,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = 170;
    return SizedBox(
      width: width - 40,
      height: height,
      child: Card(
        elevation: 15,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        docName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                EcentialsIcons.clock,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text(
                                time,
                                style: const TextStyle(
                                  color: Colors.black,
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
                              const Icon(
                                EcentialsIcons.calender,
                                size: 15,
                                color: Colors.grey,
                              ),
                              Text(
                                date,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          isConfirmed == false
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
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
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
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
                    ],
                  ),
                  // CircleAvatar(
                  //   backgroundColor: AppColors.primaryWhiteColor,
                  //   backgroundImage: AssetImage(
                  //     image,
                  //   ),
                  // ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                      height: 80.0,
                      width: 50.0,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ButtonOutlined(
                    text: "Cancel",
                    style: TextStyle(color: AppColors.primaryGreenColor),
                    width: 150,
                    height: 40,
                    OnTap: () {
                      print("Cancel");
                    },
                  ),
                  Button(
                    text: "Reschedule",
                    style: TextStyle(color: AppColors.primaryWhiteColor),
                    width: 150,
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
