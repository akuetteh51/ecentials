import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class AddSchoolButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final onTap;
  const AddSchoolButton(
      {Key? key,
      required this.text,
      this.width = 330,
      this.height = 50,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        strokeWidth: 2,
        dashPattern: const [5],
        borderType: BorderType.RRect,
        radius: const Radius.circular(4),
        child: const ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: SizedBox(
            height: 50,
            width: 330,
            child: Center(
              child: Text(
                "Add School",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
