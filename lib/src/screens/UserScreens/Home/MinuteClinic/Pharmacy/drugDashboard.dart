// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/models/AllPharmaciePreview.dart';
import 'package:ecentialsclone/models/PopularDrugs.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/app_state/pharmacy_state.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanDocument.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/drugDetails.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class DrugDashboard extends StatefulWidget {
  DrugDashboard({Key? key, required this.pharmacy}) : super(key: key);
  AllPharmaciesPreview pharmacy;

  @override
  State<DrugDashboard> createState() => _DrugDashboardState();
}

class _DrugDashboardState extends State<DrugDashboard> {
  bool searching = false;
  final searchController = TextEditingController();
  List<PopularPharmacy> searchResults = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      PharmacyState pharmacyState =
          Provider.of<PharmacyState>(context, listen: false);
      UserState userState = Provider.of<UserState>(context, listen: false);
      // pharmacyState.fetchPharmaciesPreview(
      //   token: userState.userInfo?['token'],
      // );

      if (pharmacyState.fetchPopularDrugs != 2 ||
          pharmacyState.allPopularDrugs.isEmpty) {
        pharmacyState.getPopularDrugs(
          token: userState.userInfo?['token'],
        );
      }

      // prevent showing wrong loading indicator
      pharmacyState.setPharmyBookmarkingIndexToEmpty();
    });
  }

  @override
  Widget build(BuildContext context) {
    PharmacyState pharmacyState = Provider.of<PharmacyState>(context);
    UserState userState = Provider.of<UserState>(
      context,
    );
    AllPharmaciesPreview pharmacy = widget.pharmacy;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
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
          ),
        ),
        title: Text(
          pharmacy.name ?? "The MediShop Pharmacy",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 39.78, top: 0, right: 24.67),
            child: IconButton(
              onPressed: () {
                Get.to(() => ScanDocument(
                      store_id: pharmacy.id!,
                    ));
              },
              icon: Icon(EcentialsIcons.scan_cam),
            ),
          ),
        ],
        bottom: AppBar(
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Search(
            controller: searchController,
            micPressed: () {},
            onSubmitted: () async {
              setState(() {
                searching = true;
                searchResults = [];
              });
              final res = await pharmacyState.searchForDrugInPharmacy(
                  token: userState.userInfo?['token'],
                  searchParams: {
                    "search_text": searchController.text,
                    "store_id": pharmacy.id
                  });
              setState(() {
                searchResults = res;
                searching = false;
              });
            },
            width: MediaQuery.of(context).size.width,
          ),
          centerTitle: true,
        ),
      ),
      body: searchResults.isEmpty && searching == false
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.30,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlueColor.withOpacity(.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: width - 55 / 0.25,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "We will deliver your medicines",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Button(
                                    width: width - 55 / 0.20,
                                    height: 40,
                                    text: "Catalog",
                                    style: TextStyle(
                                      color: AppColors.primaryWhiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                "assets/images/delivery_guy.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.trending_up_rounded))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // SizedBox(
                    // height: height * 0.5,
                    // width: width,
                    // child:
                    pharmacyState.allPopularDrugs.isEmpty
                        ? SizedBox.shrink()
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: pharmacyState.allPopularDrugs.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              mainAxisExtent: 200,
                            ),
                            itemBuilder: (BuildContext context, int index) =>
                                GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => DrugDetails(
                                      details:
                                          pharmacyState.allPopularDrugs[index]),
                                );
                              },
                              child: DrugCard(
                                drugName:
                                    pharmacyState.allPopularDrugs[index].name ??
                                        "Drug",
                                drugType: pharmacyState
                                        .allPopularDrugs[index].dosage_form ??
                                    "Tablet",
                                quantity: pharmacyState
                                        .allPopularDrugs[index].quantity ??
                                    1,
                                price: pharmacyState
                                        .allPopularDrugs[index].prize
                                        .toDouble() ??
                                    0.00,
                              ),
                            ),
                          ),
                    // ),
                    SizedBox(
                      height: 35.0,
                    ),
                  ],
                ),
              ),
            )
          : searchResults.isNotEmpty && searching == false
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: searchResults.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            mainAxisExtent: 200,
                          ),
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                            onTap: () {
                              Get.to(
                                () =>
                                    DrugDetails(details: searchResults[index]),
                              );
                            },
                            child: DrugCard(
                              drugName: searchResults[index].name ?? "Drug",
                              drugType:
                                  searchResults[index].dosage_form ?? "Tablet",
                              quantity: searchResults[index].quantity ?? 1,
                              price:
                                  searchResults[index].prize.toDouble() ?? 0.00,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryDeepColor,
                )),
    );
  }
}
