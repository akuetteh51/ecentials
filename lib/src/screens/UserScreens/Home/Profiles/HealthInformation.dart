// ignore_for_file: prefer_const_constructors

import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/information.dart';
import 'package:ecentialsclone/src/app_state/Health_Info_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app_state/user_state.dart';
import 'edit-health-data.dart';

class HealthInformation extends StatefulWidget {
  const HealthInformation({Key? key}) : super(key: key);

  @override
  State<HealthInformation> createState() => _HealthInformationState();
}

class _HealthInformationState extends State<HealthInformation> {
  final _heading = [
    "BLOOD GROUP",
    "GENOTYPE",
    "ALERGIES",
    "MEDICAL ID NUMBER",
    "PULSE RATE",
    "RESPIRATION RATE",
    "BLOOD PRESSURE",
    "TEMPERATURE",
  ];
  final _text = [
    "O RhD positive(O+)",
    "AA",
    "Cats, Pepper",
    "EC4744643",
    "200 bpm",
    "80 bpm",
    "40mm HG",
    "35.6 C",
  ];

  getHealthData() {
    UserState userState = Provider.of<UserState>(context, listen: false);
    HealthInformationState healthInformationState =
        Provider.of<HealthInformationState>(context, listen: false);
    healthInformationState.fetchHealthDetails(
        token: userState.userInfo?['token'], callback: () {});
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      getHealthData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HealthInformationState healthInformationState =
        Provider.of<HealthInformationState>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        title: const Text(
          "Health Information",
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black54,
          ),
        ),
        elevation: 0,
        // actions: [],
      ),
      // bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (builder) => EditHealthData()));
        },
        child: Icon(
          Icons.edit,
          color: Theme.of(context).canvasColor,
        ),
        backgroundColor: AppColors.primaryDeepColor,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        margin: EdgeInsets.all(20),
        child: healthInformationState.fetchingHealthInfoState == 2
            ? ListView.builder(
                itemCount: _heading.length,
                itemBuilder: (context, index) => Information(
                  heading: _heading[index],
                  text: _text[index],
                ),
              )
            : healthInformationState.fetchingHealthInfoState == 0 ||
                    healthInformationState.fetchingHealthInfoState == 1
                ? Center(
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primaryDeepColor)),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      getHealthData();
                    },
                    child: Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.replay,
                          color: AppColors.primaryDeepColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
