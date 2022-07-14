import 'package:flutter/material.dart';

import '../Themes/colors.dart';
import '../Themes/ecentials_icons_icons.dart';
import '../screens/UserScreens/Chat/ChatHomePage.dart';
import '../screens/UserScreens/Home/homeScreen.dart';
import '../screens/UserScreens/Notifications/notifications.dart';
import '../screens/UserScreens/Store/store.dart';
import 'curvedPaint.dart';
import 'floatingAmbulance.dart';

class CurvedBottomBar extends StatefulWidget {
  final ValueChanged<int>? currentIndex;
  final int initialIndex;
  final Color? color;
  const CurvedBottomBar(
      {Key? key, this.currentIndex, this.initialIndex = 0, this.color})
      : super(key: key);

  @override
  State<CurvedBottomBar> createState() => _CurvedBottomBarState();
}

class _CurvedBottomBarState extends State<CurvedBottomBar> {
  int currentLocalIndex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.currentIndex?.call(widget.initialIndex);
      setState(() {
        currentLocalIndex = widget.initialIndex;
      });
    });
  }

  final _icon = {
    "assets/images/home.png": "assets/images/home_filled.png",
    "assets/images/shop.png": "assets/images/shop_filled.png",
    "assets/images/bar_notifications.png":
        "assets/images/notifications_filled.png",
    "assets/images/chat.png": "assets/images/chat_filled.png",
  };

  final _tooltip = [
    "Home",
    "Store",
    "Notifications",
    "Chat Bot",
  ];

  final _pages = [
    HomeScreen(),
    Stores(),
    Notifications(),
    ChatHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -8.0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 80,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 0),
              painter: RPSCustomPainter(shapeColor: widget.color),
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: List.generate(
              _icon.length,
              (index) => Tooltip(
                message: _tooltip[index],
                child: GestureDetector(
                  onTap: () {
                    if (index == 1 || index == 2 || index == 3) {
                      widget.currentIndex?.call(index);
                      setState(() {
                        currentLocalIndex = index;
                      });
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => _pages[index]),
                        ),
                      );
                    }
                  },
                  child: SizedBox(
                    width: 28,
                    height: 28,
                    child: Image.asset(
                      currentLocalIndex == index
                          ? _icon.values.elementAt(index)
                          : _icon.keys.elementAt(index),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40.0,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: const <Widget>[
              FloatingAmbulance(),
            ],
          ),
        ),
      ],
    );
  }
}
