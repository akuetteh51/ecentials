import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/app_state/AuthState.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/EULA.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../UserScreens/main_screen.dart';

class Agreement extends StatefulWidget {
  final Map<String, dynamic>? data;
  const Agreement({Key? key, this.data}) : super(key: key);
  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {
  @override
  Widget build(BuildContext context) {
    AuthState authState = Provider.of<AuthState>(context);

    // Agreement Button
    final _agreementButton = Button(
      text: "Agree and Continue",
      height: 60,
      radius: 0,
      style: TextStyle(
        color: AppColors.primaryWhiteColor,
        fontSize: 20,
      ),
      onTap: () {
        // debugPrint("retried");
        authState.registerNewUser(
          data: widget.data,
          context: context,
        );
        // authState.updateRegTest();
      },
    );

    // App Bar
    final _appBar = AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back,
          color: AppColors.primaryDeepColor,
        ),
      ),
      backgroundColor: AppColors.primaryWhiteColor,
      foregroundColor: AppColors.primaryBlackColor,
      elevation: 0,
      title: Text(
        "Summary Terms and Conditions",
        style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryDeepColor,
            fontWeight: FontWeight.w600),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      extendBody: true,
      bottomNavigationBar: authState.registerLoaderState == 0 ||
              authState.registerLoaderState == 2
          ? _agreementButton
          : agreementButton(authState.registerLoaderState, () {
              authState.registerNewUser(data: widget.data, context: context);
            }),
      appBar: _appBar,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              EULA.eula,
              style: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget agreementButton(int stateValue, Function? refreshFunction) {
    return GestureDetector(
      onTap: () {
        if (stateValue == 3) {
          if (refreshFunction != null) {
            refreshFunction();
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primaryDeepColor,
          borderRadius: BorderRadius.circular(0),
        ),
        child: Center(
          child: stateValue == 1
              ? SizedBox(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Theme.of(context).canvasColor,
                  ),
                )
              : Icon(
                  Icons.replay,
                  size: 20,
                  color: Theme.of(context).canvasColor,
                ),
        ),
      ),
    );
  }
}
