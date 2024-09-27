import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';
import 'package:tennis_ai_app/core/utils/text_style.dart';
import 'package:tennis_ai_app/core/widgets/custom_dialog.dart';
import 'package:tennis_ai_app/core/widgets/custom_elev_button.dart';
import 'package:tennis_ai_app/core/widgets/custom_txt_frm_field.dart';
import 'package:tennis_ai_app/core/widgets/show_custom_loading_dialog.dart';
import 'package:tennis_ai_app/features/auth/presentation/manager/cubit/login_cubit.dart';
import 'package:tennis_ai_app/features/auth/presentation/manager/states/login_states.dart';

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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: BlocListener<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              showLoadingDialog(context);
            } else if (state is LoginSuccessState) {
              Navigator.of(context).pop();
              log('done');
            } else if (state is LoginErrorState) {
              Navigator.of(context).pop();
              log(state.error);
              showCustomDialog(
                context,
                message: state.error,
                backgroundColor: AppColors.buttonColor,
              );
            }
          },
          child: Builder( // <-- Use Builder to access the correct context
            builder: (context) => Center(
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
                        CustomElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              BlocProvider.of<LoginCubit>(context).login(
                                  _emailController.text, _passwordController.text);
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
