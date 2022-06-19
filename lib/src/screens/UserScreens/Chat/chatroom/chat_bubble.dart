import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatefulWidget {
  final bool? isMe;
  final String text;
  final Color color;
  const ChatBubble({Key? key, required this.text, this.isMe,required this.color}) : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            alignment:
                widget.isMe == true ? WrapAlignment.end : WrapAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 10,
                  bottom: 4,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * .6,
                  decoration: BoxDecoration(
                    color: widget.isMe == true
                        ? (widget.color)
                        : Colors.grey.withOpacity(.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.text,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).canvasColor,
                          fontSize: 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
              alignment:
                  widget.isMe == true ? WrapAlignment.end : WrapAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: widget.isMe == true ? 0 : 12,
                    right: widget.isMe != true ? 0 : 12,
                  ),
                  child: Text(
                    "Today, 8:00pm",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).disabledColor.withOpacity(.6),
                    ),
                  ),
                ),
              ]),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
