import 'package:flutter/material.dart';

class salesPayment extends StatefulWidget {
  const salesPayment({Key? key}) : super(key: key);

  @override
  State<salesPayment> createState() => _salesPaymentState();
}

class _salesPaymentState extends State<salesPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Sales & Payment",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}
