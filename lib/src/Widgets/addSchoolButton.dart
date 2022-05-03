import 'package:dotted_border/dotted_border.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class AddSchoolButton extends StatelessWidget {
  final onTap;
  const AddSchoolButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: DottedBorder(
          color: AppColors.primaryDeepColor,
          dashPattern: [5],
          borderType: BorderType.RRect,
          radius: const Radius.circular(4),
          strokeWidth: 2,
          child: Center(
            child: Text(
              "Add School",
              style: TextStyle(
                color: AppColors.primaryDeepColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
