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
// import 'package:flutter/material.dart';

// import '../../../../../Widgets/CurvedBottomBar.dart';

// class NearbyH extends StatefulWidget {
//   const NearbyH({Key? key}) : super(key: key);

//   @override
//   State<NearbyH> createState() => _NearbyHState();
// }

// class _NearbyHState extends State<NearbyH> {
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
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           debugPrint("object");
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => labScreen()));
//                         },
//                         icon: const Icon(
//                           EcentialsIcons.menu_icon,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 250,
//                       ),
//                       const CircleAvatar(
//                         radius: 15,
//                         backgroundImage:
//                             AssetImage("assets/images/profilePic.png"),
//                       ),
//                     ],
//                   ),
// <<<<<<< HEAD
//                   IconButton(
//                     onPressed: () {
//                       print("object");
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => NavDrawer()));
//                     },
//                     icon: Icon(
//                       EcentialsIcons.menu_icon,
//                     ),
// =======
//                   const SizedBox(height: 15, width: 0),
//                   const Text(
//                     "Find a Nearby Hospital",
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
// >>>>>>> a7022ebb87aad7e3f1e06faa283897b4329c644e
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     children: [
//                       const SizedBox(
//                         width: 20,
//                       ),
//                       const Search4(),
//                       const SizedBox(
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
//                   const SizedBox(
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
//         CurvedBottomBar(
//           currentIndex: (int index) {
//             debugPrint('Current index: $index');
//           },
//           initialIndex: 2,
//         ),
//       ],
//     );
//   }
// }
