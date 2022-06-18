import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/CreateStore.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/PinEntered.dart';
import 'package:flutter/material.dart';

class pinCreated extends StatelessWidget {
  const pinCreated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
            ),
            Image.asset(
              "assets/images/created.png",
              height: 128,
              width: 128,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Created Successfully!",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 156,
            ),
            Center(
              child: Button(
                  text: "Go to Store",
                  width: 302,
                  radius: 20,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateStore()));
                  }),
            ),
          ]),
    );
  }
}
