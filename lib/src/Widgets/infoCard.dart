import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final bool showlock;
  final double? width;
  final double? height;
  final Color shadowColor;
  final String topText;
  final String bottomText;
  const InfoCard({
    Key? key,
    this.showlock = false,
    this.width = 200,
    this.height = 120,
    this.shadowColor = const Color(0xFFFFFFFF),
    required this.topText,
    required this.bottomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
          elevation: 10,
          shadowColor: shadowColor,
          child: Stack(
            children: <Widget>[
              showlock == true
                  ? Positioned(
                      child: Icon(
                        EcentialsIcons.lock,
                        color: AppColors.primaryDeepColor,
                      ),
                      right: 10,
                      top: 10,
                    )
                  : Container(),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    topText,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bottomText,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ))
            ],
          )),
    );
  }
}
