import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Themes/colors.dart';
import '../../../../Widgets/EcentialsToast.dart';
import '../../../../Widgets/button.dart';
import '../../../../app_state/Health_Info_state.dart';

class EditHealthData extends StatefulWidget {
  final String bloodGroup;
  final List alergies;
  final String pulseRate;
  final String bloodPressure;
  final String temperature;
  final String nhis;

  const EditHealthData(
      {Key? key,
      this.bloodGroup = "",
      required this.alergies,
      this.pulseRate = "",
      this.bloodPressure = "",
      this.temperature = "",
      this.nhis = ""})
      : super(key: key);

  @override
  State<EditHealthData> createState() => _EditHealthDataState();
}

class _EditHealthDataState extends State<EditHealthData> {
  // TextEditingController bloodGroup = TextEditingController();
  TextEditingController alergiesController = TextEditingController();
  TextEditingController pulseRate = TextEditingController();
  TextEditingController bloodPressure = TextEditingController();
  TextEditingController temperature = TextEditingController();
  TextEditingController nhis = TextEditingController();

  List myAlergies = [];

  List<String> infoText = [
    "BLOOD GROUP",
    // "GENOTYPE",
    "ALERGIES",
    // "MEDICAL ID NUMBER",
    "PULSE RATE",
    // "RESPIRATION RATE",
    "BLOOD PRESSURE",
    "TEMPERATURE",
  ];

  assignValuesToTextFields() {
    setState(() {
    selectedbloodGroup = widget.bloodGroup;
      myAlergies = widget.alergies;
      pulseRate.text = widget.pulseRate;
      bloodPressure.text = widget.bloodPressure;
      temperature.text = widget.temperature;
      nhis.text = widget.nhis;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      assignValuesToTextFields();
    });
    super.initState();
  }

  String? selectedbloodGroup = "";
  List<String> bloodGroupList = [
    "A positive (A+)",
    "A negative (A-)",
    "B positive (B+)",
    "B negative (B-)",
    "O positive (O+)",
    "O negative (O-)",
    "AB positive (AB+)",
    "AB negative (AB-)"
  ];

  RegExp _regExp = RegExp(r"(\([a-zA-Z]+(\+|-)\))");

