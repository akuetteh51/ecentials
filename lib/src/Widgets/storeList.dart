import 'package:flutter/material.dart';

class storeListing extends StatelessWidget {
  final String storeName;

  const storeListing({Key? key, required this.storeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: double.infinity,
      child: Container(
        width: double.infinity,
        color: Colors.white70,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/Pharmacystore.png",
                  height: 90.0,
                  width: 90.0,
                ),
                Text(
                  " $storeName",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        width: 101.6,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(203, 246, 156, 46),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Edit Store",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Container(
                        width: 101.6,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(203, 246, 156, 46),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "View Store",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: -50,
              left: 90,
              child: Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Remove Store",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
