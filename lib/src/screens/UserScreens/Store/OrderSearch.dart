import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:flutter/material.dart';

class orderSearch extends StatefulWidget {
  const orderSearch({Key? key}) : super(key: key);

  @override
  State<orderSearch> createState() => _orderSearchState();
}

class _orderSearchState extends State<orderSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title:
            Text("Orders", style: TextStyle(fontSize: 24, color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Image.asset(
              "assets/images/Pharmacystore.png",
              height: 32,
              width: 32,
            ),
          )
        ],
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
                child: Row(
              children: [
                Container(
                  width: 75,
                  height: 40,
                  color: Color(0xffF6F9FD),
                  child: Center(child: Text("Date")),
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 15,
                ),
                Container(
                    width: 170,
                    height: 40,
                    child: Center(child: Text('06-02-2022'))),
                Container(
                  width: 58,
                  height: 40,
                  color: Color(0xff043B64),
                  child: Center(
                      child: Text(
                    "Find",
                    style: TextStyle(color: Colors.white),
                  )),
                )
              ],
            )),
            SingleChildScrollView(
                child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "ORD-2345",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              Text(
                                "Pending",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Colors.grey),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 190,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "6 Items",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "ORD-2345",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                              Text(
                                "Pending",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    color: Colors.grey),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 190,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              "6 Items",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.grey),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
