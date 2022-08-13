import 'package:ecentialsclone/src/Widgets/button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Themes/colors.dart';
import '../app_state/AuthState.dart';
import 'AuthScreens/login.dart';

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
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int currentIndex = 0;
  onScroll(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    AuthState authState = Provider.of<AuthState>(context);

    // Onboarding column
    _onboard(int index) => Column(
          children: [
            Image.asset(
              "assets/images/" + _images[index],
            ),
            Container(
              width: w,
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Center(
                  child: Text(
                    _imagestext[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        );

    // Skip button
    final skip = Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () async {
          authState.saveWalkthroughPass(true);
          Get.to(
            () => Login(),
            transition: Transition.rightToLeft,
            duration: const Duration(milliseconds: 300),
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
    final _nextButton = Button(
      width: MediaQuery.of(context).size.width - 80,
      onTap: () async {
       authState.saveWalkthroughPass(true);
        Get.to(
          () => Login(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 300),
        );
      },
      text: "Next",
      style: TextStyle(
        color: AppColors.primaryWhiteColor,
        fontSize: 20,
      ),
    );

// smooth page indicator
    final _pageIndicator = SmoothPageIndicator(
      onDotClicked: (index) => _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn),
      controller: _pageController,
      count: 4,
      axisDirection: Axis.horizontal,
      effect: JumpingDotEffect(
          jumpScale: 2.0,
          verticalOffset: 5.0,
          strokeWidth: 1,
          dotColor: AppColors.primaryDeepColor,
          // type: WormType.thin,
          dotHeight: 8.0,
          dotWidth: 8.0,
          offset: 10,
          activeDotColor: AppColors.primaryDeepColor,
          paintStyle: PaintingStyle.stroke),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          dragStartBehavior: DragStartBehavior.start,
          scrollBehavior: const ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          ),
          controller: _pageController,
          itemCount: 4,
          onPageChanged: onScroll,
          itemBuilder: (context, index) {
            currentIndex = index;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _onboard(index),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          }),
      bottomSheet: Container(
        color: AppColors.primaryWhiteColor,
        height: 180,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _pageIndicator,
            const SizedBox(
              height: 40,
            ),
            currentIndex != 3 ? skip : _nextButton,
          ],
        ),
      ),
    );
  }
}
