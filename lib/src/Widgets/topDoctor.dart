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
               
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(

                        children: [
                          Flexible(
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

                          SizedBox(
                            width: 25,
                          ),
                          SizedBox(
                            child: Wrap(
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: AppColors.primaryOrangeColor,
                                ),
                                Text(
                                  "4.9",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "3 days ago",
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Area of specialization: ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryBlackColor),
                                children: [
                                  TextSpan(
                                    text: specialization,
                                    style: TextStyle(fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,

                      ),
                      RichText(
                        text: TextSpan(
                          text: "Experience: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBlackColor,
                              fontSize: 12),
                          children: [
                            TextSpan(
                              text: "$experience years",

                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
