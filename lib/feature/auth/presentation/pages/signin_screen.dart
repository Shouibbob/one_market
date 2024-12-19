import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:one_market/core/function/dialogs.dart';
import 'package:one_market/core/function/email_validate.dart';
import 'package:one_market/core/function/navigation.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/core/widgets/text_form_field_widget.dart';
import 'package:one_market/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:one_market/feature/auth/presentation/bloc/auth_event.dart';
import 'package:one_market/feature/auth/presentation/bloc/auth_state.dart';
import 'package:one_market/feature/auth/presentation/pages/forget_password_screen.dart';
import 'package:one_market/feature/auth/presentation/pages/signup_screen.dart';
import 'package:one_market/feature/home/pages/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  handleGoogleSignIn() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredential.user != null) {
      push(context, const HomeScreen());
    }
  }

  bool isVisable = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondryColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SignInLoadingState) {
              showLoadingDialog(context);
              pushAndRemoveUntil(context, const HomeScreen());
            } else if (state is SignInSuccessState) {
              push(context, const HomeScreen());
              showSuccessSnackDialog(context, 'تم تسجيل الدخول بنجاح');
            } else if (state is AuthErrorState) {
              showErrorDialog(context, state.error);
            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'تسجيل الدخول',
                        style: getHeadLineStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'يرجى تسجيل الدخول للمتابعة',
                        style: getTitleStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Gap(40),
                    TextFormFieldWidget(
                      controller: emailAddressController,
                      label: 'البريد الالكتروني',
                      icon: const Icon(Icons.email_outlined),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'برجاء ادخال البريد الالكتروني';
                        } else if (!emailValidate(value)) {
                          return 'برجاء ادخال بريد الكتروني صحيح';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(10),
                    TextFormFieldWidget(
                      controller: passwordController,
                      secureText: isVisable,
                      label: 'كلمة المرور',
                      icon: const Icon(Icons.lock_outlined),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisable = !isVisable;
                          });
                        },
                        icon: Icon(
                          (isVisable) ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'برجاء ادخال كلمة المرور';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const Gap(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(SignInEvent(
                                        email: emailAddressController.text,
                                        password: passwordController.text,
                                      ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColors.primaryColor,
                                backgroundColor: AppColors.secondryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'تسجيل',
                                  ),
                                  Gap(5),
                                  Icon(Icons.arrow_forward, size: 24),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              push(context, const ForgetPasswordScreen());
                            },
                            child: Text(
                              'نسيت كلمة المرور؟',
                              style: getSmallStyle(
                                fontSize: 12,
                                color: AppColors.secondryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(30),
                    Center(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          onPressed: () {
                            handleGoogleSignIn();
                          },
                          icon: Image.asset('assets/images/google_logo.png'),
                          label: Text(
                            'تسجيل الدخول باستخدام جوجل',
                            style: getBodyStyle(
                              color: AppColors.secondryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ليس لديك حساب؟ ',
                style: getBodyStyle(
                  fontSize: 15,
                  color: AppColors.secondryColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  push(context, const SignUpScreen());
                },
                child: Text(
                  'انشاء حساب',
                  style: getBodyStyle(
                    fontSize: 15,
                    color: AppColors.foreGround,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
