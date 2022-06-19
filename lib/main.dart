// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/language_setting.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/ecentialsWallet.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/login.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/chatroom/chat_bubble.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/delivery_mode.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulance_map.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/labScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/docotorInfo.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/nearbyHospital.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labChat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labSchedules.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/alllabs.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/doctorInformation.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labDetails.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/lab_homepage.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/mapScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/orderCompleted.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/cart.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/orderProcessed.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/orderSubmitted.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/drugDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/pharmacyDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanDocument.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/uploadResults.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:ecentialsclone/src/app_state/MainState.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Payments/Payed.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Payments/paymentMethod.dart';
import 'package:ecentialsclone/src/screens/onboardingScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/chat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Chat/chatroom/chatroom.dart';
import 'package:provider/provider.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulanceDirection.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Ambulance/ambulanceNear.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/EducationalInfo.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/HealthInformation.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/editProfile.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/personalInfo.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Settings/setting.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Notifications/notifications.dart';
import 'package:flutter/services.dart';

import 'package:ecentialsclone/src/screens/UserScreens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/hospitalSchedules.dart';
import 'src/screens/UserScreens/Home/MinuteClinic/minuteClinic.dart';
import 'src/app_state/ambulance_state.dart';
import 'src/app_state/hospital_state.dart';
import 'src/app_state/lab_state.dart';
import 'src/app_state/pharmacy_state.dart';
import 'src/app_state/shop_state.dart';
import 'src/screens/test_widgets_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preference = await SharedPreferences.getInstance();
  final showLogin = preference.getBool('showLogin') ?? false;
  final showSignup = preference.getBool('showSignup') ?? false;

  runApp(
    // MyApp(
    //   // showLogin: true,
    //   // showSignup: false,
    //
    // ),
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainState>(create: (_) => MainState()),
        ChangeNotifierProvider<LabState>(create: (_) => LabState()),
        ChangeNotifierProvider<AmbulanceState>(create: (_) => AmbulanceState()),
        ChangeNotifierProvider<HospitalState>(create: (_) => HospitalState()),
        ChangeNotifierProvider<PharmacyState>(create: (_) => PharmacyState()),
        ChangeNotifierProvider<ShopState>(create: (_) => ShopState()),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChatRoom(),
        // home: ChatRoom(color: AppColors.primaryDeepColor),
        // home: TestWidgetsScreen(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showLogin;
  final bool showSignup;
  const MyApp({Key? key, required this.showLogin, required this.showSignup})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(        
        splash: "assets/images/logo.png",
        centered: true,
        duration: 2000,
        splashIconSize: 500,
        nextScreen: DeliveryMode(),
        // nextScreen: showLogin ? Login() : const OnboardingScreen(),
      ),
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
    );
  }
}
