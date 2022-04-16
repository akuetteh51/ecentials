import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class cartCard extends StatefulWidget {
  const cartCard({Key? key}) : super(key: key);

  @override
  State<cartCard> createState() => _cartCardState();
}

class _cartCardState extends State<cartCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 191.0,
      child: Card(
        elevation: 10,
        child: Row(
          children: [
            Image.asset(
              "assets/images/drug.png",
              height: 90.0,
              width: 90.0,
            ),
            SizedBox(
              height: 135.0,
              child: Column(
                children: [
                  Text(
                    "Top up Pharmacy -Spintex",
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "Ibuprofen",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Quantity",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '-',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: Text("1"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '+',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "GHC 24.50",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color.fromARGB(227, 12, 108, 218)),
                        ),
                        IconButton(
                            onPressed: () {
                              print("hello");
                            },
                            icon: Icon(EcentialsIcons.delete))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
