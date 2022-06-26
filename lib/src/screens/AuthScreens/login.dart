import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/agreement.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/reset.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/verifyEmail.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Themes/colors.dart';
import '../UserScreens/main_screen.dart';

class Login extends StatefulWidget {
  bool isVisible;
  Login({Key? key, this.isVisible = false}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Logo  and Login text
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
            "login",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
          child: TextField(
            style: const TextStyle(fontSize: 20),
            cursorColor: AppColors.primaryDeepColor,
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: "abc@gmail.com",
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
          child: TextField(
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
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    );

    final _forgotPassword = Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Text(
          "Forgot Password ?",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              decoration: TextDecoration.underline),
        ),
        onPressed: () {
          Get.to(() => VerifyEmail(),
              transition: Transition.rightToLeft,
              duration: Duration(seconds: 1));
        },
      ),
    );

// Sign in Button
    final _signin = Button(
      onTap: () async {
        final preference = await SharedPreferences.getInstance();
        preference.setBool("showSignup", true);
        Get.to(
          () => const MainScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(seconds: 1),
        );
      },
      text: "Sign in",
      style: TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20),
    );

    // New User Button
    final _newUser = RichText(
      text: TextSpan(
        text: "New to ecentials?",
        style: TextStyle(
          color: Colors.grey.withOpacity(.90),
          fontSize: 16,
          fontFamily: "Montserrat",
        ),
        children: [
          TextSpan(
              text: " Register",
              style: TextStyle(
                color: AppColors.primaryDeepColor,
                fontFamily: "Montserrat",
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(() => const Agreement(),
                      transition: Transition.rightToLeft,
                      duration: Duration(seconds: 1));
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
              top: 100,
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
                            _email,
                            const SizedBox(
                              height: 20,
                            ),
                            _password,
                            _forgotPassword,
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
