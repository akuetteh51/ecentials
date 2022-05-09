import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';
import 'package:flutter/material.dart';

class Mystore3 extends StatelessWidget {
  const Mystore3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              EcentialsIcons.menu_icon,
              color: Colors.black,
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
            ),
            Text(
              "My Store",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 100,
            ),
            CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage("assets/images/profilePic.png"),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SafeArea(
  
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 237,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Center(
                        child: Image.asset("assets/images/Pharmacystore.png")),
                    Text(
                      "Pandora Drug Store",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/images/img_5.png",
                height: 200,
                width: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "You don’t have a product",
                  style: TextStyle(fontSize: 14),
                ),
              ),SizedBox(height: 50,),

              ButtonOutlined(
                text: "Add Product",
                style: TextStyle(color: Colors.black,fontSize: 18),
                color:Color(0xFF0F69B2E),
                width: 302,
                height: 40,
                radius: 20,



              ),
            ],
          ),

      ),
    );
  }
}
