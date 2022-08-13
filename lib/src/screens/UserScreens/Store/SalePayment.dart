import 'package:ecentialsclone/src/Widgets/SalesPayment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Themes/colors.dart';
import '../../../Widgets/orders.dart';

class salesPayment extends StatefulWidget {
  const salesPayment({Key? key}) : super(key: key);

  @override
  State<salesPayment> createState() => _salesPaymentState();
}

class _salesPaymentState extends State<salesPayment> {
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text("Sales & Payment",
            style: TextStyle(fontSize: 24, color: Colors.black)),
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
        padding:
            const EdgeInsets.only(left: 8, top: 30.0, bottom: 20, right: 8),
        child: Column(
          children: [
            Container(
              height: 41,
              color: Colors.grey[100],
              child: Expanded(
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 75,
                        height: 40,
                        color: Color(0xffF7FAFE),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 15,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.sort_by_alpha)
                            ],
                          ),
                        ),
                      ),
                      onTap: () async {
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
                    ),
                    Container(
                      width: 210,
                      height: 40,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.start,
                            controller: _date,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            cursorColor: AppColors.primaryDeepColor,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 14)
                                // hintText: '06-02-2022',
                                ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 58,
                      height: 40,
                      color: Color(0xff043B64),
                      child: Center(
                        child: Text(
                          "Find",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19"),
                    SalesPayment(text: "INV-2345", date: "2022-05-19")
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
