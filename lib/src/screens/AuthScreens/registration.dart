import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:ecentialsclone/src/screens/AuthScreens/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import '../../Themes/colors.dart';
import '../UserScreens/main_screen.dart';

class Registration extends StatefulWidget {
  bool isVisible;
  Registration({Key? key, this.isVisible = false}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
    // Email Input text
    final _formkey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _email = Column(
      children: [
        const SizedBox(height: 40),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Email",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

    final _passwordController = TextEditingController();
    final _password = Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Password",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            obscureText: widget.isVisible,
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
                icon: widget.isVisible == true
                    ? Icon(
                        Icons.visibility,
                      )
                    : Icon(Icons.visibility_off),
              ),
              hintText: "********",
              border: const UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        )
      ],
    );
    // Confirm Password Input text

    final _confirmPasswordController = TextEditingController();
    final _confirmPassword = Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Confirm Password",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            obscureText: widget.isVisible,
            style: TextStyle(fontSize: 20),
            cursorColor: AppColors.primaryDeepColor,
            controller: _confirmPasswordController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    widget.isVisible = !widget.isVisible;
                  });
                },
                icon: widget.isVisible == true
                    ? Icon(
                        Icons.visibility,
                      )
                    : Icon(Icons.visibility_off),
              ),
              hintText: "********",
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
        Get.to(
          () => MainScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(seconds: 1),
        );
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
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
              text: " Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDeepColor,
                fontFamily: "Montserrat",
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(() => const Login(),
                      transition: Transition.leftToRight,
                      duration: const Duration(seconds: 1));
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
