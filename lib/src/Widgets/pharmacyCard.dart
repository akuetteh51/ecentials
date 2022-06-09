import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class PharmacyCard extends StatelessWidget {
  final String pharmacyName;
  final String location;
  final String address;
  final String country;
  const PharmacyCard(
      {Key? key,
      required this.pharmacyName,
      required this.location,
      required this.address,
      required this.country, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 191.0,
      width: 174.0,
      child: Card(
        elevation: 6,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 0, 2.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(
                      EcentialsIcons.heart_fill,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      print("color");
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 8.0, 9.0),
              child: Center(
                child: Image.asset(
                  "assets/images/cross_pharm.png",
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
            Center(
              child: Text(
                "$pharmacyName",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Center(
              child: Text(
                " -$location",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Center(
              child: Text(
                "$address,$country",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
