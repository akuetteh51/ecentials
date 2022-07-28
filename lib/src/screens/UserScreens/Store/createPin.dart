import 'package:ecentialsclone/src/Widgets/genkey.dart';
import 'package:ecentialsclone/src/Widgets/widget_pin.dart';
import 'package:ecentialsclone/src/app_state/AuthState.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/renterPin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Themes/ecentials_icons_icons.dart';

String createdpin = '';

class pinGen extends StatefulWidget {
  const pinGen({Key? key}) : super(key: key);

  @override
  State<pinGen> createState() => _pinGenState();
}

class _pinGenState extends State<pinGen> {
  void check() async {
    AuthState authState = Provider.of<AuthState>(context, listen: false);

    bool? res = await authState.getLoginState();

    if (res == true) {
      if (pins.length == 4) {
        createdpin = pins.join();
        print(createdpin);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RenterPin()),
        );
      }
    }
  }

  final List<String> pins = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Icon(EcentialsIcons.lock),
          SizedBox(
            height: 20,
          ),
          Text(
            "Enter your 4-digit Pincode",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedPin(
                  isFilled: pins.length >= 1,
                ),
                RoundedPin(isFilled: pins.length >= 2),
                RoundedPin(isFilled: pins.length >= 3),
                RoundedPin(isFilled: pins.length >= 4)
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Forgot PIN?",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: KeyGen(
              onTap: (value) {
                print(value);
                if (pins.length < 4 && value != null) {
                  pins.add(value);
                } else if (pins.length > 0 && value == null) {
                  pins.removeLast();
                }
                print(pins);
                setState(() {});
                check();
              },
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
