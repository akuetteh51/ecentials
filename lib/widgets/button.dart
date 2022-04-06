import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double? width;
  final double height;
  final Color color;
  final String text;
  final TextStyle? style;
  final double radius;
  const Button(
      {Key? key,
      this.width,
      this.height = 50,
      this.color = const Color(0xFF033A64),
      required this.text,
      this.style,
      this.radius = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
