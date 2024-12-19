import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:one_market/core/function/navigation.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/core/widgets/custom_button_widget.dart';
import 'package:one_market/feature/auth/presentation/pages/signin_screen.dart';
import 'package:one_market/feature/auth/presentation/pages/signup_screen.dart';
import 'package:one_market/feature/home/pages/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/home.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              AppColors.secondryColor.withOpacity(0.7),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 120, 5, 20),
            ),
            Image.asset(
              'assets/images/logo1.png',
              height: 175,
            ),
            const Gap(100),
            Buttons(
              onPressed: () {
                push(context, const SignUpScreen());
              },
              text: 'تسجيل حساب',
            ),
            const Gap(45),
            Buttons(
              onPressed: () {
                push(context, const SignInScreen());
              },
              text: 'تسجيل دخول',
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, right: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    push(context, const HomeScreen());
                  },
                  child: Text(
                    'تخطي',
                    style: getHeadLineStyle(
                      color: AppColors.secondryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
