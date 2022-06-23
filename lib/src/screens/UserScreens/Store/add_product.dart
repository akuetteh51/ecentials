import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class addingProduct extends StatelessWidget {
  const addingProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DottedBorder(
                  radius: Radius.circular(20),
                  color: Colors.orangeAccent,
                  padding: EdgeInsets.all(1),
                  child: Card(
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0, bottom: 15.0, left: 15, right: 15),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                          Text(
                            "Add photos",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Text(
                            "1600 x 1200 for hi res",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          SizedBox(width: 30),
                        ],
                      ),
                    ),
                  ),
                ),
                Stack(children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Positioned(
                      child: Image.asset(
                        "assets/images/selectsyrup.png",
                        width: 147,
                        height: 106,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -5,
                    left: 140,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_done),
                    ),
                  ),
                ]),
              ],
            ),
            Text("Max 4 photos per product"),
          ],
        ),
      ),
    );
  }
}
