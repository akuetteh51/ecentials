import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class Stores extends StatelessWidget {
  const Stores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: Center(child: Text("Store")),
    );
  }
}
