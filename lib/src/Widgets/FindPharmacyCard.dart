// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter/material.dart';

class FindPharmacyCard extends StatelessWidget {
  final onPressed;
  final String image;
  final String kilo;
  final String pharName;
  final bool isBookMarked;
  const FindPharmacyCard(
      {Key? key,
      this.onPressed,
      required this.image,
      required this.kilo,
      required this.pharName,
      this.isBookMarked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 241.0,
        width: 198.0,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 198,
              height: 131,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
              child: Stack(children: [
                Positioned(
                  right: 10,
                  child: IconButton(
                    icon: isBookMarked == false
                        ? Icon(
                            Icons.bookmark_outline,
                            color: AppColors.primaryWhiteColor,
                          )
                        : Icon(
                            Icons.bookmark,
                            color: Color.fromARGB(255, 223, 193, 0),
                          ),
                    onPressed: onPressed,
                  ),
                ),
              ]),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                height: 20,
                width: 157,
                child: Text(
                  pharName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            //   Center(
            //  child:
            Container(
              margin: const EdgeInsets.only(left: 24 ),
              height: 14,
              width: 61,
              child: Text(
                kilo,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Montserrat"),
              ),
            ),
            Container(
                height: 35,
                width: 120,
                margin: const EdgeInsets.only(top: 18, left: 16, ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 240, 244),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Button(
                  
                  text: "View on map",
                  height: 20,
                  width: 201,
                  style: TextStyle(
                      color: AppColors.primaryWhiteColor,
                      fontSize: 16,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700),
                ),
              ),
            //   ),
          ]),
        ));
  }
}
