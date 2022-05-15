import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TabTry extends StatelessWidget {
  const TabTry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.primaryWhiteColor,
        // body: ListView(
        //   children: [
        //     SizedBox(
        //       height: 10,
        //     ),
        //     Container(
        //       margin: EdgeInsets.symmetric(horizontal: 10),
        //       padding: EdgeInsets.all(10),
        //       decoration: BoxDecoration(
        //         color: AppColors.primaryBlackColor.withOpacity(.30),
        //         borderRadius: BorderRadius.circular(8),
        //       ),
        //       child: TabBar(
        //         labelColor: AppColors.primaryWhiteColor,
        //         indicator: BoxDecoration(
        //           color: AppColors.primaryDeepColor,
        //           borderRadius: BorderRadius.circular(5),
        //         ),
        //         unselectedLabelColor:
        //             AppColors.primaryBlackColor.withOpacity(.50),
        //         labelStyle: TextStyle(
        //           fontSize: 20,
        //         ),
        //         tabs: [
        //           Tab(
        //             text: "Upcoming",
        //           ),
        //           Tab(
        //             text: "Upcoming",
        //           ),
        //           Tab(
        //             text: "Upcoming",
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),

        appBar: AppBar(
          elevation: 0,
          leading: Image.asset("assets/images/account.png"),
          title: Text("Ghana"),
          titleSpacing: 0,
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          bottom: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryWhiteColor,
            foregroundColor: AppColors.primaryBlackColor,
            leading: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  EcentialsIcons.menu_icon,
                  color: AppColors.primaryDeepColor,
                ),
              ),
            ),
            title: RichText(
              text: const TextSpan(
                text: "Hi, ",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                ),
                children: [
                  TextSpan(
                      text: "Harrison",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                      )),
                ],
              ),
            ),
            actions: [
              GestureDetector(
                child: const CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 20,
                  left: 10,
                ),
                child: Icon(
                  EcentialsIcons.cart,
                  color: AppColors.primaryDeepColor,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        drawer: const NavDrawer(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              children: [
                Search(
                  width: MediaQuery.of(context).size.width,
                  text: "Enter your search term here",
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlueColor.withOpacity(.04),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset("assets/images/text.png"),
                          SizedBox(
                            height: 10,
                          ),
                          Button(
                            height: 30,
                            width: 100,
                            text: "Catalog",
                            style: TextStyle(
                              color: AppColors.primaryWhiteColor,
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        "assets/images/delivery_guy.png",
                        scale: 1.2,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          depth: 10,
                          lightSource: LightSource.top,
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/pres.png"),
                            SizedBox(
                              height: 20,
                            ),
                            Button(
                              text: "Upload",
                              height: 30,
                              width: 100,
                              style:
                                  TextStyle(color: AppColors.primaryWhiteColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 180,
                      height: 180,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          depth: 10,
                          lightSource: LightSource.top,
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/fpharm.png"),
                            SizedBox(
                              height: 20,
                            ),
                            Button(
                              text: "Find",
                              height: 30,
                              width: 100,
                              style:
                                  TextStyle(color: AppColors.primaryWhiteColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
