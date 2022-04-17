import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class cartCard extends StatelessWidget {
  final String pharmacyName;
  final String location;
  final String drugName;
  final double price;

  const cartCard(
      {Key? key,
      required this.pharmacyName,
      required this.location,
      required this.drugName,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int data_val = 0;
    return Center(
      child: Container(
        width: double.infinity,
        height: 100.0,
        color: Colors.white70,
        child: Stack(children: [
          Image.asset(
            "assets/images/drug.png",
            height: 90.0,
            width: 90.0,
          ),
          Positioned(
            top: 0,
            left: 100,
            right: 0,
            child: Text(
              "$pharmacyName -$location",
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: 17.0,
              ),
            ),
          ),
          Positioned(
            top: 19,
            left: 100,
            right: 100,
            child: Text(
              "$drugName",
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 100,
            right: 0,
            child: Center(
              child: Row(
                children: [
                  Text(
                    "Quantity",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: TextButton(
                      onPressed: () {
                        print("clicked");
                      },
                      child: const Icon(Icons.remove,
                          color: Colors.black, size: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text("$data_val"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: TextButton(
                      onPressed: () {
                        print("clicked");
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 90,
            child: Center(
              child: Text(
                'GHC $price',
                style: TextStyle(
                    fontSize: 15.0, color: Color.fromARGB(227, 12, 108, 218)),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 300,
            right: 0,
            child: IconButton(
              onPressed: () {
                print("hello");
              },
              icon: Icon(
                EcentialsIcons.delete,
                size: 15.0,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
