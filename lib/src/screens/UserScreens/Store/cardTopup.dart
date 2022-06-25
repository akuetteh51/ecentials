import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/topupSuccessful.dart';
import 'package:flutter/material.dart';

class CardTopup extends StatelessWidget {
  const CardTopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(children: [
              Positioned(child: Image.asset("assets/images/walletcard.png")),
              Positioned(
                top: 45,
                left: 388,
                child: Image.asset("assets/images/chip.png"),
              ),
              Positioned(
                left: 238,
                top: 175,
                child: Image.asset("assets/images/mastercard.png"),
              ),
              Positioned(
                top: 45,
                left: 37,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Holder name",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      "Prince Anumba",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Card number",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      "5627 21** **** 8869",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Positioned(
                      left: 80,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "Exp. Date",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "16/19",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "CVC",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                "***",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Amount",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  width: 180,
                ),
                Text(
                  r"Balance $1234",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 280,
                ),
                Text(
                  "200.00",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Container(
              height: 120,
              width: 280,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(56, 33, 56, 34),
                child: Button(
                  text: "Top up ",
                  width: 170,
                  radius: 20,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopupSuccessful(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
