import 'package:ecentialsclone/src/screens/UserScreens/Store/addCardDetails.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _addCardState();
}

class _addCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image.asset("assets/images/add.png"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCardDetails(),
                    ),
                  );
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Add card",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            child: Stack(children: [
              Positioned(
                child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(90 / 360),
                    child: Image.asset("assets/images/walletcard.png")),
              ),
              Positioned(
                top: 25,
                left: 90,
                child: RotationTransition(
                    turns: new AlwaysStoppedAnimation(90 / 360),
                    child: Image.asset("assets/images/chip.png")),
              ),
            ]),
          ),
          SizedBox(
            height: 80,
          ),
          Text("Add a new card"),
          Text(" on your wallet for easy life"),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/visa.png",
                width: 86,
                height: 57,
              ),
              Image.asset(
                "assets/images/coinBit.png",
                width: 86,
                height: 57,
              ),
              Image.asset(
                "assets/images/cards.png",
                width: 86,
                height: 57,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