  @override
  Widget build(BuildContext context) {
    HealthInformationState healthInformationState =
        Provider.of<HealthInformationState>(context);
    UserState userState = Provider.of<UserState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryDeepColor,
        title: const Text("Edit Health Info"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("BLOOD GROUP"),
                    const SizedBox(
                      height: 8,
                    ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: PopupMenuButton<String>(
                          onSelected: (String value) {
                            setState(() {
                              selectedbloodGroup = value;
                            });
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color:
                                    AppColors.primaryDeepColor.withOpacity(.2),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      selectedbloodGroup == null 
                                          ? 'Select'
                                          : selectedbloodGroup!.isEmpty? "Select" : selectedbloodGroup.toString(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Theme.of(context)
                                            .disabledColor
                                            .withOpacity(.3),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: RotatedBox(
                                        quarterTurns: 3,
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: Theme.of(context)
                                              .disabledColor
                                              .withOpacity(.3),
                                        )),
                                  ),
                                ],
                              )),
                          itemBuilder: (BuildContext context) =>
                              List<PopupMenuEntry<String>>.generate(
                            bloodGroupList.length,
                            (index) => PopupMenuItem<String>(
                              value: bloodGroupList[index],
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  bloodGroupList[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),                    
                    // TextFormField(
                    //   controller: bloodGroup,
                    //   cursorColor: AppColors.primaryDeepColor,
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //           width: 3, color: AppColors.primaryDeepColor),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         width: 3,
                    //         color: AppColors.primaryDeepColor.withOpacity(.5),
                    //       ),
                    //     ),
                    //     disabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         width: 3,
                    //         color: Theme.of(context)
                    //             .disabledColor
                    //             .withOpacity(.06),
                    //       ),
                    //     ),
                    //     contentPadding: const EdgeInsets.symmetric(
                    //       horizontal: 10,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("NHIS NO."),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: nhis,
                      cursorColor: AppColors.primaryDeepColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: AppColors.primaryDeepColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: AppColors.primaryDeepColor.withOpacity(.5),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(.06),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("ALERGIES"),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 50,
                        maxHeight: 100,
                      ),
                      color: Theme.of(context).disabledColor.withOpacity(.05),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Wrap(
                              children: [
                                myAlergies.isEmpty
                                    ? Text(
                                        "No alergies added",
                                        style: TextStyle(
                                          color:
                                              Theme.of(context).disabledColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : const SizedBox(),
                                for (var i = 0; i < myAlergies.length; i++)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: AppColors.primaryDeepColor),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 6, horizontal: 8),
                                        child: Wrap(
                                          alignment: WrapAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              myAlergies[i],
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  myAlergies.removeAt(i);
                                                });
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Theme.of(context)
                                                      .canvasColor,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(1.5),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: AppColors
                                                        .primaryDeepColor,
                                                    size: 12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: alergiesController,
                            cursorColor: AppColors.primaryDeepColor,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: AppColors.primaryDeepColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: AppColors.primaryDeepColor
                                      .withOpacity(.5),
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: Theme.of(context)
                                      .disabledColor
                                      .withOpacity(.06),
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (alergiesController.text.isNotEmpty) {
                              setState(() {
                                myAlergies.add(alergiesController.text);
                                alergiesController.clear();
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryDeepColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.add,
                                color: Theme.of(context).canvasColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("PULSE RATE"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: pulseRate,
                      keyboardType: TextInputType.number,
                      cursorColor: AppColors.primaryDeepColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: AppColors.primaryDeepColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: AppColors.primaryDeepColor.withOpacity(.5),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(.06),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("BLOOD PRESSURE"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: bloodPressure,
                      cursorColor: AppColors.primaryDeepColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: AppColors.primaryDeepColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: AppColors.primaryDeepColor.withOpacity(.5),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(.06),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("TEMPERATURE"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: temperature,
                      keyboardType: TextInputType.number,
                      cursorColor: AppColors.primaryDeepColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: AppColors.primaryDeepColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: AppColors.primaryDeepColor.withOpacity(.5),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Theme.of(context)
                                .disabledColor
                                .withOpacity(.06),
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    !(selectedbloodGroup!.isEmpty &&
                            pulseRate.text.isEmpty &&
                            bloodPressure.text.isEmpty &&
                            temperature.text.isEmpty &&
                            myAlergies.isEmpty &&
                            nhis.text.isEmpty)
                        ? Column(
                            children: [
                              healthInformationState.updateHealthInfoState ==
                                      false
                                  ? Button(
                                      text: "Update",
                                      style: TextStyle(
                                        color: AppColors.primaryWhiteColor,
                                        fontSize: 20,
                                      ),
                                      onTap: () {
                                        if (healthInformationState
                                                .updateHealthInfoState !=
                                            true) {
                                          if (selectedbloodGroup!.isEmpty &&
                                              pulseRate.text.isEmpty &&
                                              bloodPressure.text.isEmpty &&
                                              temperature.text.isEmpty) {
                                            ShowToast.ecentialsToast(
                                                message:
                                                    "At least one field should not be empty",
                                                long: true);
                                          } else {
                                            Map<String, dynamic> data = {
                                              "blood_group":_regExp.stringMatch(selectedbloodGroup!).toString(),
                                              "alergies": myAlergies,
                                              "blood_pressure":
                                                  bloodPressure.text,
                                              "nhis_no": nhis.text,
                                            };

                                            if (num.tryParse(pulseRate.text) !=
                                                null) {
                                              data["pulse_rate"] = num.tryParse(
                                                      pulseRate.text) ??
                                                  0;
                                            }

                                            if (num.tryParse(
                                                    temperature.text) !=
                                                null) {
                                              data["temperature"] =
                                                  num.tryParse(
                                                          temperature.text) ??
                                                      0;
                                            }

                                            healthInformationState
                                                .addEditHealthDetails(
                                                    token: userState
                                                        .userInfo?['token'],
                                                    dataToSend: data,
                                                    callback: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      healthInformationState
                                                          .fetchHealthDetails(
                                                        token: userState
                                                            .userInfo?['token'],
                                                      );
                                                    });
                                          }
                                        }
                                      },
                                    )
                                  : loadingButton(),
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget loadingButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primaryDeepColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: SizedBox(
          height: 15,
          width: 15,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
    );
  }
}
