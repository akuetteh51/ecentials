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

import 'package:ecentialsclone/src/app_state/user_state.dart';

import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/UploadPrescription.dart';

import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/cart.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/cart.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/drugDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/profileScreen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/FindPharmacy.dart';
import 'package:get/get.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:provider/provider.dart';

import '../../../../../app_state/pharmacy_state.dart';
import 'cart.dart';

class PharmacyDashboard extends StatefulWidget {
  const PharmacyDashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<PharmacyDashboard> createState() => _PharmacyDashboardState();
}

class _PharmacyDashboardState extends State<PharmacyDashboard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      PharmacyState pharmacyState =
          Provider.of<PharmacyState>(context, listen: false);
      UserState userState = Provider.of<UserState>(context, listen: false);
      pharmacyState.fetchPharmaciesPreview(
        token: userState.userInfo?['token'],
      );
      pharmacyState.getPopularDrugs(
        token: userState.userInfo?['token'],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    PharmacyState pharmacyState = Provider.of<PharmacyState>(context);
    UserState userState = Provider.of<UserState>(
      context,
    );

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
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
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20, // left: 24.78
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85 / 2,
                      height: 150,
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
                            Builder(
                              builder: (context) {
                                return Button(
                                   onTap: () {
                               Get.to(() => UploadPrescription());
                                   },
                                  text: "Upload",
                                  height: 30,
                                  width: 100,
                                  style:
                                      TextStyle(color: AppColors.primaryWhiteColor),
                                );
                              }
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85 / 2,
                      height: 150,
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
                            Builder(
                              builder: (context) {
                                 
                                return Button(
                                   onTap: () {
                               Get.to(() => FindPharmacy());
                                   },
                                 
                                  text: "Find",
                                  height: 30,
                                  width: 100,
                                  style:
                                      TextStyle(color: AppColors.primaryWhiteColor),
                                );
                              }
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                child: pharmacyState.fetchingPharmaciesPreview == 2
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            pharmacyState.allPharmacyPreviews.length,
                            (index) => Container(
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => DrugDashboard());
                                },
                                child: PharmacyCard(
                                    pharmacyName:pharmacyState.allPharmacyPreviews[index].name  ?? "Top up pharmacy ",
                                    location:pharmacyState.allPharmacyPreviews[index].city  ??  "Spintex",
                                    address:pharmacyState.allPharmacyPreviews[index].address  ??  "Accra",
                                    country: "Ghana",
                                    logo: pharmacyState.allPharmacyPreviews[index].logo ?? "",),
                              ),
                            ),
                          ),
                        ))
                    : pharmacyState.fetchingPharmaciesPreview == 3
                        ? Center(
                            child: GestureDetector(
                              onTap: () {
                                pharmacyState.fetchPharmaciesPreview(
                                  token: userState.userInfo?['token'],
                                );
                              },
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.replay_outlined,
                                  size: 30,
                                  color: AppColors.primaryDeepColor,
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: AppColors.primaryDeepColor,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: Image.asset("assets/images/filter.png",
                            color:
                                AppColors.primaryBlackColor.withOpacity(.50)),
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
                child:pharmacyState.fetchPopularDrugs == 2 ?  
                 GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (BuildContext context, int index) =>
                   Column(
                     children: [
                     
                       drugCard(
                        drugName: "Ibuprofen",
                        drugType: "Tablets",
                        quantity: 50,
                        price: 5.00,
                  ),
                     ],
                   ),
                ):pharmacyState.fetchPopularDrugs == 3
                        ? Center(
                            child: GestureDetector(
                              onTap: () {
                                pharmacyState.getPopularDrugs(
                                  token: userState.userInfo?['token'],
                                );
                              },
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: Icon(
                                  Icons.replay_outlined,
                                  size: 30,
                                  color: AppColors.primaryDeepColor,
                                ),
                              ),
                            ),
                          )
                        : Center(
                            child: SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                                color: AppColors.primaryDeepColor,
                              ),
                            ),
                          ),
              ),
              SizedBox(
                height: 35.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
