import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Themes/colors.dart';
import '../../../../Widgets/EcentialsToast.dart';
import '../../../../app_state/user_state.dart';

class AddEducation extends StatefulWidget {
  final bool isNew;
  final String? school;
  final String? program;
  final String? year;
  final String? elementId;
  const AddEducation(
      {Key? key,
      required this.isNew,
      this.school,
      this.program,
      this.year,
      this.elementId})
      : super(key: key);

  @override
  State<AddEducation> createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  TextEditingController school = TextEditingController();
  TextEditingController program = TextEditingController();
  TextEditingController year = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setState(() {
        school.text = widget.school ?? "";
        program.text = widget.program ?? "";
        year.text = widget.year ?? "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    UserState userState = Provider.of<UserState>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.black.withOpacity(.4),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .10,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("School"),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: school,
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
                                color:
                                    AppColors.primaryDeepColor.withOpacity(.5),
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
                          height: 12,
                        ),
                        const Text("Degree, program"),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: program,
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
                                color:
                                    AppColors.primaryDeepColor.withOpacity(.5),
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
                          height: 12,
                        ),
                        const Text("Year"),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: year,
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
                                color:
                                    AppColors.primaryDeepColor.withOpacity(.5),
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
                          height: 20,
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Wrap(
                            alignment: widget.isNew == true
                                ? WrapAlignment.center
                                : WrapAlignment.spaceAround,
                            children: [
                              widget.isNew != true
                                  ? MaterialButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        log("Record ID: ${widget.elementId}");
                                        if (userState.deletingEducationState !=
                                            1) {

                                            userState.deleteEducationalInformation(
                                              token:
                                                  userState.userInfo?['token'],
                                              data: {
                                                    "record_id": widget.elementId,
                                                },
                                            );

                                        }
                                      },
                                      child: userState.deletingEducationState !=
                                              1
                                          ? Text(
                                              "Delete",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .canvasColor,
                                              ),
                                            )
                                          : SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2.5,
                                                color: Theme.of(context)
                                                    .canvasColor,
                                              ),
                                            ),
                                    )
                                  : const SizedBox(),

                              widget.isNew == true
                                  ? MaterialButton(
                                      color: AppColors.primaryDeepColor,
                                      onPressed: () {
                                        if (userState.gettingEducationState !=
                                            1) {
                                          if (program.text.trim().isNotEmpty &&
                                              school.text.trim().isNotEmpty &&
                                              year.text.trim().isNotEmpty) {
                                            userState.addEducation(
                                              token:
                                                  userState.userInfo?['token'],
                                              data: {
                                                "user_id":
                                                    userState.userInfo?['id'] ??
                                                        "",
                                                "school_name":
                                                    school.text.trim(),
                                                "course": program.text.trim(),
                                                "duration": year.text.trim(),
                                                "highest_level": "",
                                              },
                                            );
                                          } else {
                                            ShowToast.ecentialsToast(
                                              message:
                                                  "All fields are required",
                                            );
                                          }
                                        }
                                      },
                                      child: userState.addingEducationState != 1
                                          ? Text(
                                              "Add New",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .canvasColor,
                                              ),
                                            )
                                          : SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2.5,
                                                color: Theme.of(context)
                                                    .canvasColor,
                                              ),
                                            ),
                                    )
                                  : const SizedBox(),

                              // This would show when the user is editing
                              widget.isNew != true
                                  ? MaterialButton(
                                      color: AppColors.primaryDeepColor,
                                      onPressed: () {
                                        if (userState.updateEducationState !=
                                            1) {
                                          if (program.text.trim().isNotEmpty &&
                                              school.text.trim().isNotEmpty &&
                                              year.text.trim().isNotEmpty) {
                                            userState
                                                .updateEducationalInformation(
                                              token:
                                                  userState.userInfo?['token'],
                                              data: {
                                                "user_id":
                                                    userState.userInfo?['id'] ??
                                                        "",
                                                "school_name":
                                                    school.text.trim(),
                                                "course": program.text.trim(),
                                                "duration": year.text.trim(),
                                                "highest_level": "",
                                              },
                                            );
                                          } else {
                                            ShowToast.ecentialsToast(
                                              message:
                                                  "All fields are required",
                                            );
                                          }
                                        }
                                      },
                                      child: userState.updateEducationState != 1
                                          ? Text(
                                              "Update",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .canvasColor,
                                              ),
                                            )
                                          : SizedBox(
                                              width: 15,
                                              height: 15,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2.5,
                                                color: Theme.of(context)
                                                    .canvasColor,
                                              ),
                                            ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                        // loadingButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .50,
            ),
          ],
        ),
      ),
    );
  }
}
