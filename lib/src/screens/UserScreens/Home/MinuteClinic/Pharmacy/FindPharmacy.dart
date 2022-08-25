// ignore_for_file: unused_import, prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/app_state/pharmacy_state.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labDetails.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/drugDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanDocument.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class FindPharmacy extends StatefulWidget {
  const FindPharmacy({
    Key? key,
  }) : super(key: key);

  @override
  State<FindPharmacy> createState() => _FindPharmacyState();
}

class _FindPharmacyState extends State<FindPharmacy> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      PharmacyState pharmacyState =
          Provider.of<PharmacyState>(context, listen: false);
      UserState userState = Provider.of<UserState>(context, listen: false);
      if (pharmacyState.allPharmacyPreviews.isEmpty ||
          pharmacyState.fetchingPharmaciesPreview == 3) {
        await pharmacyState.fetchPharmaciesPreview(
          token: userState.userInfo?['token'],
        );
      }
    });
  }

  String? selectedMedType;
  String locDropdownValue = 'Ridge Venue, Accra';
  String disDropdownValue = '50 Kilometers';
  final searchTextController = TextEditingController();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      print("Not Enabled");
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ShowToast.ecentialsToast(
          message: "Location permissions are denied",
        );
        Navigator.of(context).pop();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ShowToast.ecentialsToast(
        message:
            "Please allow Ecentialls access to location services in your settings",
      );
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    PharmacyState pharmacyState = Provider.of<PharmacyState>(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        floatingActionButton: FloatingAmbulance(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: AppColors.primaryWhiteColor,
        appBar: AppBar(
            backgroundColor: AppColors.primaryWhiteColor,
            foregroundColor: AppColors.primaryBlackColor,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).disabledColor.withOpacity(.75),
                )),
            actions: [
              Container(
                margin: EdgeInsets.all(10),
                child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png")),
              ),
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Find Nearby Pharmacies",
                style: TextStyle(
                    color: AppColors.primaryBlackColor.withAlpha(190),
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Search(
                      controller: searchTextController,
                      onSubmitted: searchPharmacy,
                      width: width * .82,
                    )),
                    IconButton(
                      onPressed: () {
                        _showFilterBottomSheet(context);
                      },
                      icon: Container(
                        padding: const EdgeInsets.all(5.0),
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFF033A64),
                        ),
                        child: Icon(
                          Icons.tune_rounded,
                          size: 20,
                          color: AppColors.primaryWhiteColor,
                        ),
                      ),
                    ),
                  ]),
              if (pharmacyState.searchingPharmacies == 0 &&
                  pharmacyState.pharmacySearchResults.isEmpty)
                Container(
                  margin: EdgeInsets.only(top: 56, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Pharmacists",
                        style: TextStyle(
                            color: AppColors.primaryBlackColor.withAlpha(190),
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            color: const Color(0xFFCB3F04),
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
              pharmacyState.searchingPharmacies == 0 &&
                      pharmacyState.pharmacySearchResults.isEmpty &&
                      pharmacyState.allPharmacyPreviews.isEmpty
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text("Search for nearby pharmacies"),
                    ))
                  : pharmacyState.searchingPharmacies == 0 &&
                          pharmacyState.pharmacySearchResults.isEmpty &&
                          pharmacyState.allPharmacyPreviews.isNotEmpty &&
                          pharmacyState.fetchingPharmaciesPreview == 2
                      ? ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: pharmacyState.allPharmacyPreviews.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Wrap(
                                direction: Axis.vertical,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => DrugDashboard());
                                    },
                                    child: LabResultsCard(
                                        image: "assets/images/pharHome.png",
                                        labName: pharmacyState
                                            .allPharmacyPreviews[index].name,
                                        openingHours:
                                            "Weekdays | 7:00am - 5:00pm"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ))
                      : pharmacyState.searchingPharmacies == 2 &&
                              pharmacyState.pharmacySearchResults.isNotEmpty
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(top: 40),
                              shrinkWrap: true,
                              itemCount:
                                  pharmacyState.pharmacySearchResults.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Wrap(
                                direction: Axis.vertical,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => DrugDashboard());
                                    },
                                    child: LabResultsCard(
                                        image: "assets/images/pharHome.png",
                                        labName: pharmacyState
                                            .pharmacySearchResults[index].name,
                                        openingHours:
                                            "Weekdays | 7:00am - 5:00pm"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )
                          : pharmacyState.searchingPharmacies == 2 &&
                                  pharmacyState.pharmacySearchResults.isEmpty
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text("No pharmacy found"),
                                  ),
                                )
                              : pharmacyState.searchingPharmacies == 3
                                  ? Center(
                                      child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Text(
                                          "There was an error. Please try again."),
                                    ))
                                  : Center(
                                      child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 20.0),
                                          child: CircularProgressIndicator()),
                                    ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ));
  }

  Future searchPharmacy({bool filter = false}) async {
    final Position pos = filter
        ? await _determinePosition()
        : Position(
            longitude: 0,
            latitude: 0,
            timestamp: DateTime(2002),
            accuracy: 100,
            altitude: 0,
            heading: 0,
            speed: 0,
            speedAccuracy: 100);
    PharmacyState pharmacyState =
        Provider.of<PharmacyState>(context, listen: false);
    UserState userState = Provider.of<UserState>(context, listen: false);
    Map<String, dynamic> _searchParams = filter
        ? {
            "search_text": searchTextController.value.text,
            "user_latitude": pos.latitude,
            "user_longitude": pos.longitude
          }
        : {"search_text": searchTextController.value.text};
    searchTextController.value.text.isEmpty && filter == false
        ? pharmacyState.clearSearch()
        : await pharmacyState.searchForPharmacy(
            searchParams: _searchParams,
            token: userState.userInfo?['token'],
            filter: filter);
  }

  void _showFilterBottomSheet(BuildContext ctx) {
    Size size = MediaQuery.of(context).size;
    PharmacyState pharmacyState =
        Provider.of<PharmacyState>(context, listen: false);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        isScrollControlled: true,
        elevation: 2,
        isDismissible: true,
        enableDrag: true,
        backgroundColor: AppColors.primaryWhiteColor,
        context: ctx,
        builder: (ctx) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) => Container(
              padding: EdgeInsets.all(20),
              height: size.height * .6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                        width: 60,
                        height: 4.5,
                        decoration: BoxDecoration(
                            color: AppColors.primaryBlackColor.withAlpha(70),
                            borderRadius: BorderRadius.circular(9999))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0, bottom: 20.0),
                    child: Text(
                      "Location",
                      style: TextStyle(
                          color: AppColors.primaryBlackColor.withAlpha(190),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(-.5, .5),
                              color: AppColors.primaryGrayColor.withAlpha(100),
                              blurRadius: 5,
                              spreadRadius: 3,
                            ),
                            BoxShadow(
                              offset: Offset(.5, -.5),
                              color: AppColors.primaryGrayColor.withAlpha(100),
                              blurRadius: 5,
                              spreadRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.rect(),
                          depth: -5,
                          lightSource: LightSource.top,
                          color: Colors.white.withOpacity(.10),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: locDropdownValue,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                EcentialsIcons.mic,
                                color:
                                    AppColors.primaryDeepColor.withAlpha(180),
                              ),
                              border: InputBorder.none),
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          iconSize: 24,
                          elevation: 1,
                          style: TextStyle(
                              color:
                                  AppColors.primaryBlackColor.withAlpha(190)),
                          onChanged: (String? newValue) {
                            setState(() {
                              locDropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Ridge Venue, Accra',
                            'Ayensu, UCC',
                            'Kukurantumi',
                            'Seattle'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Medicine Types",
                          style: TextStyle(
                              color: AppColors.primaryBlackColor.withAlpha(190),
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Icon(
                          Icons.compare_arrows_rounded,
                          color: AppColors.primaryDeepColor,
                        )
                      ],
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 4.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: <String>[
                      "Tablet",
                      "Oral",
                      "Liquid",
                      "Injection",
                      "Capsule",
                      "Inhaler",
                      "Cream",
                      "Drops",
                      "Implants"
                    ].map<Widget>((String value) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedMedType = value;
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: selectedMedType == value
                                    ? AppColors.primaryDeepColor
                                    : AppColors.primaryGrayColor),
                            child: Center(
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: selectedMedType == value
                                        ? AppColors.primaryWhiteColor
                                        : AppColors.primaryBlackColor
                                            .withAlpha(200)),
                              ),
                            )),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0, bottom: 20.0),
                    child: Text(
                      "Distance",
                      style: TextStyle(
                          color: AppColors.primaryBlackColor.withAlpha(190),
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(-.5, .5),
                              color: AppColors.primaryGrayColor.withAlpha(100),
                              blurRadius: 5,
                              spreadRadius: 3,
                            ),
                            BoxShadow(
                              offset: Offset(.5, -.5),
                              color: AppColors.primaryGrayColor.withAlpha(100),
                              blurRadius: 5,
                              spreadRadius: 3,
                            )
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.rect(),
                          depth: -5,
                          lightSource: LightSource.top,
                          color: Colors.white.withOpacity(.10),
                        ),
                        child: DropdownButtonFormField<String>(
                          value: disDropdownValue,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                EcentialsIcons.locations,
                                color:
                                    AppColors.primaryDeepColor.withAlpha(180),
                              ),
                              border: InputBorder.none),
                          icon: const Icon(Icons.arrow_drop_down_rounded),
                          iconSize: 24,
                          elevation: 1,
                          style: TextStyle(
                              color:
                                  AppColors.primaryBlackColor.withAlpha(190)),
                          onChanged: (String? newValue) {
                            setState(() {
                              disDropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            '50 Kilometers',
                            '100 Kilometers',
                            '150 Kilometers',
                            '200 Kilometers',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Button(
                                onTap: () async {
                                  Navigator.of(context).pop();
                                  await searchPharmacy(filter: true);
                                },
                                text: "Show Results",
                                style: TextStyle(
                                    color: AppColors.primaryWhiteColor))),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                locDropdownValue = "Ridge Venue, Accra";
                                disDropdownValue = "50 Kilometers";
                                selectedMedType = "";
                                searchTextController.clear();
                              });
                              Navigator.of(context).pop();
                              pharmacyState.clearSearch();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text("Clear",
                                  style: TextStyle(
                                      color: AppColors.primaryDeepColor)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
