import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:flutter/material.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../../../Themes/colors.dart';
import '../../../../../Themes/ecentials_icons_icons.dart';
import '../../../../../Widgets/labResultsCard.dart';
import '../../../../../Widgets/navDrawer.dart';

/// [LabHomepage] displays a list of known labs
/// and an ability to search any lab around.
///
/// check figma lab screen one for details.
class LabHomepage extends StatefulWidget {
  const LabHomepage({Key? key}) : super(key: key);

  @override
  _LabHomepageState createState() => _LabHomepageState();
}

class _LabHomepageState extends State<LabHomepage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.01;
    var width = MediaQuery.of(context).size.width * 0.03;

    return Scaffold(
        floatingActionButton: const FloatingAmbulance(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavBar(),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.only(top: height, left: width, right: width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // IconButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => const NavDrawer()));
                    //   },
                    //   icon: const Icon(
                    //     EcentialsIcons.menu_icon,
                    //   ),
                    // ),
                    GestureDetector(
                      child: const Icon(
                        EcentialsIcons.menu_icon,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NavDrawer()));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.height * 0.012),
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            AssetImage("assets/images/profilePic.png"),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  "Search for labs",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.78,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Neumorphic(
                          padding: const EdgeInsets.only(
                            left: 7,
                            right: 5,
                          ),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(45)),
                            depth: -5,
                            // lightSource: LightSource.top,
                            color: Colors.white.withOpacity(0.1),
                          ),
                          child: TextField(
                            // controller: controller,
                            style: const TextStyle(fontSize: 16),
                            cursorColor: AppColors.primaryDeepColor,
                            decoration: InputDecoration(
                              icon: IconButton(
                                icon: Icon(
                                  EcentialsIcons.search,
                                  color: AppColors.primaryBlackColor,
                                  size: 17.0,
                                ),
                                onPressed: () {},
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  EcentialsIcons.mic,
                                  color: AppColors.primaryBlackColor,
                                  size: 17.0,
                                ),
                                onPressed: () {},
                              ),
                              hintText: "Search ...",
                              iconColor: AppColors.primaryDeepColor,
                              focusColor: AppColors.primaryDeepColor,
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.teal,
                      ),
                      child: Icon(
                        Icons.dehaze,
                        size: 20,
                        color: AppColors.primaryWhiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                const LabResultsCard(
                    image: "assets/images/hospitalNational.png",
                    labName: "ZIky National Hospital",
                    openingHours: "Weekdays |7:00am -8:pm"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const LabResultsCard(
                    image: "assets/images/hospitaln.png",
                    labName: "Ziky National Hospital",
                    openingHours: "Weekdays |7:00am -8:pm"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const LabResultsCard(
                    image: "assets/images/hospitalna.png",
                    labName: "ZIky National Hospital",
                    openingHours: "Weekdays |7:00am -8:pm")
              ],
            ),
          )),
        ));
  }
}
