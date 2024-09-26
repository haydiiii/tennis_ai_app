import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_ai_app/core/function/email_validate.dart';
import 'package:tennis_ai_app/core/function/routing.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';
import 'package:tennis_ai_app/core/utils/text_style.dart';
import 'package:tennis_ai_app/core/widgets/custom_dialog.dart';
import 'package:tennis_ai_app/core/widgets/custom_elev_button.dart';
import 'package:tennis_ai_app/core/widgets/custom_txt_frm_field.dart';
import 'package:tennis_ai_app/core/widgets/show_custom_loading_dialog.dart';
import 'package:tennis_ai_app/features/auth/presentation/manager/cubit/login_cubit.dart';
import 'package:tennis_ai_app/features/auth/presentation/manager/states/login_states.dart';
import 'package:tennis_ai_app/features/auth/presentation/views/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'LOGIN',
                    style: getBodyStyle(
                      fontsize: 35,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'CREATE AN ACCOUNT TO MAKE SDFSDF',
                    style: getSmallStyle(
                      TextDecoration.none,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const Gap(120),
                  CustomTextFormField(
                    labelText: 'Email',
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      } 
                      return null;
                    },
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    labelText: 'Password',
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const Gap(10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // إضافة منطق لاستعادة كلمة المرور
                      },
                      child: Text(
                        'Forgot Password?',
                        style: getSmallStyle(TextDecoration.none),
                      ),
                    ),
                  ),
                  const Gap(20),
                  BlocListener<LoginCubit, LoginStates>(
                    listener: (context, state) {
                      if (state is LoginLoadingState) {
                        showLoadingDialog(context);
                      } else if (state is LoginSuccessState) {
                        Navigator.pop(context);
                      } else if (state is LoginErrorState) {
                        Navigator.pop(context);
                        showCustomDialog(
                          context,
                          message: state.error,
                          backgroundColor: AppColors.buttonColor,
                        );
                      }
                    },
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BlocProvider.of<LoginCubit>(context).login(
                            _emailController.text,
                            _passwordController.text,
                          );
                        }
                      },
                      color: AppColors.buttonColor,
                      text: "Sign In",
                      height: 50,
                      width: 200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.whiteColor),
                      ),
                      textColor: AppColors.whiteColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      pushRelacement(context, const SignupView());
                    },
                    child: Text(
                      'DON\'T HAVE AN ACCOUNT?',
                      style: getSmallStyle(TextDecoration.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
