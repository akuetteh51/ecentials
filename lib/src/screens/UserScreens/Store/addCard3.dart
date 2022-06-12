import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/transfer.dart';
import 'package:flutter/material.dart';

class cardTopup extends StatelessWidget {
  const cardTopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
        ),
        bottomNavigationBar: Container(
          height: 120,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(56, 33, 56, 34),
            child: Button(
              text: "Top up ",
              width: 302,
              radius: 20,
              style: TextStyle(color: Colors.white, fontSize: 15),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => topedup(),
                  ),
                );
              },
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [Text("Amount")],
            )
          ],
        ),
      ),
    );
  }
}
