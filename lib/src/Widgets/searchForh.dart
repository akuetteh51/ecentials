import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../Themes/colors.dart';

class Search4 extends StatelessWidget {
  final double width;
  final String text;
  final searchPressed;
  final micPressed;
  final TextEditingController? controller;

  const Search4(
      {Key? key,
      this.width = 280,
      this.text = "Search...",
      this.controller,
      this.searchPressed,
      this.micPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Neumorphic(
        padding: const EdgeInsets.only(
          left: 10,
          right: 5,
        ),
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
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
                EcentialsIcons.search,
                color: AppColors.primaryBlackColor,
              ),
              onPressed: searchPressed,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                EcentialsIcons.mic,
                color: AppColors.primaryBlackColor,
              ),
              onPressed: micPressed,
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
