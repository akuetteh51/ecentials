// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';

class TopDoctor extends StatelessWidget {
  final String? image;
  final String? docName;
  final String? days;
  final String? specialization;
  final int? experience;
  final ontap;

  const TopDoctor({
    Key? key,
    required this.image,
    required this.docName,
    required this.specialization,
    required this.experience,
    this.days,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 6,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 210,
                            child: Text(
                              "Dr. $docName",
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                size: 18,
                                color: AppColors.primaryOrangeColor,
                              ),
                              Text("4.9")
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        days!,
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        text: TextSpan(
                          text: "specialization: ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlackColor),
                          children: [
                            TextSpan(
                              text: specialization!,
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Experience: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryBlackColor,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: "$experience years +",
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
