import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiee/constants/data.dart';
import 'package:fudiee/screens/auth/auth_screen.dart';
import 'package:fudiee/themes/app_colors.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static String routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController(initialPage: 0);
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(seconds: 4),
      (timer) {
        var lastPage = 2;
        var currentPage = pageController.page!.round();
        pageController.animateToPage(
          currentPage != lastPage ? currentPage + 1 : 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.84,
            child: PageView.builder(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                var info = onboardingData[index];
                return OnboardingInfo(
                  image: info.image,
                  title: info.title,
                  subtitle: info.subtitle,
                );
              },
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(29.w, 0, 29.w, 18.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // const Spacer(),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: primaryColor,
                    dotColor: greyColor,
                  ),
                  onDotClicked: ((index) {
                    pageController.animateToPage(
                      index,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                    );
                  }),
                ),
                SizedBox(height: 25.h),
                AppButton(
                  text: 'Get Started',
                  onPressed: () {
                    Get.toNamed(AuthScreen.routeName);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    timer.cancel();

    super.dispose();
  }
}

class OnboardingInfo extends StatelessWidget {
  const OnboardingInfo({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: Get.height * 0.57,
          child: FadeInImage(
            image: AssetImage(image),
            placeholder: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(29.w, 25.h, 29.w, 0),
          child: OnboardingTitle(
            title: title,
            subtitle: subtitle,
          ),
        ),
      ],
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: primaryColor,
        minimumSize: const Size(double.infinity, 55),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
            maxLines: 2,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            subtitle,
            textAlign: TextAlign.left,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
