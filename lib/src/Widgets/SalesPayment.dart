import 'package:flutter/material.dart';

class SalesPayment extends StatelessWidget {
  final String? text;
  final String? date;

  const SalesPayment({
    Key? key,
    this.text,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$text",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Text(
                "$date",
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
            padding: const EdgeInsets.only(top: 8.0, left: 50),
            child: Icon(
              Icons.remove_red_eye,
              color: Color(0xff42CB91),
            ),
          )
        ],
      ),
    );
  }
}
