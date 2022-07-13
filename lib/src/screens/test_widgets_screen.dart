import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Hospital1.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Hospital2DocProfile.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/screen6.dart';
// ignore_for_file: unused_import, duplicate_import, non_constant_identifier_names

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/ambulanceResultsList.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/navDrawer.dart';

import 'package:ecentialsclone/src/Widgets/pharmacyCard.dart';
import 'package:ecentialsclone/src/Widgets/pickUpLocation.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/topDoctor.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';

import 'package:ecentialsclone/src/Widgets/prominentDoctors.dart';
import 'package:ecentialsclone/src/Widgets/recentChatsCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';

import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/cartCard.dart';
import 'package:ecentialsclone/src/Widgets/doctorCard.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/infoCard.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';

import 'package:ecentialsclone/src/Widgets/outlinedButton.dart';

import 'package:ecentialsclone/src/Widgets/schoolsAttendedCard.dart';
import 'package:ecentialsclone/src/Widgets/storeList.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/agreement.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/registration.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/HospitalScreens/Hospital4Chat.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/homeScreen.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/createPin.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/enterStoreDetails.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/MyStoreHome2.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/PinCreated.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/PinVerfication.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/setUpEcentialsWallet.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Wallet/addCard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Wallet/cardTopup.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/add_product.dart';
import 'package:ecentialsclone/src/screens/UserScreens/pin_creation_prompt.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/shopDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Wallet/topupSuccessful.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/ecentialsWallet.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/store.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labDetails.dart';
import 'package:flutter/material.dart';

import 'UserScreens/Home/MinuteClinic/HospitalScreens/labScreen.dart';

class TestWidgetsScreen extends StatefulWidget {
  const TestWidgetsScreen({Key? key}) : super(key: key);

  @override
  State<TestWidgetsScreen> createState() => _TestWidgetsScreenState();
}

class _TestWidgetsScreenState extends State<TestWidgetsScreen> {
  get screen_widget => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pinCreationPrompt(),
      // body: Mystore3(),
      //  NearbyH(),
      // /addingProduct(),
      //  DocotorInfo(),
      //  Schedule(),

      //  DocotorInfo(),
      //  cardDetails(),
      // walletSet(),
      //  topedup(),
      //  walletSet(),
      // addingProduct(),
      // SetupWallet(),
      // labScreen()
    );
  }
}
