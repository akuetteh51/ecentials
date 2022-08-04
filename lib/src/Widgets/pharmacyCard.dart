import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class PharmacyCard extends StatelessWidget {
  final String pharmacyName;
  final String location;
  final String address;
  final String country;
  final String logo;
  const PharmacyCard({
    Key? key,
    required this.pharmacyName,
    required this.location,
    required this.address,
    required this.country,
    this.logo = "",
  }) : super(key: key);

  String shortenLongString(String str) {
    if (str.length <= 23) {
      return str;
    } else {
      return str.substring(0, 19) + "...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: 174.0,
      child: Card(
        elevation: 6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4.0, 0.0, 8.0, 9.0),
              child: Center(
                child:
                    // logo.isNotEmpty?
                    //  Image.network(
                    //  logo,
                    //   height: 50.0,
                    //   width: 50.0,
                    // ):
                    Image.asset(
                  "assets/images/cross_pharm.png",
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
            Center(
              child: Text(
                shortenLongString(pharmacyName),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
            ),
            Center(
              child: Text(
                " -${shortenLongString(location)}",
                style: const TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 13.0),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: Text(
               shortenLongString(address),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
