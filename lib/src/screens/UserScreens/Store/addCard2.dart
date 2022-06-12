import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/addCard3.dart';
import 'package:flutter/material.dart';

class cardDetails extends StatelessWidget {
  const cardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        bottomNavigationBar: Container(
          height: 120,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(56, 33, 56, 34),
            child: Button(
              text: "Use Card ",
              width: 302,
              radius: 20,
              style: TextStyle(color: Colors.white, fontSize: 15),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => cardTopup(),
                  ),
                );
              },
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  hintText: 'Enter Card Number',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter Name',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
