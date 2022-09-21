// ignore_for_file: unused_import, prefer_const_constructors

import 'package:ecentialsclone/models/PopularDrugs.dart';
import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/FindPharmacyCard.dart';
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
import 'package:ecentialsclone/src/screens/UserScreens/Store/drugDetails.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FindDrug extends StatefulWidget {
  FindDrug({
    Key? key,
    this.searchTerm = "",
  }) : super(key: key);
  String searchTerm;
  @override
  State<FindDrug> createState() => _FindDrugState();
}

class _FindDrugState extends State<FindDrug> {
  final controller = TextEditingController();
  bool searching = false;
  List<PopularPharmacy> searchResults = [];
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      if (widget.searchTerm.isEmpty) return;
      setState(() {
        controller.text = widget.searchTerm;
        searching = true;
      });
      PharmacyState pharmacyState =
          Provider.of<PharmacyState>(context, listen: false);
      UserState userState = Provider.of<UserState>(context, listen: false);
      await pharmacyState.searchForDrug(
          token: userState.userInfo?['token'],
          searchParams: {"search_text": widget.searchTerm});
      setState(() {
        searching = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PharmacyState pharmacyState = Provider.of<PharmacyState>(context);
    UserState userState = Provider.of<UserState>(context);
    return Scaffold(
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
        bottom: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          elevation: 0,
          title: Search4(
            controller: controller,
            searchPressed: () async {
              if (controller.text.trim().isEmpty) return;
              setState(() {
                searching = true;
              });
              await pharmacyState.searchForDrug(
                  token: userState.userInfo?['token'],
                  searchParams: {"search_text": controller.text.trim()});
              setState(() {
                searching = false;
              });
            },
            micPressed: () {},
            width: MediaQuery.of(context).size.width,
            text: "Search for drugs",
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(
                height: 14.0,
              ),
              searching == false &&
                      pharmacyState.generalDrugSearchResults.isNotEmpty &&
                      pharmacyState.searchingDrugs == 2
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: pharmacyState.generalDrugSearchResults.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                                details: pharmacyState
                                    .generalDrugSearchResults[index]),
                          );
                        },
                        child: DrugCard(
                            drugName: pharmacyState
                                    .generalDrugSearchResults[index].name ??
                                "Ibuprofen",
                            drugType: pharmacyState
                                    .generalDrugSearchResults[index]
                                    .dosage_form ??
                                "Tablet",
                            quantity: pharmacyState
                                    .generalDrugSearchResults[index].quantity ??
                                50,
                            price: pharmacyState
                                    .generalDrugSearchResults[index].prize
                                    .toDouble() ??
                                0.00),
                      ),
                    )
                  : searching == true
                      ? Center(
                          child: CircularProgressIndicator(
                              color: AppColors.primaryDeepColor),
                        )
                      : searching == false &&
                              pharmacyState.generalDrugSearchResults.isEmpty &&
                              pharmacyState.searchingDrugs == 2
                          ? Center(
                              child: Text("No search results"),
                            )
                          : pharmacyState.generalDrugSearchResults.isEmpty &&
                                  pharmacyState.searchingDrugs == 3
                              ? const Center(
                                  child: Text(
                                      "There was an error. Please try again"),
                                )
                              : Center(
                                  child: Text("Search for drugs"),
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
