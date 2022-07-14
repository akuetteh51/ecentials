import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

import '../../Themes/colors.dart';
import '../../Widgets/EcentialsToast.dart';
import 'agreement.dart';

class Registration extends StatefulWidget {
  bool isVisible;
  Registration({Key? key, this.isVisible = false}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Logo  and Registration text
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
        Container(
          margin: const EdgeInsets.only(top: 7),
          child: const Text(
            "signup",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
    // Email Input text
    final _formkey = GlobalKey<FormState>();

    final _email = Column(
      children: [
        const SizedBox(height: 40),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Email",
            style: TextStyle(fontSize: 16),
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
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: "email@domain.com",
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    );

    // Password Input text

    final _password = Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Password",
            style: TextStyle(fontSize: 16),
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
            obscuringCharacter: '*',
            obscureText: !widget.isVisible,
            style: const TextStyle(fontSize: 20),
            cursorColor: AppColors.primaryDeepColor,
            controller: _passwordController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    widget.isVisible = !widget.isVisible;
                  });
                },
                icon: Icon(
                  widget.isVisible == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.primaryBlackColor.withOpacity(
                    .50,
                  ),
                ),
              ),
              hintText: "********",
              hintStyle: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    );
    // Confirm Password Input text

    final _confirmPassword = Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Confirm Password",
            style: TextStyle(fontSize: 16),
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
            obscuringCharacter: '*',
            obscureText: !widget.isVisible,
            style: const TextStyle(fontSize: 20),
            cursorColor: AppColors.primaryDeepColor,
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    widget.isVisible = !widget.isVisible;
                  });
                },
                icon: Icon(
                  widget.isVisible == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: AppColors.primaryBlackColor.withOpacity(
                    .50,
                  ),
                ),
              ),
              hintText: "********",
              hintStyle: TextStyle(
                color: Theme.of(context).disabledColor,
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    );

// Sign in Button
    final _signin = Button(
      onTap: () {
        // Regex to check if a string
        // contains uppercase, lowercase
        // special character & numeric value
        RegExp regex = RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$');

        if (_emailController.text.trim().isNotEmpty &&
            _passwordController.text.trim().isNotEmpty &&
            _confirmPasswordController.text.trim().isNotEmpty) {
          if (_emailController.text.trim().isEmail) {
            if (_confirmPasswordController.text.trim() ==
                _passwordController.text.trim()) {
              if (_passwordController.text.trim().length >= 7) {
                if (_passwordController.text.trim().contains(regex)) {
                  Get.to(
                    () => Agreement(data: <String, dynamic>{
                      "email": _emailController.text.trim(),
                      "password": _passwordController.text.trim(),
                    }),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 300),
                  );
                } else {
                  ShowToast.ecentialsToast(
                    message:
                        "Passwords must contain: Upper case, Lower case and special symbol",
                  );
                }
              } else {
                ShowToast.ecentialsToast(
                  message: "Password too short. less than 6",
                );
              }
            } else {
              ShowToast.ecentialsToast(
                message: "Passwords not equal",
              );
            }
          } else {
            ShowToast.ecentialsToast(
              message: "Not a valid email",
            );
          }
        } else {
          ShowToast.ecentialsToast(
            message: "No field should be empty",
          );
        }
      },
      text: "Register",
      style: TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20),
    );

    // New User Button
    final _newUser = RichText(
      text: TextSpan(
        text: "Already have an account?",
        style: TextStyle(
          color: Colors.grey.withOpacity(.90),
          fontSize: 16,
          fontFamily: "Montserrat",
        ),
        children: [
          TextSpan(
              text: " Login",
              style: TextStyle(
                color: AppColors.primaryDeepColor,
                fontFamily: "Montserrat",
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pop();
                }),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.primaryWhiteColor,
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
                      key: _formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _email,
                            const SizedBox(
                              height: 20,
                            ),
                            _password,
                            const SizedBox(
                              height: 20,
                            ),
                            _confirmPassword,
                            const SizedBox(
                              height: 40,
                            ),
                            _signin,
                            const SizedBox(
                              height: 20,
                            ),
                            _newUser,
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
}
