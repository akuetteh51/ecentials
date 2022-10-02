import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HospitalResultsCard extends StatelessWidget {
  final String image;
  final String? labName;
  final String? openingHours;


  final onPressed;
  final bool isBookMarked;
  const HospitalResultsCard(
      {Key? key,
      required this.image,
      required this.labName,
      required this.openingHours,
     
      this.onPressed,
      this.isBookMarked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        width: width - 40,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              child: IconButton(
                icon: isBookMarked == false
                    ? Icon(
                        Icons.bookmark_outline,
                        color: AppColors.primaryWhiteColor,
                      )
                    : Icon(
                        Icons.bookmark,
                        color: AppColors.primaryWhiteColor,
                      ),
                onPressed: onPressed,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 70,
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
                      "${labName}",
                      style: TextStyle(
                        color: AppColors.primaryWhiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${openingHours}",
                      style: TextStyle(
                        color: AppColors.primaryWhiteColor,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    
                       
                      ],
                    )
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
