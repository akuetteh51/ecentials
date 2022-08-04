import 'package:ecentialsclone/src/Widgets/genkey.dart';
import 'package:ecentialsclone/src/Widgets/widget_pin.dart';
import 'package:ecentialsclone/src/app_state/AuthState.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/renterPin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Themes/ecentials_icons_icons.dart';

String createdpin = '';

class PinGen extends StatefulWidget {
  const PinGen({Key? key}) : super(key: key);

  @override
  State<PinGen> createState() => _PinGenState();
}

class _PinGenState extends State<PinGen> {
  void check() async {
    AuthState authState = Provider.of<AuthState>(context, listen: false);

    bool? res = await authState.getLoginState();

    if (res == true) {
      if (pins.length == 4) {
        createdpin = pins.join();
        // print(createdpin);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RenterPin(previousPin: pins.join(),)),
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
         const SizedBox(
            height: 80,
          ),
         const Icon(EcentialsIcons.lock),
         const SizedBox(
            height: 20,
          ),
         const Text(
            "Enter your 4-digit Pincode",
            style: TextStyle(fontSize: 18),
          ),
         const SizedBox(
            height: 20,
          ),
          SizedBox(
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
         const SizedBox(
            height: 40,
          ),
         const Text(
            "Forgot PIN?",
            style: TextStyle(fontSize: 16),
          ),
         const SizedBox(
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
         const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
