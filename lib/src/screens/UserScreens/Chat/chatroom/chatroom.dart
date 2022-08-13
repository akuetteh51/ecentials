import 'package:ecentialsclone/src/screens/UserScreens/Chat/chatroom/chat_bubble.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/delivery_mode.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  /// Provide the theme color for this chatscreen
  final Color color;
  const ChatRoom({Key? key, required this.color}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  void _deliveryDialog(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (builder) => const DeliveryMode(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/chatBacground.png")),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top + 45,
                ),
                Column(
                  children: [
                    for (int y = 0; y < 10; y++)
                      ChatBubble(
                        text: "Message hjigkug bkeu hke kegnke",
                        isMe: y % 2 == 0 ? true : false,
                        color:  widget.color,
                      ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                margin: const EdgeInsets.all(0),
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top + 12,
                      bottom: 12.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                          const SizedBox(
                            width: 2.0,
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/doctor.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Wrap(
                            direction: Axis.vertical,
                            // crossAxisAlignment: WrapCrossAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Anukem ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .disabledColor
                                      .withOpacity(.8),
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 3.0,
                              ),
                              Text(
                                "Online - last seen, 12:00pm",
                                style: TextStyle(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.phone,
                            color: widget.color,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Icon(
                            Icons.video_call,
                            color: widget.color,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 4.0,
                      bottom: 4.0,
                      left: 8.0,
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 30.0,
                        maxHeight: 90.0,
                      ),
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8.0),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.sentiment_neutral,
                                    size: 24,
                                    color: Theme.of(context).disabledColor,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                                child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: TextFormField(
                                  // controller: controller,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type your message here ...",
                                      hintStyle: TextStyle(
                                        color: Theme.of(context).disabledColor,
                                      )),
                                ),
                              ),
                            )),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Transform.rotate(
                                      angle: .45,
                                      child: Icon(
                                        Icons.attach_file,
                                        color: Theme.of(context).disabledColor,
                                        size: 20,
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Icon(
                                    Icons.photo_camera_outlined,
                                    color: Theme.of(context).disabledColor,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.color),
                    child: IconButton(
                      onPressed: () {
                        _deliveryDialog(context);
                      },
                      icon: const Icon(Icons.mic),
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
