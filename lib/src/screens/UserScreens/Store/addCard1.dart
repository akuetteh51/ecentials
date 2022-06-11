import 'package:flutter/material.dart';

class addCard extends StatelessWidget {
  const addCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            Icon(Icons.add),
            Text("Add card"),
          ],
        ),
      ],
    ));
  }
}
