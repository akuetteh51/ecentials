import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:flutter/material.dart';

class Ecentialswallet extends StatelessWidget {
  const Ecentialswallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: const FloatingAmbulance(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NavDrawer()));
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
            Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: AppColors.primaryDeepColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: EdgeInsets.all(35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\Balance",
                            style: TextStyle(
                                color: AppColors.primaryWhiteColor,
                                fontSize: 15),
                          ),
                          Text(
                            "\$ 500.234",
                            style: TextStyle(
                                color: AppColors.primaryWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\Card",
                            style: TextStyle(
                                color: AppColors.primaryWhiteColor,
                                fontSize: 15),
                          ),
                          Text(
                            "Mabank",
                            style: TextStyle(
                                color: AppColors.primaryWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  shadowColor: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset("assets/images/convert.png"),
                      Text("Transfer")
                    ],
                  ),
                ),
                Card(
                  shadowColor: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset("assets/images/withdraw.png"),
                      Text("Withdraw")
                    ],
                  ),
                ),
                Card(
                  shadowColor: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset("assets/images/peer_to_peer.png"),
                      const Text("Peer to peer")
                    ],
                  ),
                ),
                Card(
                  shadowColor: Colors.transparent,
                  child: Column(
                    children: [
                      Image.asset("assets/images/Topup.png"),
                      const Text("Top up")
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
            Container(
              margin: EdgeInsets.all(17),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                AssetImage("assets/images/image1.png"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ecentials",
                                style: TextStyle(
                                    color: AppColors.primaryDeepColor,
                                    fontSize: 20),
                              ),
                              Text("Ambulance")
                            ],
                          ),
                        ],
                      ),
                      Text("\$77")
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                AssetImage("assets/images/image1.png"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "John Doe",
                                style: TextStyle(
                                    color: AppColors.primaryDeepColor,
                                    fontSize: 20),
                              ),
                              Text("Shop")
                            ],
                          ),
                        ],
                      ),
                      Text("\$77")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
