import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import '../../Themes/colors.dart';
import '../../Widgets/EcentialsToast.dart';
import '../../app_state/AuthState.dart';

class PasswordReset extends StatefulWidget {
  bool isVisible;
  final String email;
  PasswordReset({Key? key, this.isVisible = false, required this.email})
      : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthState authState = Provider.of<AuthState>(context);
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
    // Email Input text
    final _formkey = GlobalKey<FormState>();
    final _emailController = TextEditingController();

    // Password Input text
    final _password = Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "New Password",
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
        if (_passwordController.text.trim().isNotEmpty &&
            _confirmPasswordController.text.trim().isNotEmpty) {
          if (_passwordController.text.trim().length > 7) {
            if (_passwordController.text.trim() ==
                _confirmPasswordController.text.trim()) {
              authState.resetUserPassword(context: context, data: {
                "email": widget.email,
                "password": _passwordController.text.trim(),
                "confirmPassword": _confirmPasswordController.text.trim()
              });
            } else {
              ShowToast.ecentialsToast(
                message: "Password do not match",
              );
            }
          } else {
            ShowToast.ecentialsToast(
              message: "Password too short (<8)",
            );
          }
        } else {
          ShowToast.ecentialsToast(
            message: "Password can not be empty",
          );
        }
      },
      text: "Save",
      style: TextStyle(color: AppColors.primaryWhiteColor, fontSize: 20),
    );

    // App Bar
    final _appBar = AppBar(
      backgroundColor: AppColors.primaryWhiteColor,
      foregroundColor: AppColors.primaryBlackColor,
      elevation: 0,
      title: const Text(
        "Password Reset",
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
                      key: _formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
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
                            authState.resetPasswordLoaderState == 0 ||
                                    authState.resetPasswordLoaderState == 2
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
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
    );
  }
}
