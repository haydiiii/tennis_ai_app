import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tennis_ai_app/core/function/routing.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';
import 'package:tennis_ai_app/core/widgets/custom_elev_button.dart';
import 'package:tennis_ai_app/features/auth/presentation/views/login_view.dart';
import 'package:tennis_ai_app/features/auth/presentation/views/signup_view.dart';


class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                ),
              ),
            ],
          ),
          const Gap(140),
          CustomElevatedButton(
            onPressed: () {
              pushRelacement(context, const LoginView());
            },
            color: AppColors.buttonColor,
            text: "SignIn",
            height: 50,
            width: 200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors.whiteColor),
            ),
            textColor: AppColors.whiteColor,
          ),
          const Gap(20),
          CustomElevatedButton(
            onPressed: () {
              pushRelacement(context, const SignupView());
            },
            color: AppColors.whiteColor,
            text: "SignUp",
            height: 50,
            width: 200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: AppColors.blackColor),
            ),
            textColor: AppColors.blackColor,
          ),
        ],
      ),
    );
  }
}
