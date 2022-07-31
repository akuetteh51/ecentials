import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Themes/colors.dart';
import '../app_state/Health_Info_state.dart';


class PinLoader extends StatefulWidget {
  const PinLoader({ Key? key }) : super(key: key);

  @override
  State<PinLoader> createState() => _PinLoaderState();
}

class _PinLoaderState extends State<PinLoader> {
  @override
  Widget build(BuildContext context) {
    HealthInformationState healthInformationState =
        Provider.of<HealthInformationState>(context);    
    return healthInformationState.pinCreationState == true
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                height: 14,
                                width: 14,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.1,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.primaryDeepColor),
                                ),
                              ),
                            )
                          : const SizedBox();
  }
}