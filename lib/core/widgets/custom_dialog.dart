
import 'package:flutter/material.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';
import 'package:tennis_ai_app/core/utils/text_style.dart';


showCustomDialog(context, {required String message, Color? backgroundColor}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: getBodyStyle(color: AppColors.whiteColor),
      ),
      backgroundColor: backgroundColor ?? AppColors.buttonColor,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))));
}
