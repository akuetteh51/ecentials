import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/PinCreated.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/createPin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../../Widgets/EcentialsToast.dart';
import '../../../Widgets/genkey.dart';
import '../../../Widgets/widget_pin.dart';
import '../../../app_state/Health_Info_state.dart';
import '../Home/Profiles/HealthInformation.dart';

// String Re_enteredpin = '';

class RenterPin extends StatefulWidget {
  final String? previousPin;
  const RenterPin({Key? key, required this.previousPin}) : super(key: key);

  @override
  _RenterPinState createState() => _RenterPinState();
}

class _RenterPinState extends State<RenterPin> {
  void checkMatchAndupdate() {
    HealthInformationState healthInformationState =
        Provider.of<HealthInformationState>(context, listen: false);
    UserState userState = Provider.of<UserState>(context, listen: false);
    String? pin1 = widget.previousPin ?? "";
    String? pin2 = pins.join();
    if (pin1 == pin2) {
      // Handle update
      healthInformationState.resetHealthPin(        
          token: userState.userInfo?['token'],
          dataToSend: {
            "pin": pin1,
          },
          callback: () {
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (builder) => const HealthInformation()));
          });
    } else {
      ShowToast.ecentialsToast(
        message: "Doesn't match, try again with the pin",
      );
    }
  }

  final List<String> pins = [];
  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context);
    ToastContext().init(context);
    // Nk nk = Provider.of<Nk>(context);
    // nk.createPin(
    //     token: userState.userInfo?['token'],
    //     dataToSend: {"data": Re_enteredpin});

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
            "Re-enter your 4-digit Pincode",
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
                if (pins.length < 4 && value != null) {
                  pins.add(value);
                  
                setState(() {});
                checkMatchAndupdate();
                
                } else if (pins.length > 0 && value == null) {
                  pins.removeLast();
                }
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
