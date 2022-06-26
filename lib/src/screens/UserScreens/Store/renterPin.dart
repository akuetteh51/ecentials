import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/pin.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/PinCreated.dart';
import 'package:flutter/material.dart';

class RenterPin extends StatefulWidget {
  const RenterPin({Key? key}) : super(key: key);

  @override
  _RenterPinState createState() => _RenterPinState();
}

class _RenterPinState extends State<RenterPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(EcentialsIcons.lock),
              SizedBox(
                height: 20,
              ),
              Text(
                "Re-enter your 4-digit Pincode",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: FilledRoundedPinPut(),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Forgot PIN?",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "2",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "3",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "4",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "5",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "6",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "7",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "8",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "9",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 69,
                    width: 120,
                  ),
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      print("Hello world");
                    },
                    child: Text(
                      "0",
                      style: TextStyle(fontSize: 26, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 69,
                    width: 50,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => pinCreated(),
                        ),
                      );
                    },
                    icon: Image.asset("assets/images/delete_key.png"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
