// ignore: file_names
import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final Color? shapeColor;
  RPSCustomPainter({this.shapeColor});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();

    path_0.moveTo(size.width * 0.4973487, size.height * 0.5448259);
    path_0.cubicTo(
        size.width * 0.5342155,
        size.height * 0.5448259,
        size.width * 0.5667070,
        size.height * 0.4493556,
        size.width * 0.5858329,
        size.height * 0.3042593);
    path_0.cubicTo(
        size.width * 0.6052276,
        size.height * 0.1571296,
        size.width * 0.6320726,
        size.height * 0.001615543,
        size.width * 0.6668402,
        size.height * 0.001615543);
    path_0.lineTo(size.width * 0.9791889, size.height * 0.001615543);
    path_0.cubicTo(
        size.width * 0.9898886,
        size.height * 0.001615543,
        size.width * 0.9985593,
        size.height * 0.04583432,
        size.width * 0.9985593,
        size.height * 0.1003810);
    path_0.lineTo(size.width * 0.9985593, size.height * 0.8905049);
    path_0.cubicTo(
        size.width * 0.9985593,
        size.height * 0.9450506,
        size.width * 0.9898886,
        size.height * 0.9892704,
        size.width * 0.9791889,
        size.height * 0.9892704);
    path_0.lineTo(size.width * 0.01550910, size.height * 0.9892704);
    path_0.cubicTo(
        size.width * 0.004811114,
        size.height * 0.9892704,
        size.width * -0.003861332,
        size.height * 0.9450506,
        size.width * -0.003861332,
        size.height * 0.8905049);
    path_0.lineTo(size.width * -0.003861332, size.height * 0.1003810);
    path_0.cubicTo(
        size.width * -0.003861332,
        size.height * 0.04583432,
        size.width * 0.004811138,
        size.height * 0.001615543,
        size.width * 0.01550913,
        size.height * 0.001615543);
    path_0.lineTo(size.width * 0.3278571, size.height * 0.001615543);
    path_0.cubicTo(
        size.width * 0.3626271,
        size.height * 0.001615543,
        size.width * 0.3894697,
        size.height * 0.1571296,
        size.width * 0.4088644,
        size.height * 0.3042593);
    path_0.cubicTo(
        size.width * 0.4279927,
        size.height * 0.4493556,
        size.width * 0.4604843,
        size.height * 0.5448259,
        size.width * 0.4973487,
        size.height * 0.5448259);
    path_0.close();

    Paint paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = shapeColor ?? const Color(0xFF033A64);

    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
