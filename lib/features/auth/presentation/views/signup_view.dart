import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tennis_ai_app/core/function/email_validate.dart';
import 'package:tennis_ai_app/core/function/routing.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';
import 'package:tennis_ai_app/core/utils/text_style.dart';
import 'package:tennis_ai_app/core/widgets/custom_dialog.dart';
import 'package:tennis_ai_app/core/widgets/custom_elev_button.dart';
import 'package:tennis_ai_app/core/widgets/custom_txt_frm_field.dart';
import 'package:tennis_ai_app/core/widgets/show_custom_loading_dialog.dart';
import 'package:tennis_ai_app/features/auth/presentation/manager/cubit/signup_cubit.dart';
import 'package:tennis_ai_app/features/auth/presentation/manager/states/signup_states.dart';
import 'package:tennis_ai_app/features/auth/presentation/views/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _displayName.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          showLoadingDialog(context);
        } else if (state is SignUpSuccessState) {
          Navigator.pop(context);
          log('done');
        } else if (state is SignUpErrorState) {
          Navigator.pop(context);
          log(state.error);
          showCustomDialog(
            context,
            message: state.error,
            backgroundColor: AppColors.buttonColor,
          );
        }
      },
      child: Scaffold(
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
                      'SIGN UP',
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
                      controller: _displayName,
                      labelText: 'Full Name',
                      validator: (value) {
                        if (value!.isEmpty) return 'Enter your name';
                        return null;
                      },
                    ),
                    const Gap(20),
                    CustomTextFormField(
                      controller: _emailController,
                      labelText: 'Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your email';
                        }  else {
                          return null;
                        }
                      },
                    ),
                    const Gap(20),
                    CustomTextFormField(
                      controller: _passwordController,
                      labelText: 'Password',
                      validator: (value) {
                        if (value!.isEmpty) return 'Enter your password';
                        return null;
                      },
                    ),
                    const Gap(10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: getSmallStyle(TextDecoration.none),
                        ),
                      ),
                    ),
                    const Gap(20),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String email = _emailController.text.trim();
                          String password = _passwordController.text;
                            BlocProvider.of<SignUpCubit>(context).signUp(
                              _displayName.text,
                              email,
                              password,
                            );

                          // if (emailValidate(email)) {
                          
                          // } 
                          // else {
                          //   showCustomDialog(
                          //     context,
                          //     message: 'Please enter a valid email',
                          //     backgroundColor: AppColors.buttonColor,
                          //   );
                          // }
                        }
                      },
                      color: AppColors.buttonColor,
                      text: "Sign Up",
                      height: 50,
                      width: 200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: AppColors.whiteColor),
                      ),
                      textColor: AppColors.whiteColor,
                    ),
                    TextButton(
                      onPressed: () {
                        pushRelacement(context, const LoginView());
                      },
                      child: Text(
                        ' HAVE AN ACCOUNT ?',
                        style: getSmallStyle(TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
