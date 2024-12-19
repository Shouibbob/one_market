import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_market/core/function/navigation.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/feature/intro/onboarding/onboarding_model.dart';
import 'package:one_market/feature/intro/welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      push(context, const WelcomeScreen());
                      //navigation to home Screen!!
                    },
                    child: Text(
                      'تخطي',
                      style: getBodyStyle(color: AppColors.secondryColor),
                    ),
                  ),
                ),
                const Gap(25),
                Expanded(
                  child: PageView.builder(
                    itemCount: splashSlider.length,
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      final item = splashSlider[index];
                      return Column(
                        children: [
                          Image.asset(
                            item.image,
                            height: 450,
                          ),
                          const Gap(5),
                          Text(
                            item.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: AppColors.secondryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28),
                          ),
                          // Text(
                          //   'الوصف',
                          //   style: getTitleStyle(
                          //       color: AppColors.secondryColor, fontSize: 20),
                          // ),
                        ],
                      );
                    },
                  ),
                ),
                Row(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: AnimatedContainer(
                        duration: const Duration(microseconds: 300),
                        height: 10,
                        width: _currentPage == index ? 30 : 10,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.secondryColor
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed: () {
            if (_currentPage < splashSlider.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            } else {
              // Navigate to home screen
              push(context, const WelcomeScreen());
            }
          },
          child: _currentPage != splashSlider.length - 1
              ? const Icon(Icons.arrow_forward)
              : const Icon(Icons.done),
        ),
      ),
    );
  }
}
