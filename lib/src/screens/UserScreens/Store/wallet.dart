import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class walletSet extends StatelessWidget {
  const walletSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: FloatingAmbulance(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavDrawer()));
              },
              icon: const Icon(EcentialsIcons.menu_icon),
            ),
          ),
          title: Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12, right: 10),
                child: Image.asset(
                  "assets/images/logo.png",
                  scale: 2,
                ),
              ),
              const Text(
                "Wallet",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              )
            ],
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profilePic.png"),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset("assets/images/convert.png"),
                      Text("Transfer")
                    ],
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset("assets/images/withdraw.png"),
                      Text("Withdraw")
                    ],
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset("assets/images/peer_to_peer.png"),
                      Text("Peer to peer")
                    ],
                  ),
                ),
                Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset("assets/images/Topup.png"),
                      Text("Top up")
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Last Transaction"),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text("View All"),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/image1.png"),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [Text("Ecentials"), Text("Ambulance")],
                ),
                SizedBox(
                  width: 160,
                ),
                Text(r"$12")
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/image1.png"),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [Text("John Doe"), Text("Shop")],
                ),
                SizedBox(
                  width: 170,
                ),
                Text(r"$10")
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage("assets/images/image2.png"),
                ),
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: [Text("Lydia Darkwa"), Text("Shop")],
                ),
                SizedBox(
                  width: 160,
                ),
                Text(r"$2")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
