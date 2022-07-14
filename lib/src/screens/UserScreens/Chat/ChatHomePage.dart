import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/MessagePersonItem.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/chatroom/chatroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              CupertinoIcons.chat_bubble_text_fill,
              color: AppColors.primaryDeepColor,
            ),
            title: Text(
              "Your Chats",
              style: TextStyle(
                color: AppColors.primaryDeepColor,
                fontSize: 17,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              children: List.generate(
                  10,
                  (index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) =>const ChatRoom(color: Colors.red,)));
                      },
                      child: const MessagePersonItem())),
            ),
          ),
        ],
      ),
    );
  }
}
