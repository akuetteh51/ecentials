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
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            password(),
                            const SizedBox(
                              height: 20,
                            ),
                            confirmPassword(),
                            const SizedBox(
                              height: 40,
                            ),
                            authState.resetPasswordLoaderState == 1
                                ? loadingButton() : signin(authState),
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

  Widget password() {
    return Column(
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
            controller: passwordController,
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
  }

  Widget confirmPassword() {
    return Column(
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
            controller: confirmPasswordController,
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
  }

// Sign in Button
  Widget signin(AuthState authState) {
    // AuthState authState = Provider.of<AuthState>(context,listen: false);

    return Button(
      onTap: () {
        if (passwordController.text.trim().isNotEmpty &&
            confirmPasswordController.text.trim().isNotEmpty) {
          if (passwordController.text.trim().length > 7) {
            if (passwordController.text.trim() ==
                confirmPasswordController.text.trim()) {
              authState.resetUserPassword(context: context, data: {
                "email": widget.email,
                "password": passwordController.text.trim(),
                "confirmPassword": confirmPasswordController.text.trim()
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
