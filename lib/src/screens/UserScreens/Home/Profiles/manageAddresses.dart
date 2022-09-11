import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/Profiles/diliveryAddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageAddress extends StatefulWidget {
  const ManageAddress({Key? key}) : super(key: key);

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  final List<Map<String, dynamic>> addresses = [
    {
      "name": "Kwabena Gyasi",
      "mobile": "+233 248 555 678",
      "street": "Kpodo St",
      "town": "Nelo",
      "district": "Kyerepone",
      "region": "Savanah",
      "primary": true
    },
    {
      "name": "Kofi Kofi",
      "mobile": "+233 244 444 444",
      "street": "Nuckemborough St",
      "town": "George Town",
      "district": "Wihensky",
      "region": "Eastern",
      "primary": false
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
          leading: const BackButton(),
          title: Text("Dilivery Addresses",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryBlackColor.withAlpha(180))),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => DiliveryAddress());
                },
                icon: Icon(Icons.add,
                    size: 32, color: AppColors.primaryDeepColor))
          ],
        ),
        body: SingleChildScrollView(
            child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: addresses.length,
          itemBuilder: ((context, index) => ListTile(
                onTap: () {
                  Get.to(() => DiliveryAddress(address: addresses[index]));
                },
                minVerticalPadding: 20,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${addresses[index]["name"]},",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    Text(
                      "${addresses[index]["street"]}, ${addresses[index]["town"]}, ${addresses[index]["district"]}, ${addresses[index]["region"]}, GH",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                trailing: addresses[index]["primary"]
                    ? Icon(Icons.check_circle_rounded,
                        color: AppColors.primaryGreenColor, size: 36)
                    : SizedBox.shrink(),
              )),
        )));
  }
}
