import 'package:ecentialsclone/src/screens/UserScreens/Chat/chatMessageModel.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
        ),
        title: Row(
          children: [
            Image(
              image: AssetImage("assets/images/profile_image.png"),
              width: 35,
              height: 35,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Anumba",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "Online -Last seen, 2:02pm",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              onPressed: () {},
              icon: Icon(Icons.call_outlined, color: Colors.black),
            ),
            IconButton(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              onPressed: () {},
              icon: Icon(Icons.videocam_outlined, color: Colors.black),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset("assets/images/chatBacground.png"),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 20,
                      child: Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Type your message here...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.mic_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: const Color(0xFF033A64),
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
          ListView(children: [
            SizedBox(
              height: 22,
            ),
            ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 5),
                  child: Column(
                    children: [
                      Align(
                        alignment: (messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[index].messageType == "receiver"
                                // ? Colors.grey.shade200
                                ? Colors.grey.shade500
                                : const Color(0xFF033A64)),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            messages[index].messageContent,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                      // CircleAvatar(
                      //   backgroundColor: Colors.black54,
                      //   radius: 5,
                      // ),
                    ],
                  ),
                );
              },
            ),
          ]),
        ],
      ),
    );
  }
}
