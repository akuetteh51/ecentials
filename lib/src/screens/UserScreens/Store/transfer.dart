import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class topedup extends StatelessWidget {
  const topedup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 120,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(56, 33, 56, 34),
            child: Button(
              text: " Ok ",
              width: 100,
              radius: 20,
              style: TextStyle(color: Colors.white, fontSize: 15),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => (),
                //   ),
                // );
              },
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/done_circle.png",
              height: 128,
              width: 128,
            ),
            SizedBox(
              height: 15,
            ),
            Text("Top up Successful!"),
            Text("13 Mar 2022, 05:25 PM"),
            Text("Transaction ID: dae6au-4ksne9e-9wsfjujw"),
          ],
        ),
      ),
    );
  }
}
