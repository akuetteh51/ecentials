import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Themes/colors.dart';

class orderSearch extends StatefulWidget {
  const orderSearch({Key? key}) : super(key: key);

  @override
  State<orderSearch> createState() => _orderSearchState();
}

class _orderSearchState extends State<orderSearch> {
  TextEditingController _date = TextEditingController();

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
        padding: const EdgeInsets.only(top: 30.0, bottom: 20),
        child: Column(
          children: [
            Container(
              height: 41,
              color: Colors.grey[100],
              child: Row(
                children: [
                  Container(
                    // decoration: BoxDecoration(boxShadow: ),
                    width: 75,
                    height: 40,
                    color: Color(0xffF6F9FD),
                    child: Center(child: Text("Date")),
                  ),
                  IconButton(
                    onPressed: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101));
                      if (pickeddate != null) {
                        setState(() {
                          _date.text =
                              DateFormat('dd-MM-yyyy').format(pickeddate);
                        });
                      }
                    },
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      size: 15,
                    ),
                  ),

                  Container(
                    width: 170,
                    height: 40,

                    //  Text('06-02-2022')
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.bottom,
                          textAlign: TextAlign.start,
                          controller: _date,
                          style: const TextStyle(fontSize: 20),
                          cursorColor: AppColors.primaryDeepColor,
                          decoration: const InputDecoration(
                            //  disabledBorder:,

                            hintText: '06-02-2022',
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 20,
                  // ),
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
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ordersList(
                          text: "ORD-2345", state: "Pending", num: "6"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
