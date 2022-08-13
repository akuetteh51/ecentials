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


// class RPSCustomPainter extends CustomPainter{
  
//   final Color? shapeColor;

//   RPSCustomPainter({this.shapeColor});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint0 = Paint()
//       ..color = shapeColor ?? const Color(0xFF033A64)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;
     
         
//     Path path0 = Path();
//     path0.moveTo(size.width*0.0015000,size.height*0.9930000);
//     path0.lineTo(size.width*0.9975000,size.height*0.9960000);
//     path0.lineTo(size.width*0.9975000,size.height*0.0900000);
//     path0.quadraticBezierTo(size.width*0.9929375,size.height*0.0235000,size.width*0.9727500,size.height*0.0280000);
//     path0.cubicTo(size.width*0.8779375,size.height*0.0240000,size.width*0.5958125,size.height*-0.0250000,size.width*0.5955000,size.height*0.0320000);
//     path0.cubicTo(size.width*0.5786250,size.height*0.0502500,size.width*0.5748750,size.height*0.3827500,size.width*0.5020000,size.height*0.3890000);
//     path0.cubicTo(size.width*0.4261875,size.height*0.3930000,size.width*0.4215625,size.height*0.0370000,size.width*0.4067500,size.height*0.0250000);
//     path0.cubicTo(size.width*0.4074375,size.height*-0.0177500,size.width*0.1228125,size.height*0.0287500,size.width*0.0275000,size.height*0.0300000);
//     path0.quadraticBezierTo(size.width*0.0042500,size.height*0.0207500,size.width*0.0025000,size.height*0.1050000);
//     path0.lineTo(size.width*0.0015000,size.height*0.9930000);
//     path0.close();

//     canvas.drawPath(path0, paint0);
  
    
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
  
// }

