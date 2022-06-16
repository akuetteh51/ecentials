// import 'package:ecentialsclone/src/Themes/colors.dart';
// import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
// import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
// import 'package:ecentialsclone/src/Widgets/button.dart';
// import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
// import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
// import 'package:ecentialsclone/src/Widgets/navDrawer.dart';
// import 'package:ecentialsclone/src/Widgets/search.dart';
// import 'package:ecentialsclone/src/Widgets/searchForh.dart';
// import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
// import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Lab5.dart';
// import 'package:ecentialsclone/src/screens/components/curvedPaint.dart';
// import 'package:flutter/material.dart';

// class NearbyH extends StatefulWidget {
//   const NearbyH({Key? key}) : super(key: key);

//   @override
//   State<NearbyH> createState() => _NearbyHState();
// }

// class _NearbyHState extends State<NearbyH> {
//   // Icons
//   final _icons = [
//     Icon(
//       EcentialsIcons.home,
//       color: AppColors.primaryWhiteColor,
//     ),
//     Icon(
//       EcentialsIcons.sell,
//       color: AppColors.primaryWhiteColor,
//     ),
//     Icon(
//       EcentialsIcons.notification,
//       color: AppColors.primaryWhiteColor,
//     ),
//     Icon(
//       EcentialsIcons.chat_heart,
//       color: AppColors.primaryWhiteColor,
//     ),
//   ];

// // Icons tooltips
//   final _tooltip = [
//     "Home",
//     "Store",
//     "Notifications",
//     "Chat Bot",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           // floatingActionButton: FloatingAmbulance(),
//           // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//           // bottomNavigationBar: BottomNavBar(),
//           body: SingleChildScrollView(
//             child: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 30),
//                 child: Column(children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           print("object");
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => labScreen()));
//                         },
//                         icon: Icon(
//                           EcentialsIcons.menu_icon,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 250,
//                       ),
//                       CircleAvatar(
//                         radius: 15,
//                         backgroundImage:
//                             AssetImage("assets/images/profilePic.png"),
//                       ),
//                     ],
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       print("object");
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => NavDrawer()));
//                     },
//                     icon: Icon(
//                       EcentialsIcons.menu_icon,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Search4(),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(5.0),
//                         height: 35,
//                         width: 35,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           color: Colors.teal,
//                         ),
//                         child: Icon(
//                           EcentialsIcons.filter,
//                           size: 20,
//                           color: AppColors.primaryWhiteColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Search4(),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(5.0),
//                     height: 35,
//                     width: 35,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.teal,
//                     ),
//                     child: Icon(
//                       EcentialsIcons.filter,
//                       size: 20,
//                       color: AppColors.primaryWhiteColor,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: 20,
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: const [
//                         TopDoctor(
//                             image: "assets/images/doctor1.png",
//                             docName: "Dr Esther Agams",
//                             specialization: "Heart Surgery",
//                             experience: 5),
//                         TopDoctor(
//                             image: "assets/images/doctor2.png",
//                             docName: "Sussan Agams",
//                             specialization: "Heart Surgery",
//                             experience: 5)
//                       ],
//                     ),
//                   ),
//                   //  const SizedBox(
//                   //     height: 20,
//                   //   ),
//                   SingleChildScrollView(
//                     child: Column(
//                       children: const [
//                         SizedBox(
//                           height: 20,
//                         ),
//                         LabResultsCard(
//                             image: "assets/images/hospitalNational.png",
//                             labName: "ZIky National Hospital",
//                             openingHours: "Weekdays |7:00am -8:pm"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         LabResultsCard(
//                             image: "assets/images/hospitaln.png",
//                             labName: "ZIky National Hospital",
//                             openingHours: "Weekdays |7:00am -8:pm"),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         LabResultsCard(
//                             image: "assets/images/hospitalna.png",
//                             labName: "ZIky National Hospital",
//                             openingHours: "Weekdays |7:00am -8:pm")
//                       ],
//                     ),
//                   ),
//                 ]),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           //  child:
//           //   Positioned(
//           //  bottom: -80.0,
//           child: Stack(
//             children: [
//               SizedBox(
//                 height: 80,
//                 child: CustomPaint(
//                   size: Size(MediaQuery.of(context).size.width,
//                       80.0), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//                   painter: RPSCustomPainter(),
//                 ),
//               ),
//               Positioned(
//                 bottom: 10,
//                 child: Container(
//                   // color: Colors.amber.withOpacity(.2),
//                   width: MediaQuery.of(context).size.width,
//                   height: 40,
//                   child: Wrap(
//                     alignment: WrapAlignment.spaceEvenly,
//                     crossAxisAlignment: WrapCrossAlignment.end,
//                     children: List.generate(
//                       4,
//                       (index) => IconButton(
//                         onPressed: () {
//                           // widget.index = index;
//                           debugPrint("Tapped: $index");
//                         },
//                         tooltip: _tooltip[index],
//                         icon: _icons[index],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),              
//             ],
//           ),
//           //),
//         ),

//         Positioned(
//           bottom: 56.0,
//           child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: 40,
//                   child: Wrap(
//                     alignment: WrapAlignment.center,
//                     children: const[ FloatingAmbulance()],
//                   ),),)
//       ],
//     );
//   }
// }
