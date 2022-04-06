import 'package:ecentialsclone/Themes/colors.dart';
import 'package:ecentialsclone/screens/AuthScreens/login.dart';
import 'package:ecentialsclone/widgets/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Onboarding Images
  final _images = [
    "onboarding_1.png",
    "onboarding_2.png",
    "onboarding_3.png",
    "onboarding_4.png",
  ];

// Onboarding text images
  final _imagestext = [
    "Welcome to ecentials platform your online health care provider",
    "With ecential you can be very close to your healthcare provider anywhere",
    "We act as a middleman bewtween you and your healthcare provider",
    "With our Ambulance dispatching you can call or order for an ambulance anywhere"
  ];

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    // Onboarding column
    _onboard(int index) => Column(
          children: [
            Image.asset(
              "assets/images/" + _images[index],
            ),
            Container(
              width: w,
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Text(
                _imagestext[index],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ],
        );

    // Skip button
    final skip = Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () async {
          final preference = await SharedPreferences.getInstance();
          preference.setBool("showLogin", true);
          Get.to(
            () => const Login(),
            transition: Transition.fadeIn,
            duration: const Duration(seconds: 1),
          );
        },
        child: Text(
          "skip",
          style: TextStyle(
            fontSize: 16,
            decoration: TextDecoration.underline,
            color: AppColors.primaryDeepColor,
          ),
        ),
      ),
    );

    // Next Button
    final _nextButton = GestureDetector(
      onTap: () async {
        final preference = await SharedPreferences.getInstance();
        preference.setBool("showLogin", true);
        Get.to(
          () => const Login(),
          transition: Transition.fadeIn,
          duration: const Duration(seconds: 1),
        );
      },
      child: Button(
        text: "Next",
        style: TextStyle(
          color: AppColors.primaryWhiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

// smooth page indicator
    final _pageIndicator = SmoothPageIndicator(
      onDotClicked: (index) => _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn),
      controller: _pageController,
      count: 4,
      axisDirection: Axis.horizontal,
      effect: WormEffect(
          strokeWidth: 1,
          dotColor: AppColors.primaryDeepColor,
          type: WormType.thin,
          dotHeight: 8.0,
          dotWidth: 8.0,
          offset: 10,
          activeDotColor: AppColors.primaryDeepColor,
          paintStyle: PaintingStyle.stroke),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: PageView.builder(
          controller: _pageController,
          itemCount: 4,
          itemBuilder: (context, index) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _onboard(index),
                _pageIndicator,
                const SizedBox(
                  height: 30,
                ),
                index != 3 ? skip : _nextButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
