import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/createPin.dart';
import 'package:flutter/material.dart';

class PinCheck extends StatelessWidget {
  const PinCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingAmbulance(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Icons.close,
                          color: Theme.of(context).disabledColor,
                          // size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 50.0),
                  child: Text(
                    "Create a 4-digit PIN to Secure your Store",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Image.asset("assets/images/store_pin.png"),
                const SizedBox(
                  height: 20,
                ),
                Button(
                    text: "Next",
                    width: 250,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                    radius: 20,
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PinGen()));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
