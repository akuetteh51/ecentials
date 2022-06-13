import 'package:flutter/material.dart';

import '../Themes/colors.dart';
import '../Themes/ecentials_icons_icons.dart';
import 'curvedPaint.dart';
import 'floatingAmbulance.dart';



class CurvedBottomBar extends StatefulWidget {
  final List<String>? tooltips;
  final List<Icon>? icons;
  final ValueChanged<int>? currentIndex;
  final int initialIndex;
  const CurvedBottomBar(
      {Key? key,
      this.tooltips,
      this.icons,
      this.currentIndex,
      this.initialIndex = 0})
      : super(key: key);

  @override
  State<CurvedBottomBar> createState() => _CurvedBottomBarState();
}

class _CurvedBottomBarState extends State<CurvedBottomBar> {
  @override
  void initState() {
    super.initState();
    widget.currentIndex?.call(widget.initialIndex);
  }

  // Icons
  final _icons = [
    Icon(
      EcentialsIcons.home,
      color: AppColors.primaryWhiteColor,
    ),
    Icon(
      EcentialsIcons.sell,
      color: AppColors.primaryWhiteColor,
    ),
    Icon(
      EcentialsIcons.notification,
      color: AppColors.primaryWhiteColor,
    ),
    Icon(
      EcentialsIcons.chat_heart,
      color: AppColors.primaryWhiteColor,
    ),
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
              painter: RPSCustomPainter(),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          child: Container(
            // color: Colors.amber.withOpacity(.5),
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: List.generate(
                4,
                (index) => IconButton(
                  onPressed: () {
                    // widget.index = index;
                    // debugPrint("Tapped: $index");
                    widget.currentIndex?.call(index);
                  },
                  tooltip:
                      widget.tooltips != null && widget.tooltips?.length != 0
                          ? widget.tooltips![index]
                          : _tooltip[index],
                  icon: widget.icons != null && widget.icons?.length != 0
                      ? widget.icons![index]
                      : _icons[index],
                ),
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
