import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_market/core/function/navigation.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/feature/intro/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.forward();
    Timer(const Duration(seconds: 3), () {});
    Future.delayed(const Duration(seconds: 5), () {
      pushReplacement(context, const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeOut,
              )),
              child: Image.asset(
                'assets/images/logo1.png',
                height: 150,
              ),
            ),
            const Gap(50),
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                parent: _animationController,
                curve: Curves.linear,
              )),
              child: Text(
                'وان ماركت',
                style: getHeadLineStyle(
                  fontSize: 26,
                  color: AppColors.secondryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 40,
      //   child: Text(
      //     'Powered By Coding Shouib',
      //     textAlign: TextAlign.center,
      //     style: getSmallStyle(color: AppColors.secondryColor),
      //   ),
      // ),
    );
  }
}
