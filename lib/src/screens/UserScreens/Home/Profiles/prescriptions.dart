import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/app_state/cart_state.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/UploadPrescription.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/prescriptionResults.dart';
import 'package:ecentialsclone/src/screens/UserScreens/Home/MinuteClinic/Pharmacy/scanDocument.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Prescriptions extends StatefulWidget {
  const Prescriptions({Key? key}) : super(key: key);

  @override
  State<Prescriptions> createState() => _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      UserState userState = Provider.of<UserState>(context, listen: false);
      if (userState.prescriptions.isEmpty) {
        userState.fetchPrescriptions(token: userState.userInfo?['token']);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context);
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
        body: userState.prescriptions.isEmpty &&
                userState.fetchingPrescriptions == 2
            ? const Center(
                child: Text("Your uploaded prescriptions will appear here",
                    style: TextStyle(fontSize: 16)),
              )
            : userState.fetchingPrescriptions == 2 &&
                    userState.prescriptions.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
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
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: userState.prescriptions.length,
                          itemBuilder: (context, index) => userState
                                      .prescriptions[index].status ==
                                  1
                              ? InkWell(
                                  onTap: () {
                                    Get.to(() => PrescriptionResults(
                                        pres: userState.prescriptions[index]));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: .4,
                                                color: AppColors
                                                    .primaryBlackColor
                                                    .withAlpha(90)))),
                                    child: ListTile(
                                      leading: Image.network(
                                        userState.prescriptions[index].image,
                                        height: 64,
                                        width: 64,
                                        fit: BoxFit.cover,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              userState.prescriptions[index]
                                                  .store_id,
                                              style: TextStyle(fontSize: 18)),
                                          Text(userState
                                              .prescriptions[index].createdAt
                                              .toString()),
                                        ],
                                      ),
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
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: userState.prescriptions.length,
                          itemBuilder: (context, index) => userState
                                      .prescriptions[index].status ==
                                  0
                              ? InkWell(
                                  onTap: () {
                                    Get.to(() => PrescriptionResults(
                                          pres: userState.prescriptions[index],
                                        ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: .4,
                                                color: AppColors
                                                    .primaryBlackColor
                                                    .withAlpha(90)))),
                                    child: ListTile(
                                      leading: Image.network(
                                        userState.prescriptions[index].image,
                                        height: 64,
                                        width: 64,
                                        fit: BoxFit.cover,
                                      ),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              userState.prescriptions[index]
                                                  .store_id,
                                              style: TextStyle(fontSize: 18)),
                                          Text(userState
                                              .prescriptions[index].createdAt
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink()),
                    ],
                  ))
                : Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryDeepColor,
                  )));
  }
}
