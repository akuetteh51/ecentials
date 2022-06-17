import 'package:flutter/material.dart';


// class RPSCustomPainter extends CustomPainter{
  
//   @override
//   void paint(Canvas canvas, Size size) {
    
    

//   Paint paint0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;
     
         
//     Path path0 = Path();
//     path0.moveTo(size.width*0.0013333,size.height*2.0000000);
//     path0.quadraticBezierTo(size.width*0.0056667,size.height*0.9610000,size.width*0.0066667,size.height*0.5880000);
//     path0.quadraticBezierTo(size.width*0.0115000,size.height*0.2195000,size.width*0.0833333,size.height*0.0900000);
//     path0.quadraticBezierTo(size.width*0.2494167,size.height*0.0895000,size.width*0.3323333,size.height*0.0920000);
//     path0.cubicTo(size.width*0.4246667,size.height*0.0025000,size.width*0.3853333,size.height*0.6015000,size.width*0.5016667,size.height*0.6460000);
//     path0.cubicTo(size.width*0.5977500,size.height*0.5815000,size.width*0.5802500,size.height*0.0185000,size.width*0.6700000,size.height*0.0920000);
//     path0.quadraticBezierTo(size.width*0.7626667,size.height*0.0865000,size.width*0.9166667,size.height*0.1100000);
//     path0.quadraticBezierTo(size.width*0.9973333,size.height*0.2175000,size.width*0.9953333,size.height*0.6480000);
//     path0.quadraticBezierTo(size.width*0.9968333,size.height*1.0260000,size.width,size.height*2.0000000);
//     path0.lineTo(size.width*0.0013333,size.height*2.0000000);
//     path0.close();

//     canvas.drawPath(path0, paint0);
  
    
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
  
// }

class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = const Color(0xFF033A64)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.0013333,size.height*1.4285714);
    path0.quadraticBezierTo(size.width*0.0056667,size.height*0.6864286,size.width*0.0066667,size.height*0.4200000);
    path0.quadraticBezierTo(size.width*0.0115000,size.height*0.1567857,size.width*0.0833333,size.height*0.0642857);
    path0.quadraticBezierTo(size.width*0.2587500,size.height*0.0639286,size.width*0.3416667,size.height*0.0657143);
    path0.cubicTo(size.width*0.4340000,size.height*0.0017857,size.width*0.3853333,size.height*0.4296429,size.width*0.5016667,size.height*0.4614286);
    path0.cubicTo(size.width*0.5977500,size.height*0.4153571,size.width*0.5682500,size.height*0.0075000,size.width*0.6580000,size.height*0.0600000);
    path0.quadraticBezierTo(size.width*0.7506667,size.height*0.0560714,size.width*0.9166667,size.height*0.0785714);
    path0.quadraticBezierTo(size.width*0.9973333,size.height*0.1553571,size.width*0.9953333,size.height*0.4628571);
    path0.quadraticBezierTo(size.width*0.9968333,size.height*0.7328571,size.width,size.height*1.4285714);
    path0.lineTo(size.width*0.0013333,size.height*1.4285714);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
