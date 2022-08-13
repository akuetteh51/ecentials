

// ignore_for_file: unused_import, avoid_unnecessary_containers, unnecessary_import, implementation_imports, prefer_const_constructors, prefer_const_literals_to_create_immutables

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


class Favorite extends StatefulWidget {
  const Favorite({
    Key? key,
  }) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
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
              )),
          title: Container(
              margin: EdgeInsets.only(left: 35.38),
            height: 30.02,
            width: 115.3,
            child: const Text(
              "Favorites",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
              ),
            ),
          ),
       
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            
            Row(
              children: [

                Container(
                  margin: EdgeInsets.only(left: 244, top: 36.23, ),
                  height:24.84 ,
                  width: 38,
                  child: Text(
              "view",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins",
              ),
            ),
                ),

                Container(
                      margin: EdgeInsets.only(left: 32, top: 36.23, ),
                  child: Image.asset(
                    
              "assets/images/Vectorfav.png",
              height: 19.67,
              width: 19,
            ),
                ),

                 Container(
                      margin: EdgeInsets.only(left: 10, top: 36.23, ),
                  child: Image.asset(
                    
              "assets/images/vector4.png",
              height: 19.67,
              width: 19,
            ),
                ),

              ],
            ),

           
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 240,
                  ),
                  itemBuilder: (BuildContext context, int index) => FavoriteDrug(
                    drugName: "Ibuprofen",
                    drugType: "Tablets",
                    quantity: 50,
                    price: 5.00,
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),

         Row(
           children: [
             Container(
                      height: 50,
                      width:150,
                     
               margin:      EdgeInsets.only(
               left: 82,
                top: 41),
                      child: Neumorphic(
              padding: const EdgeInsets.only(
                left: 10,
                right: 20,
              ),

               style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: 15,
                
                lightSource: LightSource.top,
                color: Colors.white.withOpacity(.10),
              ),
              child: Container(
                width: 56,
                height: 24,
                 margin:      EdgeInsets.only(
                left: 34,
                
                top: 9.23,
                
              ),
                child: Text(
                  "Previous",
                   style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Poppins",
                  ),
                ),
              ),
                      ),
                    ),

                      Container(
                  height: 50,
                  width:150,
                 
           margin:      EdgeInsets.only(
          // left: 82,
            top: 41),
                  child: Neumorphic(
          padding: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),

           style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            depth: 15,
          shadowDarkColor: Colors.grey,
            
            color: Colors.grey.withOpacity(.10),
          ),
          child: Container(
            width: 56,
            height: 24,
             margin:      EdgeInsets.only(
            left: 34,
            
            top: 9.23,
            
          ),
            child: Text(
              "Next",
               style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins",
              ),
            ),
          ),
                  ),
                ),
           ],
         ),

               
          ],
        ),
        ) ,
    );
  }
}