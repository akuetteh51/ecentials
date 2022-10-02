import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class PickupLocationCard extends StatelessWidget {
  final String title;
  final String location;
  final String address;
  final String country;
  const PickupLocationCard(
      {Key? key,
      required this.title,
      required this.location,
      required this.address,
      required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96.0,
      width: double.infinity,
      child: Card(
        elevation: 10,
        child: Column(children: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 25.0, 150.0, 0.0),
            child: Text(
              title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 30.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.primaryBlueColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text("$location,$address,$country"),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
