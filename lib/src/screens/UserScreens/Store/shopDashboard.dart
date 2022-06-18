import 'package:dotted_border/dotted_border.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ShopDashboard extends StatelessWidget {
  const ShopDashboard({Key? key}) : super(key: key);

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
          child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Search(
              width: MediaQuery.of(context).size.width,
              text: "Enter your search term here",
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/analytics.png",
              width: 351,
              height: 334,
            ),
            Image.asset(
              "assets/images/analy.png",
              width: 328,
              height: 126,
            ),
            Image.asset(
              "assets/images/analytic.png",
              width: 360,
              height: 442,
            ),
            Text("Products"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 0,
                ),
                Card(
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30.0, left: 8, right: 8),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/syrup.png",
                          width: 57,
                          height: 66,
                        ),
                        Text(
                          "Cough Syrup",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "2 tea spoons daily",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              r"5.00",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/pen.png",
                                width: 23,
                                height: 23,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                DottedBorder(
                  radius: Radius.circular(5),
                  child: Card(
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 20.0, left: 20, right: 20),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                          Text(
                            "Add",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Text(
                            "Product",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          SizedBox(width: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
