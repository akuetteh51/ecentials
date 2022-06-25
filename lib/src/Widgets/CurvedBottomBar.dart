import 'package:flutter/material.dart';

import '../Themes/colors.dart';
import '../Themes/ecentials_icons_icons.dart';
import 'curvedPaint.dart';
import 'floatingAmbulance.dart';

class CurvedBottomBar extends StatefulWidget {
  final ValueChanged<int>? currentIndex;
  final int initialIndex;
  final Color? color;
  const CurvedBottomBar(
      {Key? key,
      this.currentIndex,
      this.initialIndex = 0, this.color})
      : super(key: key);

  @override
  State<CurvedBottomBar> createState() => _CurvedBottomBarState();
}

class _CurvedBottomBarState extends State<CurvedBottomBar> {
  int currentLocalIndex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.currentIndex?.call(widget.initialIndex);
      setState(() {
        currentLocalIndex = widget.initialIndex;
      });
    });
  }

  // Icons
  final _icons = [
    "assets/images/home.png",
    "assets/images/shop.png",
    "assets/images/bar_notifications.png",
    "assets/images/chat.png",
  ];
  // Icons fileed
  final _iconsFilled = [
    "assets/images/home_filled.png",
    "assets/images/shop_filled.png",
    "assets/images/notifications_filled.png",
    "assets/images/chat_filled.png",
  ];

// Icons tooltips
  final _tooltip = [
    "Home",
    "Store",
    "Notifications",
    "Chat Bot",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -20.0,
          child: SizedBox(
            height: 80,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  80.0), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(shapeColor: widget.color),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: Container(
            // color: Colors.amber.withOpacity(.5),
            width: MediaQuery.of(context).size.width,
            // height: 40,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: List.generate(
                4,
                (index) => Tooltip(
                  message:  _tooltip[index],
                  child: GestureDetector(
                    onTap: () {
                      widget.currentIndex?.call(index);
                      setState(() {
                        currentLocalIndex = index;
                      });                    
                    },
                    child: SizedBox(
                      width: 28,
                      height:28,
                      child: Image.asset(currentLocalIndex == index?_iconsFilled[index] :  _icons[index]),
                    ),
                  ),
                ),
                // IconButton(
                //   onPressed: () {
                //     widget.currentIndex?.call(index);
                //     setState(() {
                //       currentLocalIndex = index;
                //     });
                //   },
                //   tooltip:
                //       ,
                //   icon: ,
                // ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 32.0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Wrap(
              alignment: WrapAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(right: 5.0),
                  child: FloatingAmbulance(),
                )
              ],
            ),
          ),
        ),
      ],
    );
    //),
    // ),
  }
}
