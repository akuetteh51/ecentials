import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(
          image: AssetImage("assets/images/img_3.png"),
          width: 52,
          height: 52,
        ),
        title: Text("Anumba"),
      ),
      body: Center(child: Text("Chat")),
    );
  }
}
