import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tennis_ai_app/auth_view.dart';
import 'package:tennis_ai_app/core/function/routing.dart';
import 'package:tennis_ai_app/core/utils/assets.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      pushRelacement(context, const AuthView());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Appassets.logo),
              const Gap(20),
              const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ));
  }
}
