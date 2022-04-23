import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class LabResultsCrad extends StatelessWidget {
  final String image;
  final String labName;
  final String openingHours;
  final String? service1;
  final String? service2;
  final String? service3;
  final String? service4;
  final String? price;
  const LabResultsCrad(
      {Key? key,
      required this.image,
      required this.labName,
      required this.openingHours,
      this.service1,
      this.service2,
      this.service3,
      this.service4,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 200,
      width: width - 40,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            child: IconButton(
              icon: Icon(
                EcentialsIcons.pinned_filled,
                color: AppColors.primaryWhiteColor,
              ),
              onPressed: () {},
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              width: width - 50,
              decoration: BoxDecoration(
                color: AppColors.primaryBlackColor.withOpacity(.50),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ziky Clinical Laboratory",
                    style: TextStyle(
                      color: AppColors.primaryWhiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Weekdays | 7:00am - 5:00pm",
                    style: TextStyle(
                      color: AppColors.primaryWhiteColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            EcentialsIcons.lab_people,
                            color: AppColors.primaryWhiteColor,
                          ),
                          RichText(
                            text: TextSpan(
                              text: service1,
                              children: [
                                TextSpan(text: service2),
                                TextSpan(text: service3),
                                TextSpan(text: service4),
                              ],
                            ),
                          )
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: price,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          children: [
                            TextSpan(
                                text: " / hr",
                                style: TextStyle(
                                    color: AppColors.primaryWhiteColor
                                        .withOpacity(0.5))),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
