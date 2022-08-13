import 'package:flutter/material.dart';

class Button extends StatelessWidget {
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
  final padding;
  final onTap;
  const Button({
    Key? key,
    this.width,
    this.height = 50,
    this.color = const Color(0xFF033A64),
    required this.text,
    this.style,
    this.radius = 5,
    this.onTap,
    this.hasIcon,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: hasIcon == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
