// ignore_for_file: unused_import, prefer_const_constructors

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
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Lab/labDetails.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/drugDashboard.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanDocument.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class FindDrug extends StatefulWidget {
  const FindDrug({
    Key? key,
  }) : super(key: key);

  @override
  State<FindDrug> createState() => _FindDrugState();
}

class _FindDrugState extends State<FindDrug> {
  @override
  Widget build(BuildContext context) {
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
            searchPressed: () {},
            micPressed: () {},
            width: MediaQuery.of(context).size.width,
            text: "Biotin ",
          ),
          centerTitle: true,
        ),
      ),
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
                  height: 17,
                  width: 300,
                  margin: const EdgeInsets.only(
                    top: 63,
                    left: 20, // left: 24.78
                  ),
                  child: Text(
                    "You can find this item in these pharmacies",
                    style: TextStyle(
                        color: AppColors.primaryBlackColor,
                        fontWeight: FontWeight.w200,
                        fontSize: 14),
                  ),
                ),

             SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 250.0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => Container(
                        margin: EdgeInsets.only(
                          right: 5,
                        ),
                        child: InkWell(
                          onTap: () {
                          },
                          child:
                            FindPharmacyCard(
                    image:  
                  "assets/images/view.png", 
                  pharName: 'Unicom Pharmacy', 
                  kilo: '2km away',)
                  ),
                        ),
                      ),
                
        
                  ),
                ),
             ),

             Container(
                  height: 17,
                  width: 100,
                  margin: const EdgeInsets.only(
                    top: 30,
                    left: 26, // left: 24.78
                  ),
                  child: Text(
                    "Search results",
                    style: TextStyle(
                        color: AppColors.primaryBlackColor,
                        fontWeight: FontWeight.w200,
                        fontSize: 14),
                  ),
             ),
  

      SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (BuildContext context, int index) => drugCard(
                    drugName: "Ibuprofen",
                    drugType: "Tablets",
                    quantity: 50,
                    price: 5.00,
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
                 
              ],
            )
            ),
      ),
    );
  }
}
