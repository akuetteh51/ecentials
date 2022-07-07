import 'package:flutter/material.dart';

class ordersList extends StatelessWidget {
  final String? text;
  final String? state;
  final String? num;

  const ordersList({
    Key? key,
    this.text,
    this.state,
    this.num,
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
                "$state",
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
              "$num Items",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Colors.grey),
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}
