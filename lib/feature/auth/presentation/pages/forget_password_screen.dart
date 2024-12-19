import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:one_market/core/function/dialogs.dart';
import 'package:one_market/core/function/email_validate.dart';
import 'package:one_market/core/function/navigation.dart';
import 'package:one_market/core/utils/colors.dart';
import 'package:one_market/core/utils/text_style.dart';
import 'package:one_market/core/widgets/text_form_field_widget.dart';
import 'package:one_market/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:one_market/feature/auth/presentation/bloc/auth_event.dart';
import 'package:one_market/feature/auth/presentation/bloc/auth_state.dart';
import 'package:one_market/feature/auth/presentation/pages/signin_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

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
            if (state is ForgetPasswordLoadingState) {
              showLoadingDialog(context);
            } else if (state is ForgetPasswordSuccessState) {
              Navigator.of(context).pop();
              showSuccessSnackDialog(
                  context, 'تم الارسال الي بريدك الالكتروني');
            } else if (state is AuthErrorState) {
              showErrorDialog(context, state.error);
            }
          },
          child: SafeArea(
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
                          'نسيت كلمة المرور؟',
                          style: getHeadLineStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Gap(40),
                      TextFormFieldWidget(
                        label: 'البريد الالكتروني',
                        icon: const Icon(Icons.email_outlined),
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'ادخل البريد الالكتروني';
                          } else if (!emailValidate(value)) {
                            return 'البريد الالكتروني غير صحيح';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const Gap(10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondryColor,
                              foregroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<AuthBloc>()
                                    .add(ForgetPasswordEvent(
                                      email: emailController.text,
                                    ));
                              }
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('تعيين كلمة المرور'),
                                Gap(5),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 24,
                                ),
                              ],
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
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'تذكر كلمة المرور؟',
                style: getBodyStyle(
                  color: AppColors.secondryColor,
                  fontSize: 15,
                ),
              ),
              TextButton(
                onPressed: () {
                  push(context, const SignInScreen());
                },
                child: Text(
                  'تسجيل الدخول',
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
