import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class pickup extends StatelessWidget {
  final String location;
  final String address;
  final String country;
  const pickup(
      {Key? key,
      required this.location,
      required this.address,
      required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 96.0,
        width: 330.0,
        child: Card(
          elevation: 10,
          child: Column(children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 25.0, 150.0, 0.0),
              child: Text(
                "Pick-up Location",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 30.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.primaryBlueColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 120.0),
                    child: Text("$location,$address,$country"),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
