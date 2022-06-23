import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/cardTopup.dart';
import 'package:flutter/material.dart';

class AddCardDetails extends StatelessWidget {
  const AddCardDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
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
                    builder: (context) => CardTopup(),
                  ),
                );
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            // Expanded(
            // child:
            Stack(children: [
              Positioned(child: Image.asset("assets/images/walletcard.png")),
              Positioned(
                top: 45,
                left: 248,
                child: Image.asset("assets/images/chip.png"),
              ),
              Positioned(
                left: 238,
                top: 175,
                child: Image.asset("assets/images/mastercard.png"),
              ),
            ]),
            // ),
            Container(
              width: 320,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Card Number',
                    hintText: 'Enter Card Number',
                  ),
                ),
              ),
            ),
            Container(
              width: 320,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter Name',
                    ),
                  ),
                ),
              ),
            ),

            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 180,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Expires Dates',
                          hintText: '12/08',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 120,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'CVC',
                          hintText: '***',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
