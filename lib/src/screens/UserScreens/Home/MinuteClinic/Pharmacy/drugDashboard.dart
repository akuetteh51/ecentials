// ignore_for_file: unused_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Themes/ecentials_icons_icons.dart';
import 'package:ecentialsclone/src/Widgets/bottomNavBar.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/Widgets/drugCard.dart';
import 'package:ecentialsclone/src/Widgets/floatingAmbulance.dart';
import 'package:ecentialsclone/src/Widgets/schedulesCard.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/Widgets/searchForh.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanResults.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanDocument.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class DrugDashboard extends StatefulWidget {
  const DrugDashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<DrugDashboard> createState() => _DrugDashboardState();
}

class _DrugDashboardState extends State<DrugDashboard> {
  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          "The MediShop Pharmacy",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 39.78, top: 0, right: 24.67),
            child: IconButton(
              onPressed: () {
                Get.to(() => ScanDocument());
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
            searchPressed: () {},
            micPressed: () {},
            width: MediaQuery.of(context).size.width,
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
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
                  icon: Image.asset(
                    "assets/images/filter.png",
                    color: AppColors.primaryBlackColor.withOpacity(.80),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: height * 0.5,
              width: width,
              child: GridView.builder(
                itemCount: 6,
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
        ),
      ),
    );
  }
}
