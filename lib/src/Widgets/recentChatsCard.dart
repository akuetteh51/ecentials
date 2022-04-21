import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class RecentChatsCard extends StatelessWidget {
  final bool isOnline;
  final String image;
  final String docName;
  final String message;
  final String time;
  const RecentChatsCard(
      {Key? key,
      this.isOnline = false,
      required this.image,
      required this.docName,
      required this.message,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    double height = 90;
    return SizedBox(
      width: width - 40,
      height: height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 15,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(image),
                    ),
                  ),
                  isOnline == true
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColors.primaryWhiteColor,
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                            ),
                            child: Icon(
                              Icons.circle,
                              size: 20,
                              color: AppColors.primaryGreenColor,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    docName,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    message,
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Text(time)
            ],
          ),
        ),
      ),
    );
  }
}
