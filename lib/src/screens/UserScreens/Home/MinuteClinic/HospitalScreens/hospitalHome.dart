import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/CurvedBottomBar.dart';
import 'package:ecentialsclone/src/app_state/hospital_state.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/nearbyHospital.dart';
import 'package:flutter/material.dart';
import '../../../../../Widgets/searchLocation.dart';
import "Hospital1.dart";
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../Themes/ecentials_icons_icons.dart';
import '../../../../../Widgets/navDrawer.dart';
import '../../../../../Widgets/search.dart';
import '../../../Chat/ChatHomePage.dart';
import '../../../Notifications/notifications.dart';
import '../../../Store/store.dart';
import '../../Profiles/profileScreen.dart';


class HospitalHome extends StatefulWidget {
  
  const HospitalHome({Key? key}) : super(key: key);

  @override
  State<HospitalHome> createState() => _HospitalHomeState();
}

class _HospitalHomeState extends State<HospitalHome> {
  TextEditingController searchController = new TextEditingController();
//  var searchDataD=searchController.text;
  int currentIndex = 0;
  onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    HospitalState hospitalState =
        Provider.of<HospitalState>(context, listen: false);

    UserState userState = Provider.of<UserState>(context, listen: false);

    // AppBar
    final _appBar = AppBar(
      backgroundColor: AppColors.primaryWhiteColor,
      elevation: 0,
      foregroundColor: AppColors.primaryBlackColor,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(EcentialsIcons.menu_icon),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.to(() => ProfileScreen(), transition: Transition.rightToLeft);
          },
          child: Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/profilePic.png"),
            ),
          ),
        ),
      ],
      bottom: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryWhiteColor,
        elevation: 0,
        foregroundColor: AppColors.primaryBlackColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Search(
                    controller: searchController,
                    searchPressed: () {print(searchController.text);
                    // hospitalState.
                    
                    },
                    micPressed: () {},
                  ),
                  width: MediaQuery.of(context).size.width - 90,
                ),
                IconButton(
                  padding: EdgeInsets.all(3),
                  color: AppColors.primaryDeepColor,
                  onPressed: () {filterDrop();},
                  icon: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDeepColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset("assets/images/filter.png"),
                  ),
                )
              ],

            ),
            Text("${searchController.text}"),
           
          ],
        ),
      ),
    );

    // screens
    final _pages = [
      NearbyHospital(Searchdata: searchController.text,),
      Stores(),
      const Notifications(),
      const ChatHomePage(),
    ];

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      bottomNavigationBar: CurvedBottomBar(
        currentIndex: onTap,
      ),
      appBar: currentIndex == 0 ? _appBar : null,
      drawer: currentIndex == 0 ? const NavDrawer() : null,
      body: _pages[currentIndex],
    );
  }



  void filterDrop() {
    // showModelBottomSheet(context: context, builder: (context) {});
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 30),
                      child: Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 230,
                    ),
                  ],
                ),
                search_bar(),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Service Type",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 190,
                    ),
                    // Icon(
                    //   Icons.compare_arrows_sharp,
                    //   color: const Color(0xFF033A64),
                    // ),
                    GestureDetector(
                      child: Image.asset("assets/images/Control.png"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          backgroundColor: const Color(0xFF033A64),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 13),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Text("Biological"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 13),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Text("Chemical"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 13),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Text("DNA test"),
                      ),
                    ),
                      SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 13),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Text("Biological"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 13),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Text("Chemical"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 13),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Text("Pathology"),
                      ),
                    ),
                      SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 13),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Text("Hematology"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 13),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Text("Microbiology"),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                          backgroundColor: Colors.grey,
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 13),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                        ),
                        onPressed: () {
                          print("hello");
                        },
                        child: Text("Blood test"),
                      ),
                    ),
                      SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, left: 30),
                      child: Text(
                        "Distance",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 230,
                    ),
                  ],
                ),
                search_bar(),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(
                            left: 85.0, right: 85.0, top: 10.0, bottom: 10),
                        backgroundColor: const Color(0xFF033A64),
                        primary: Colors.white,
                        textStyle: const TextStyle(fontSize: 15),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Show results"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        primary: Colors.black,
                        textStyle: const TextStyle(fontSize: 15),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                      ),
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Clear"),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
  }