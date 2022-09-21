import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/labResultsCard.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/app_state/pharmacy_state.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/drugDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/drugDetails.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PharmacySearch extends StatefulWidget {
  PharmacySearch({
    Key? key,
    this.searchTerm = "",
  }) : super(key: key);
  String searchTerm;
  @override
  State<PharmacySearch> createState() => _PharmacySearchState();
}

class _PharmacySearchState extends State<PharmacySearch> {
  final controller = TextEditingController();
  final _searchTypeController = PageController();

  // bool searching = false;
  int _searchType = 0;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      if (widget.searchTerm.isEmpty) return;
      setState(() {
        controller.text = widget.searchTerm;
        // searching = true;
      });
      PharmacyState pharmacyState =
          Provider.of<PharmacyState>(context, listen: false);
      UserState userState = Provider.of<UserState>(context, listen: false);
      pharmacyState.searchForPharmacy(
          token: userState.userInfo?['token'],
          searchParams: {"search_text": widget.searchTerm});
      pharmacyState.searchForDrug(
          token: userState.userInfo?['token'],
          searchParams: {"search_text": widget.searchTerm});
      // setState(() {
      // searching = false;
      // });
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
          leading: BackButton(
            color: Theme.of(context).disabledColor.withOpacity(.75),
          ),
          title: Search4(
            controller: controller,
            searchPressed: () async {
              if (controller.text.trim().isEmpty) return;
              pharmacyState.searchForPharmacy(
                  token: userState.userInfo?['token'],
                  searchParams: {"search_text": controller.text.trim()});
              pharmacyState.searchForDrug(
                  token: userState.userInfo?['token'],
                  searchParams: {"search_text": controller.text.trim()});
            },
            micPressed: () {},
            width: MediaQuery.of(context).size.width,
            text: "Search for pharmacies and drugs",
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                child: GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 6,
                    crossAxisSpacing: 8,
                  ),
                  children: [
                    InkWell(
                      onTap: () {
                        if (_searchType == 0) return;
                        _searchTypeController.animateToPage(0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            "Pharmacies",
                            style: TextStyle(
                                fontSize: 16,
                                color: _searchType == 0
                                    ? AppColors.primaryCheckoutLevelTextColor
                                    : const Color.fromRGBO(144, 152, 177, 1)),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: _searchType == 0
                                ? AppColors.primaryCheckoutLevelButtonColor
                                : AppColors.primaryGrayColor),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_searchType == 1) return;
                        _searchTypeController.animateToPage(1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      child: Container(
                        child: Center(
                          child: Text(
                            "Drugs",
                            style: TextStyle(
                                fontSize: 16,
                                color: _searchType == 1
                                    ? AppColors.primaryCheckoutLevelTextColor
                                    : const Color.fromRGBO(144, 152, 177, 1)),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            color: _searchType == 1
                                ? AppColors.primaryCheckoutLevelButtonColor
                                : AppColors.primaryGrayColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 120),
                  child: PageView(
                      controller: _searchTypeController,
                      onPageChanged: (int page) => setState(() {
                            _searchType = page;
                          }),
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        pharmacyState.searchingPharmacies == 0 &&
                                pharmacyState.pharmacySearchResults.isEmpty
                            ? Center(
                                child: Container(
                                    margin: const EdgeInsets.only(top: 20.0),
                                    child: CircularProgressIndicator(
                                        color: AppColors.primaryDeepColor)),
                              )
                            : pharmacyState.searchingPharmacies == 0 &&
                                    pharmacyState.pharmacySearchResults.isEmpty
                                ? const Center(
                                    child: Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: Text("Search for pharmacies"),
                                  ))
                                : pharmacyState.searchingPharmacies == 2 &&
                                        pharmacyState
                                            .pharmacySearchResults.isNotEmpty
                                    ? ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.only(top: 40),
                                        shrinkWrap: true,
                                        itemCount: pharmacyState
                                            .pharmacySearchResults.length,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Wrap(
                                          direction: Axis.vertical,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.to(() => DrugDashboard(
                                                      pharmacy: pharmacyState
                                                              .pharmacySearchResults[
                                                          index],
                                                    ));
                                              },
                                              child: LabResultsCard(
                                                  image:
                                                      "assets/images/pharHome.png",
                                                  labName: pharmacyState
                                                      .pharmacySearchResults[
                                                          index]
                                                      .name,
                                                  openingHours:
                                                      "Weekdays | 7:00am - 5:00pm"),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      )
                                    : pharmacyState.searchingPharmacies == 2 &&
                                            pharmacyState
                                                .pharmacySearchResults.isEmpty
                                        ? const Center(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(top: 20.0),
                                              child: Text("No pharmacy found"),
                                            ),
                                          )
                                        : pharmacyState.searchingPharmacies == 3
                                            ? const Center(
                                                child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 20.0),
                                                child: Text(
                                                    "There was an error. Please try again."),
                                              ))
                                            : Center(
                                                child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            top: 20.0),
                                                    child: CircularProgressIndicator(
                                                        color: AppColors
                                                            .primaryDeepColor)),
                                              ),
                        pharmacyState.generalDrugSearchResults.isNotEmpty &&
                                pharmacyState.searchingDrugs == 2
                            ? GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: pharmacyState
                                    .generalDrugSearchResults.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  mainAxisExtent: 200,
                                ),
                                itemBuilder:
                                    (BuildContext context, int index) =>
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
                                              .generalDrugSearchResults[index]
                                              .name ??
                                          "Ibuprofen",
                                      drugType: pharmacyState
                                              .generalDrugSearchResults[index]
                                              .dosage_form ??
                                          "Tablet",
                                      quantity: pharmacyState
                                              .generalDrugSearchResults[index]
                                              .quantity ??
                                          50,
                                      price: pharmacyState
                                              .generalDrugSearchResults[index]
                                              .prize
                                              .toDouble() ??
                                          0.00),
                                ),
                              )
                            : pharmacyState.searchingDrugs == 1
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.primaryDeepColor),
                                  )
                                : pharmacyState
                                            .generalDrugSearchResults.isEmpty &&
                                        pharmacyState.searchingDrugs == 2
                                    ? const Center(
                                        child: Text("No search results"),
                                      )
                                    : pharmacyState.generalDrugSearchResults
                                                .isEmpty &&
                                            pharmacyState.searchingDrugs == 3
                                        ? const Center(
                                            child: Text(
                                                "There was an error. Please try again"),
                                          )
                                        : const Center(
                                            child: Text("Search for drugs"),
                                          ),
                      ])),
            ),
          ],
        ));
  }
}
