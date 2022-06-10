import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Themes/colors.dart';

class search_bar extends StatelessWidget {
  final double width;
  final String text;
  final micPressed;
  final downPressed;
  final TextEditingController? controller;

  const search_bar(
      {Key? key,
      this.width = 300,
      this.text = "Ridge Avenue,Accra",
      this.controller,
      this.micPressed,
      this.downPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Neumorphic(
        padding: const EdgeInsets.only(
          left: 5,
        ),
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          depth: -5,
          lightSource: LightSource.top,
          color: Colors.grey.withOpacity(.10),
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(fontSize: 20),
          cursorColor: AppColors.primaryDeepColor,
          decoration: InputDecoration(
            icon: IconButton(
              icon: Icon(
                EcentialsIcons.mic,
                color: AppColors.primaryBlackColor,
              ),
              onPressed: micPressed,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.arrow_drop_down,
                color: AppColors.primaryBlackColor,
              ),
              onPressed: downPressed,
            ),
            hintText: text,
            iconColor: AppColors.primaryDeepColor,
            focusColor: AppColors.primaryDeepColor,
            border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
