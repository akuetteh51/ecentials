import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Hospital1.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/PinCreated.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/PinVerfication.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/SetUpEcentialsWallet.dart';
import 'package:flutter/material.dart';

class TestWidgetsScreen extends StatefulWidget {
  const TestWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<TestWidgetsScreen> createState() => _TestWidgetsScreenState();
}

class _TestWidgetsScreenState extends State<TestWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SetupWallet(),
      //  PageView(children: [],),
    );
  }
}
