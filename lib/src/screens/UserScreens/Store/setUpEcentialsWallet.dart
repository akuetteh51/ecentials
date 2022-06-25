import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class SetupWallet extends StatelessWidget {
  const SetupWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      body: Column(
        children: [
          SizedBox(
            height: 217,
          ),
          Center(
            child: Image.asset("assets/images/wallet.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("Set up your "),
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 24,
                width: 89,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text("Wallet"),
              )
            ],
          ),
          SizedBox(
            height: 45,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {
                    print("Helllo world");
                  },
                  icon: Icon(
                    EcentialsIcons.circle_arrow_right,
                    color: AppColors.primaryOrangeColor,
                    size: 40,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
