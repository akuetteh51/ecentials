import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class ambulanceList extends StatelessWidget {
  const ambulanceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 120.0,
        width: 414.0,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Text(
              "Mid-level",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            Text(
              "10% discount",
              style: const TextStyle(fontSize: 14.0),
            ),
            Text(
              "\$32",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.orange),
            ),
          ]),
          Text("With Oxygen,extra 5 seats with stretcher"),
        ]),
      ),
    );
  }
}
