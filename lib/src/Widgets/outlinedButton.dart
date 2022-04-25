import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonOutlined extends StatelessWidget {
  final double? width;
  final double height;
  final Color color;
  final String text;
  final TextStyle? style;
  final double radius;
  final bool? hasIcon;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final onTap;

  const ButtonOutlined(
      {Key? key,
      this.width,
      this.height = 50,
      this.color = const Color(0xFF033A64),
      required this.text,
      this.style,
      this.radius = 5,
      this.hasIcon,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: color,
            width: 1.5,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: hasIcon == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: iconColor,
                      size: iconSize,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      text,
                      style: style,
                    )
                  ],
                )
              : Text(
                  text,
                  style: style,
                ),
        ),
      ),
    );
  }
}
