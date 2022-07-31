import 'package:flutter/material.dart';

import '../../../../Themes/colors.dart';

class EditHealthData extends StatefulWidget {
  const EditHealthData({Key? key}) : super(key: key);

  @override
  State<EditHealthData> createState() => _EditHealthDataState();
}

class _EditHealthDataState extends State<EditHealthData> {
  TextEditingController health = TextEditingController();

  List<String> infoText = [
    "BLOOD GROUP",
    "GENOTYPE",
    "ALERGIES"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryDeepColor,
        title: const Text("Edit Health Info"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              for (int i = 0; i < 6; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Year"),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: health,
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
            ],
          ),
        ],
      ),
    );
  }
}
