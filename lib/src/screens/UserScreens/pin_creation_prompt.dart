import 'package:flutter/material.dart';

import '../../Widgets/button.dart';

class pinCreationPrompt extends StatelessWidget {
  const pinCreationPrompt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Image.asset("assets/images/pinCreationp.png")),
        Text(
          "Create your pin!",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 8),
          child: Text(
            "To provide extra security to your data, please create a 4-digit pin",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 80, bottom: 20),
          child: Button(
              text: "Next",
              width: 300,
              style: TextStyle(color: Colors.white, fontSize: 16),
              radius: 5,
              onTap: () {}),
        ),
      ],
    ));
  }
}
