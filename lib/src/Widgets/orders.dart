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
    return Card(
      margin: EdgeInsets.all(1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$text",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$state",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        color: Colors.grey),
                    textAlign: TextAlign.start,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 208,
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
      ),
    );
  }
}
