import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TopupSuccessful extends StatelessWidget {
  const TopupSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/done_circle.png",
              height: 128,
              width: 128,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Top up Successful!",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "13 Mar 2022, 05:25 PM",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: const Text(
                "Transaction ID: dae6au-4ksne9e-9wsfjujw",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22.0, left: 20),
                  child: Text(
                    "Payment",
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(width: 200),
                Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Text(
                    "USD 200",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220.0, top: 50),
              child: Text(
                "Payment Method",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 240.0, top: 10),
              child: Text(
                "Credit Card",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 120,
              width: 280,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(56, 33, 56, 34),
                child: Button(
                  text: " Ok ",
                  width: 100,
                  radius: 20,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
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
          ],
        ),
      ),
    );
  }
}
