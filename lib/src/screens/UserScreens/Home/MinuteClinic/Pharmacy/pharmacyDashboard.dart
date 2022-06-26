// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_import, unused_label

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
import 'package:ecentialsclone/src/Widgets/pharmacyCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/cart.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/cart.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/drugDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';

import '../../../../../Widgets/CurvedBottomBar.dart';
import '../../../Chat/ChatHomePage.dart';
import '../../../Notifications/notifications.dart';
import '../../../Store/store.dart';
import 'cart.dart';

class PharmacyDashboard extends StatefulWidget {
  const PharmacyDashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<PharmacyDashboard> createState() => _PharmacyDashboardState();
}

class _PharmacyDashboardState extends State<PharmacyDashboard> {
  int currentIndex = 0;
  Widget pharmacyDashBoardBody() {
    return Scaffold(

        // bottomNavigationBar: BottomNavBar(),
        // floatingActionButton: FloatingAmbulance(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryWhiteColor,
          // backgroundColor: Colors.amber,
          foregroundColor: AppColors.primaryBlackColor,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                EcentialsIcons.menu_icon,
                color: AppColors.primaryDeepColor,
                size: 18,
              ),
            ),
          ),
          title: RichText(
            text: TextSpan(
              text: "Hi, ",
              style: TextStyle(
                fontSize: 17,
                fontFamily: "Montserrat",
                color: AppColors.primaryDeepColor,
              ),
              children: [
                TextSpan(
                    text: "Sussan",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      color: AppColors.primaryDeepColor,
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
              child: IconButton(
                onPressed: () {
                  Get.to(() => Cart());
                },
                icon: Icon(
                  EcentialsIcons.cart,
                  color: AppColors.primaryDeepColor,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        drawer: const NavDrawer(),
        body: SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width,
                      //   child: Wrap(
                      //     alignment: WrapAlignment.end,
                      //     children: [
                      //       SizedBox(
                      //       width: 20,
                      //       height: 20,
                      //       child: Image.asset("assets/images/Vector.png"),),
                      //       SizedBox(width: 10.0,),
                      //       Text("Ghana",style: TextStyle(fontSize: 13.5),),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Search4(
                        width: MediaQuery.of(context).size.width,
                        text: "Enter your search term here ",
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 38, // left: 24.78
                        ),
                        child: Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              // margin: const EdgeInsets.only(
                              //  top: 38, // left: 24.78
                              // ),
                              // width:  170,
                              width: (MediaQuery.of(context).size.width * .5) -
                                  20.0,
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
                                    Image.asset("assets/images/upload.png"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Button(
                                      text: "Upload",
                                      height: 30,
                                      width: 100,
                                      style: TextStyle(
                                          color: AppColors.primaryWhiteColor),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              // width: 170,
                              width: (MediaQuery.of(context).size.width * .5) -
                                  20.0,
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
                                    Image.asset("assets/images/Find.png"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Button(
                                      text: "Find",
                                      height: 30,
                                      width: 100,
                                      style: TextStyle(
                                          color: AppColors.primaryWhiteColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // ],
                            // ),
                            // ],
                            //   ),
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 15, // left: 24.78
                              ),
                              child: Text(
                                "Pharmacies  ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200.0,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    5,
                                    (index) => Container(
                                      margin: EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => DrugDashboard());
                                        },
                                        child: PharmacyCard(
                                            pharmacyName: "Top up pharmacy ",
                                            location: "Spintex",
                                            address: "Accra",
                                            country: "Ghana"),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 27.9, // left: 24.78
                              ),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Popular OTC Drugs",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                    SizedBox(
                                      child: Image.asset(
                                          "assets/images/filter.png",
                                          color: AppColors.primaryBlackColor
                                              .withOpacity(.50)),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 16.0,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: MediaQuery.of(context).size.width,
                              child: GridView.builder(
                                itemCount: 6,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  mainAxisExtent: 200,
                                ),
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        drugCard(
                                  drugName: "Ibuprofen",
                                  drugType: "Tablets",
                                  quantity: 50,
                                  price: 5.00,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35.0,
                            ),
                          ],
                        ),
                      )
                      //   ),
                      // ),
                    ]))));
  }

  @override
  Widget build(BuildContext context) {
    // Pages
    final _pages = [
      pharmacyDashBoardBody(),
      Stores(),
      const Notifications(),
      // const ChatRoom(),
      const ChatHomePage(),
    ];

    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _pages[currentIndex],
        ),
        Material(
          type: MaterialType.transparency,
          child: CurvedBottomBar(
            currentIndex: (int curIndex) {
              setState(() {
                currentIndex = curIndex;
              });
            },
          ),
        ),
      ],
    );
  }
}
