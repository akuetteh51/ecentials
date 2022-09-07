import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/prescriptionResults.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Prescriptions extends StatefulWidget {
  const Prescriptions({Key? key}) : super(key: key);

  @override
  State<Prescriptions> createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
  final List<Map<String, dynamic>> pres = [
    {
      "image": "assets/images/dr_pres2.png",
      "title": "Sunday 12th August, 2022",
      "responded": true
    },
    {
      "image": "assets/images/dr_pres1.png",
      "title": "Tuesday 12th August, 2022",
      "responded": false
    },
    {
      "image": "assets/images/dr_pres2.png",
      "title": "Monday 12th August, 2022",
      "responded": false
    },
    {
      "image": "assets/images/dr_pres1.png",
      "title": "Thursday 12th August, 2022",
      "responded": true
    },
    {
      "image": "assets/images/dr_pres2.png",
      "title": "Sunday 12th August, 2022",
      "responded": true
    },
    {
      "image": "assets/images/dr_pres1.png",
      "title": "Monday 22nd August, 2022",
      "responded": false
    },
    {
      "image": "assets/images/dr_pres2.png",
      "title": "Sunday 12th August, 2022",
      "responded": true
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
        title: Text("Prescriptions",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryBlackColor.withAlpha(180))),
      ),
      body: SingleChildScrollView(
          child: pres.isEmpty
              ? const Center(
                  child: Text("Your uploaded prescriptions will appear here"),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: .4,
                                        color: AppColors.primaryBlackColor
                                            .withAlpha(180)))),
                            child: Text("Responded",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryBlackColor
                                        .withAlpha(180))),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pres.length,
                        itemBuilder: (context, index) => pres[index]
                                    ["responded"] ==
                                true
                            ? InkWell(
                                onTap: () {
                                  Get.to(() => const PrescriptionResults());
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: .4,
                                              color: AppColors.primaryBlackColor
                                                  .withAlpha(90)))),
                                  child: ListTile(
                                    leading: Image.asset(pres[index]["image"]),
                                    title: Text(pres[index]["title"]),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()),
                    const SizedBox(
                      height: 42,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: .4,
                                        color: AppColors.primaryBlackColor
                                            .withAlpha(90)))),
                            child: Text("Not Responded",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryBlackColor
                                        .withAlpha(180))),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: pres.length,
                        itemBuilder: (context, index) => pres[index]
                                    ["responded"] ==
                                false
                            ? InkWell(
                                onTap: () {
                                  Get.to(() => const PrescriptionResults());
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: .4,
                                              color: AppColors.primaryBlackColor
                                                  .withAlpha(90)))),
                                  child: ListTile(
                                    leading: Image.asset(pres[index]["image"]),
                                    title: Text(pres[index]["title"]),
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()),
                  ],
                )),
    );
  }
}
