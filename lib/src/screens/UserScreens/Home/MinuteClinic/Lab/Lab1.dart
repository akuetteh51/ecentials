// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';

class Lab1 extends StatefulWidget {
  const Lab1({Key? key}) : super(key: key);

  @override
  State<Lab1> createState() => _Lab1State();
}

class _Lab1State extends State<Lab1> {
  @override
  Widget build(BuildContext context) {
    return BottomNavBar(
        body: SingleChildScrollView(
            child: Column(children: 
            [ 
              Row
            ( 
              /*Icon(
                    Icons.menu_book_outlined,
                     size: 15,
                    color: AppColors.primaryBlackColor,
                          )*/
              
            )
            
            ]
            )
            )
            );
  }
}
