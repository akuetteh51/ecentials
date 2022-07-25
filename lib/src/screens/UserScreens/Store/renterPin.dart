import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/app_state/HealthPin_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/PinCreated.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/createPin.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../../Widgets/EcentialsToast.dart';
import '../../../Widgets/genkey.dart';
import '../../../Widgets/widget_pin.dart';

class RenterPin extends StatefulWidget {
  const RenterPin({Key? key}) : super(key: key);

  @override
  _RenterPinState createState() => _RenterPinState();
}

class _RenterPinState extends State<RenterPin> {
  void check() {
    if (pins.length == 4) {
      String Re_enteredpin = pins.join();
      if (createdpin == Re_enteredpin) {
        print("$Re_enteredpin ,Confirmed");
        // create_pin();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Createdpin()),
        );
      } else {
        print("$Re_enteredpin ,Wrong Pin");

        ShowToast.ecentialsToast(
          message: "Doesn't match, try again with the pin",
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pinGen()),
        );
      }
    }
  }

  final List<String> pins = [];
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
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
            "Re-enter your 4-digit Pincode",
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
