import 'package:flutter/material.dart';

class RoundedPin extends StatelessWidget {
  final Color errorColor = Color.fromRGBO(255, 234, 238, 1);
  final Color fillColor = Color.fromRGBO(222, 231, 240, .57);
  final Color filledColor = Colors.grey;
  final bool isFilled;

  RoundedPin({Key? key, this.isFilled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: isFilled ? filledColor : fillColor,
        borderRadius: BorderRadius.circular(80),
        border: Border.all(color: Colors.transparent),
      ),
    );
  }
}
