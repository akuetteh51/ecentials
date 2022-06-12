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
        Text("Add a new card on your wallet for easy life"),
        Text("Add card"),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.ac_unit_sharp),
        ),
      ],
    ));
  }
}
