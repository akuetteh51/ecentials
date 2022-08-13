import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../Themes/colors.dart';
import '../../Widgets/EcentialsToast.dart';
import '../../app_state/AuthState.dart';

class VerifyEmail extends StatefulWidget {
  bool isVisible;
  VerifyEmail({Key? key, this.isVisible = false}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = Provider.of<AuthState>(
      context,
    );

    // Logo  and PasswordReset text
    final _logotext = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/logo.png",
          scale: 1.5,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
    
    // Password Input text
    final _email = Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Enter Email",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Neumorphic(
          padding: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            depth: -10,
            lightSource: LightSource.top,
            color: Colors.grey.withOpacity(.10),
          ),
          child: TextFormField(
            style: const TextStyle(fontSize: 20),
            cursorColor: AppColors.primaryDeepColor,
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "example@gmail.com",
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
    // Confirm Password Input text

// Sign in Button
    final _signin = Button(
      onTap: () {
        AuthState authState = Provider.of<AuthState>(context, listen: false);

        if (emailController.text.isNotEmpty) {
          if (emailController.text.isEmail) {
            //Get.to(() => EmailSuccess());
            authState.sendPasswordResetCode(
              context: context,
              data: {
                "email": emailController.text.trim(),
              },
              email: emailController.text.trim(),
            );
          } else {
            ShowToast.ecentialsToast(
              message: "Invalid email address",
            );
          }
        } else {
          ShowToast.ecentialsToast(
            message: "Email is empty",
          );
        }
      },
      text: "Verify",
      style: TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20),
    );

    // App Bar
    final _appBar = AppBar(
      backgroundColor: AppColors.primaryWhiteColor,
      foregroundColor: AppColors.primaryBlackColor,
      elevation: 0,
      title: const Text(
        "Confirm Email",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
      appBar: _appBar,
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 60,
            ),
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _logotext,
                    const SizedBox(
                      height: 20,
                    ),
                    Form(                      
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            _email,
                            const SizedBox(
                              height: 40,
                            ),
                            authState.sendResetEmailLoader == 0 ||
                                    authState.sendResetEmailLoader == 2
                                ? _signin
                                : loadingButton(),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
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
