import 'package:ecentialsclone/Themes/colors.dart';
import 'package:ecentialsclone/ecentials_icons_icons.dart';
import 'package:ecentialsclone/screens/MainScreens/main_screen.dart';
import 'package:ecentialsclone/widgets/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
    final _emailController = TextEditingController();
    final _email = Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Email",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

    final _passwordController = TextEditingController();
    final _password = Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Password",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
            obscureText: true,
            style: const TextStyle(fontSize: 20),
            cursorColor: AppColors.primaryDeepColor,
            controller: _passwordController,
            decoration: const InputDecoration(
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
        onPressed: () {},
      ),
    );

// Sign in Button
    final _signin = GestureDetector(
      onTap: () {
        Get.to(
          () => const MainScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(seconds: 1),
        );
      },
      child: Button(
        text: "Sign in",
        style: TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20),
      ),
    );

    // New User Button
    final _newUser = RichText(
      text: TextSpan(
        text: "New to ecentials?",
        style: TextStyle(
          color: Colors.grey.withOpacity(.90),
          fontSize: 16,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
              text: " Register",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDeepColor,
                fontFamily: "Montserrat",
              ),
              recognizer: TapGestureRecognizer()..onTap = () {}),
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
                      key: _formkey,
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
