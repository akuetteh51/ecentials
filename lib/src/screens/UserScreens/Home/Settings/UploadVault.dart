// ignore_for_file: unused_import, unnecessary_import, prefer_const_constructors, duplicate_ignore

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ecentialsclone/src/Widgets/favoriteDrug.dart';

class UploadVault extends StatefulWidget {
  const UploadVault({
    Key? key,
  }) : super(key: key);

  @override
  State<UploadVault> createState() => _UploadVaultState();
}

class _UploadVaultState extends State<UploadVault> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).disabledColor.withOpacity(.75),
            )
            ),

             title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            
            margin: EdgeInsets.only(bottom: 12, right: 10),
            child: Image.asset(
              "assets/images/logo.png",
              scale: 2,
            ),
          ),
          const Text(
            "Vault",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
           Container(
            margin: EdgeInsets.only(left:50, ),
            child:
           Image.asset(
               "assets/images/Vector7.png",
              
            ),
           ),
        ],
      ),
      ),

       body: SingleChildScrollView(
        child: Column(

          children:
          [

               Container(
            margin: EdgeInsets.only(left:143, top:185.19,right:143,),
            child:
           Image.asset(
               "assets/images/Vector8.png",
              
            ),
           ),


            Row(
           children: [
             Container(
                      height: 30,
                      width:84,
                     
               margin:      EdgeInsets.only( left: 39.73, top: 64),
            child: Neumorphic(padding: const EdgeInsets.only( left: 10),

               style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: -8,
                lightSource: LightSource.top,
                color: Colors.white.withOpacity(.10),
              ),
              child: Container(
                width: 63,
                height: 16,
                 margin:      EdgeInsets.only(
                left: 5.63, top: 9.23,
                
              ),
                // ignore: prefer_const_constructors
                child: Text(
                  "Choose File",
                   style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat",
                      fontStyle: FontStyle.italic,
                      
                  ),
                ),
              ),
                      ),
                    ),


                    Container(
                         margin:      EdgeInsets.only( left: 3, top: 72),

                      child: Text(
                  "From Device,Cloud",
                   style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                         fontFamily: "Montserrat",
                         fontStyle: FontStyle.italic,
                         color:  Color.fromARGB(255, 134, 128, 128),


                  ),
                ),
                    ),


                   /*  Container(
                height: 30,
                width: 84,
                margin: const EdgeInsets.only(top: 64, left:5, ),
                decoration: BoxDecoration(
                color: const   Color(0xFF0097f7),
                borderRadius:  BorderRadius.circular(6),
               ),*/
                Container(
                   margin: const EdgeInsets.only(top: 64, left:5, ),
                  child: Button(
                    width:84,
              height: 30,
                    text: 
               "import",
               color: const   Color(0xFF0097f7),
               style: TextStyle(color:AppColors.primaryWhiteColor,
               ),
               ),
                )
               
              


           ]

            )
          ]
        ),
        
       ),
    );
  }
}
