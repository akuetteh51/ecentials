import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/reset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Widgets/EcentialsToast.dart';
import '../../Widgets/button.dart';
import '../../app_state/AuthState.dart';

class EmailSuccess extends StatefulWidget {
  final String? email;
  const EmailSuccess({Key? key, this.email}) : super(key: key);

  @override
  State<EmailSuccess> createState() => _EmailSuccessState();
}

class _EmailSuccessState extends State<EmailSuccess> {
  TextEditingController passCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = Provider.of<AuthState>(context);

  final _proceed = Button(
    onTap: () {

        if (passCodeController.text.isNotEmpty) {
            //Get.to(() => EmailSuccess());
            authState.verifyPasswordResetCode(
              context: context,
              data: {
                "code": passCodeController.text.trim(),
                "email":widget.email,
              },
              email: widget.email!,
            );
        } else {
          ShowToast.ecentialsToast(
            message: "Code can not be empty",
          );
        }      
    },
    text: "Proceed",
    style: TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20),
  );


    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhiteColor,
        foregroundColor: AppColors.primaryBlackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Get.to(() => Login());
            // Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  "assets/images/email_success.png",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                   TextSpan(
                    text: "We sent a confirmation code to ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).disabledColor.withOpacity(.3),
                    ),
                  ),
                   TextSpan(
                    text: "\n${widget.email ?? 'youremail@domain.com'}\n",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.primaryDeepColor,
                    ),
                  ),
                     TextSpan(
                    text: " verify code to change account ",
                    style: TextStyle(
                      fontSize:18,
                      color: Theme.of(context).disabledColor.withOpacity(.3),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: Neumorphic(
                  padding:const EdgeInsets.symmetric(horizontal: 10),
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    depth: -10,
                    lightSource: LightSource.top,
                    color: Colors.grey.withOpacity(.10),
                  ),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 20),
                    cursorColor: AppColors.primaryDeepColor,
                    controller: passCodeController,
                    decoration: const InputDecoration(
                      hintText: "  eg. 324214",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
             
             
              const SizedBox(
                height: 60,
              ),
              SizedBox(width: 200, child: 
              authState.verifyingResetCode == 0 ||
                                    authState.verifyingResetCode == 2
                                ? _proceed
                                : loadingButton(),
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
          child:CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Theme.of(context).canvasColor,
                ),
        ),
      ),
    );
  }


}
