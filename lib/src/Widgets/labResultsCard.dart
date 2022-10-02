import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class LabResultsCard extends StatelessWidget {
  final String? image;
  final String? labName;
  final String? openingHours;

  final String? service1;
  final String? service2;
  final String? service3;
  final String? service4;
  final String? price;
  final onPressed;
  final bool isBookMarked;
  const LabResultsCard(
      {Key? key,
      required this.image,
      required this.labName,
      required this.openingHours,
      this.service1,
      this.service2,
      this.service3,
      this.service4,
      this.price,
      this.onPressed,
      this.isBookMarked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          offset: const Offset(3, 2),
          color: AppColors.primaryGrayColor.withAlpha(200),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ]),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 200,
            width: width - 40,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image!), fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  child: IconButton(
                    icon: isBookMarked == false
                        ? Icon(
                            Icons.bookmark_outline,
                            color: AppColors.primaryOrangeColor,
                          )
                        : Icon(
                            Icons.bookmark,
                            color: AppColors.primaryOrangeColor,
                          ),
                    onPressed: () {
                      print("Hello world");
                    },
                    iconSize: 28,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          labName ?? "Ziky Clinical Laboratory",
                          style: TextStyle(
                              color: AppColors.primaryBlackColor.withAlpha(190),
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Text(
                          openingHours ?? "Weekdays | 7:00am - 5:00pm",
                          style: TextStyle(
                            color: AppColors.primaryBlackColor.withAlpha(190),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
