import 'package:ecentialsclone/src/Themes/colors.dart';
import 'package:ecentialsclone/src/Widgets/EcentialsToast.dart';
import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/app_state/Health_Info_state.dart';
import 'package:ecentialsclone/src/app_state/user_state.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../app_state/AuthState.dart';
import '../screens/UserScreens/Store/PinVerfication.dart';

class ResetPinGuardPassword extends StatefulWidget {
  final String? email;
  const ResetPinGuardPassword({Key? key, this.email}) : super(key: key);

  @override
  State<ResetPinGuardPassword> createState() => _ResetPinGuardPasswordState();
}

class _ResetPinGuardPasswordState extends State<ResetPinGuardPassword> {
  TextEditingController passCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    HealthInformationState healthInformationState = Provider.of<HealthInformationState>(context);
    UserState userState = Provider.of<UserState>(context);

  final _proceed = Button(
    onTap: () {

        if (passCodeController.text.isNotEmpty) {
                    healthInformationState.loginUser(context: context, data: {"password":passCodeController.text.trim(),"email": userState.userInfo?['email'],});
            
        } else {
          ShowToast.ecentialsToast(
            message: "Password can't be empty",
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
                child: Icon(Icons.lock,size: 100,color: AppColors.primaryDeepColor,),
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                   TextSpan(
                    text: "Verify your user password to continue ",
                    style: TextStyle(
                      fontSize: 18,
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
                      hintText: "  password ",
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
              healthInformationState.loginLoaderState == 1
                                ? loadingButton() : _proceed,
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
