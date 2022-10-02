

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecentialsclone/baseVerification.dart';
import 'package:ecentialsclone/src/app_state/Health_Info_state.dart';

import 'package:ecentialsclone/src/app_state/cart_state.dart';
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

import 'package:provider/provider.dart';

import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'src/app_state/AuthState.dart';
import 'src/app_state/user_state.dart';
import 'src/app_state/ambulance_state.dart';
import 'src/app_state/hospital_state.dart';
import 'src/app_state/lab_state.dart';
import 'src/app_state/pharmacy_state.dart';
import 'src/app_state/shop_state.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preference = await SharedPreferences.getInstance();
  final showLogin = preference.getBool('showLogin') ?? false;
  final showSignup = preference.getBool('showSignup') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainState>(create: (_) => MainState()),
        ChangeNotifierProvider<LabState>(create: (_) => LabState()),
        ChangeNotifierProvider<AmbulanceState>(create: (_) => AmbulanceState()),
        ChangeNotifierProvider<HospitalState>(create: (_) => HospitalState()),
        ChangeNotifierProvider<PharmacyState>(create: (_) => PharmacyState()),
        ChangeNotifierProvider<ShopState>(create: (_) => ShopState()),
        ChangeNotifierProvider<AuthState>(create: (_) => AuthState()),
        ChangeNotifierProvider<UserState>(create: (_) => UserState()),
        ChangeNotifierProvider<HealthInformationState>(
            create: (_) => HealthInformationState()),

        ChangeNotifierProvider<CartState>(create: (_) => CartState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: "assets/images/logo.png",
        centered: true,
        duration: 1000,
        splashIconSize: 500,
        // nextScreen: DeliveryMode(),
        nextScreen:
            BaseVerification(), // BaseVerification() handles which page to show the user
      ),
      theme: ThemeData(
        fontFamily: "Montserrat",
      ),
    );
  }
}
