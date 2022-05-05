import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/pickUpLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AmbulanceNear extends StatefulWidget {
  const AmbulanceNear({Key? key}) : super(key: key);

  @override
  State<AmbulanceNear> createState() => _AmbulanceNearState();
}

class _AmbulanceNearState extends State<AmbulanceNear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      drawer: const NavDrawer(),
      body: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                depth: -20,
                lightSource: LightSource.top,
                color: Colors.grey.withOpacity(.10),
                boxShape: NeumorphicBoxShape.roundRect(
                  const BorderRadius.only(
                    bottomLeft: const Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(
                          builder: (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(EcentialsIcons.menu_icon),
                          ),
                        ),
                        const Text(
                          "Ambulance",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            EcentialsIcons.more_vert,
                            color: AppColors.primaryDeepColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/images/ambulance_colored.png",
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: "20",
                        style: TextStyle(
                          color: AppColors.primaryBlackColor,
                          fontSize: 30,
                        ),
                        children: [
                          TextSpan(text: " Ambulances"),
                        ],
                      ),
                    ),
                  ),
                  const Text("Avilable near you (5Km)"),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
            child: const pickupLocationCard(
              title: "Pick-up Location",
              location: "location",
              address: "address",
              country: "country",
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: const pickupLocationCard(
              title: "Pick-up Location",
              location: "location",
              address: "address",
              country: "country",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Button(
            width: MediaQuery.of(context).size.width - 40,
            text: "Find Ambulance",
            color: AppColors.primaryRedColor,
            style: TextStyle(
              color: AppColors.primaryWhiteColor,
            ),
          )
        ],
      ),
    );
  }
}
