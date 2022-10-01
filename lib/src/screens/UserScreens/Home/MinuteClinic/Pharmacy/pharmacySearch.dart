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
  List searches = [];

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
      await handleSearch();
    });
    super.initState();
  }

  handleSearch() async {
    PharmacyState pharmacyState =
        Provider.of<PharmacyState>(context, listen: false);
    UserState userState = Provider.of<UserState>(context, listen: false);
    await pharmacyState.searchForPharmacy(
        token: userState.userInfo?['token'],
        searchParams: {"search_text": controller.text});
    await pharmacyState.searchForDrug(
        token: userState.userInfo?['token'],
        searchParams: {"search_text": controller.text});
    if (pharmacyState.searchingPharmacies == 2 &&
        pharmacyState.pharmacySearchResults.isNotEmpty &&
        pharmacyState.searchingDrugs == 2 &&
        pharmacyState.generalDrugSearchResults.isNotEmpty) {
      setState(() {
        searches = addResults();
      });
    }
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
            await handleSearch();
          },
          micPressed: () {},
          width: MediaQuery.of(context).size.width,
          text: "Search for pharmacies and drugs",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, bottom: 120),
              child: pharmacyState.searchingPharmacies == 1 &&
                      pharmacyState.pharmacySearchResults.isEmpty &&
                      pharmacyState.generalDrugSearchResults.isEmpty &&
                      pharmacyState.searchingDrugs == 1
                  ? Center(
                      child: Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: CircularProgressIndicator(
                              color: AppColors.primaryDeepColor)),
                    )
                  : pharmacyState.searchingPharmacies == 0 &&
                          pharmacyState.pharmacySearchResults.isEmpty &&
                          pharmacyState.generalDrugSearchResults.isEmpty &&
                          pharmacyState.searchingDrugs == 0
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text("Enter a search term"),
                        ))
                      : pharmacyState.searchingPharmacies == 2 &&
                              pharmacyState.pharmacySearchResults.isEmpty &&
                              pharmacyState.searchingDrugs == 2 &&
                              pharmacyState.generalDrugSearchResults.isEmpty
                          ? const Center(
                              child: Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Text("No pharmacy or drug found"),
                              ),
                            )
                          : pharmacyState.searchingPharmacies == 2 &&
                                  pharmacyState.searchingDrugs == 2 &&
                                  searches.isNotEmpty
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(top: 40),
                                  shrinkWrap: true,
                                  itemCount: searches.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return searches[index]?.type == "pharmacy"
                                        ? Wrap(
                                            direction: Axis.vertical,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(() => DrugDashboard(
                                                        pharmacy:
                                                            searches[index],
                                                      ));
                                                },
                                                child: LabResultsCard(
                                                    image:
                                                        "assets/images/pharHome.png",
                                                    labName:
                                                        searches[index].name,
                                                    openingHours:
                                                        "Weekdays | 7:00am - 5:00pm"),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                  () => DrugDetails(
                                                      details: searches[index]),
                                                );
                                              },
                                              child: DrugCard(
                                                  drugName:
                                                      searches[index].name ??
                                                          "Ibuprofen",
                                                  drugType: searches[index]
                                                          .dosage_form ??
                                                      "Tablet",
                                                  quantity: searches[index]
                                                          .quantity ??
                                                      50,
                                                  price: searches[index]
                                                          .prize
                                                          .toDouble() ??
                                                      0.00),
                                            ),
                                          );
                                  })
                              : pharmacyState.searchingPharmacies == 3 &&
                                      pharmacyState.searchingDrugs == 3
                                  ? const Center(
                                      child: Padding(
                                      padding: EdgeInsets.only(top: 20.0),
                                      child: Text(
                                          "There was an error. Please try again."),
                                    ))
                                  : Center(
                                      child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 20.0),
                                          child: CircularProgressIndicator(
                                              color:
                                                  AppColors.primaryDeepColor)),
                                    ),
            ),
          ],
        ),
      ),
    );
  }

  addResults() {
    PharmacyState pharmacyState =
        Provider.of<PharmacyState>(context, listen: false);
    var res = [];
    var pharms = [...pharmacyState.pharmacySearchResults];
    var drugs = [...pharmacyState.generalDrugSearchResults];
    int length = drugs.length;
    while (drugs.isNotEmpty) {
      res.add(drugs.removeAt(0));
      if (pharms.isNotEmpty) {
        res.add(pharms.removeAt(0));
      }
    }
    res.addAll(pharms);
    return res;
  }
}
