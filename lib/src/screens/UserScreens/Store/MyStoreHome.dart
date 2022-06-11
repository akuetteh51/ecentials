import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/storeList.dart';
import 'package:flutter/material.dart';

class storeHome extends StatelessWidget {
  const storeHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavDrawer()));
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
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              storeListing(storeName: "Pandora"),
              storeListing(storeName: "Pandora"),
              storeListing(storeName: "Pandora"),
              storeListing(storeName: "Pandora")
            ],
          ),
        ),
      ),
    );
  }
}
