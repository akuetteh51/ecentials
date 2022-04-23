import 'package:flutter/material.dart';
import '../Themes/colors.dart';
import '../Themes/ecentials_icons_icons.dart';

class BottomNavBar extends StatefulWidget {
  final Color backgroundColor;
  final Widget? body;
  final AppBar? appBar;
  final Drawer? drawer;
  final onTap;
  const BottomNavBar(
      {Key? key,
      this.backgroundColor = const Color(0xFF033A64),
      this.body,
      this.appBar,
      this.drawer,
      this.onTap})
      : super(key: key);
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    int currentIndex =
        0; //Takes the current index of the Icon pressed and set the corressponding page

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
// Floating Ambulance Center docked
    final _floatingAmbulance = GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/nav_ambulance.png"),
            ),
          ),
        ));

    // Create Pages as a list and pass it to BottomNavBar body and use the current index to loop through pages

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      floatingActionButton: _floatingAmbulance,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomAppBar(
            color: widget.backgroundColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                4,
                (index) => IconButton(
                  onPressed: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  tooltip: _tooltip[index],
                  icon: _icons[index],
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: widget.appBar,
      body: widget.body,
      drawer: widget.drawer,
    );
  }
}
