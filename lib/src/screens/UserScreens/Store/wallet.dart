import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:flutter/material.dart';

class walletSet extends StatelessWidget {
  const walletSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingAmbulance(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          "wallet",
          style: TextStyle(color: Colors.black),
        ),
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
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("assets/images/image1.png"),
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                children: [Text("Ecentials"), Text("Ambulance")],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("assets/images/image1.png"),
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                children: [Text("John Doe"), Text("Shop")],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage("assets/images/image2.png"),
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                children: [Text("Lydia Darkwa"), Text("Shop")],
              )
            ],
          ),
        ],
      ),
    );
  }
}
