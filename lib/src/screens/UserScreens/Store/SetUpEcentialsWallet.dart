import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class SetupWallet extends StatelessWidget {
  const SetupWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 217,
          ),
          Center(
            child: Image.asset("assets/images/wallet.png"),
          ),
          Row(
            children: <Widget>[SizedBox(height: 45,width: 45,),Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text("Set up your "),   
            ),Image.asset("assets/images/logo.png",height: 24,width: 89,),  Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text("Wallet"),
            )],
          ),
          SizedBox(height: 45,),IconButton(onPressed: (){print("Helllo world");}, icon: Icon(EcentialsIcons.circle_arrow_right))
        ],
      ),
    );
  }
}
