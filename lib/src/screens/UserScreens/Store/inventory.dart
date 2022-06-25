import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/druglisttile.dart';
import 'package:ecentialsclone/src/Widgets/search.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Store/drugDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  final _inventory = [
    {
      "image": "assets/images/aceta.png",
      "title": "Acetaminophen",
      "subtitle": "250mmg",
    },
    {
      "image": "assets/images/apalu.png",
      "title": "Apalutamide",
      "subtitle": "500mmg",
    },
    {
      "image": "assets/images/saxenda.png",
      "title": "Saxenda",
      "subtitle": "1000mmg",
    },
    {
      "image": "assets/images/aceta.png",
      "title": "Acetaminophen",
      "subtitle": "250mmg",
    },
    {
      "image": "assets/images/apalu.png",
      "title": "Apalutamide",
      "subtitle": "500mmg",
    },
    {
      "image": "assets/images/saxenda.png",
      "title": "Saxenda",
      "subtitle": "1000mmg",
    },
    {
      "image": "assets/images/aceta.png",
      "title": "Acetaminophen",
      "subtitle": "250mmg",
    },
    {
      "image": "assets/images/apalu.png",
      "title": "Apalutamide",
      "subtitle": "500mmg",
    },
    {
      "image": "assets/images/saxenda.png",
      "title": "Saxenda",
      "subtitle": "1000mmg",
    },
    {
      "image": "assets/images/saxenda.png",
      "title": "Saxenda",
      "subtitle": "1000mmg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        title: const Text("Inventory"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/Pharmacystore.png",
            ),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        bottom: AppBar(
          toolbarHeight: 70,
          backgroundColor: AppColors.primaryWhiteColor,
          foregroundColor: AppColors.primaryBlackColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Search(
            text: "Enter your search item here...",
            width: MediaQuery.of(context).size.width,
            searchPressed: () {},
            micPressed: () {},
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
            bottom: 20,
          ),
          child: Column(
            children: List.generate(
              _inventory.length,
              (index) => DrugListTile(
                onTap: () {
                  Get.to(
                    () => DrugDetails(),
                  );
                },
                image: _inventory[index]["image"],
                title: _inventory[index]["title"],
                subtitle: _inventory[index]["subtitle"],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
