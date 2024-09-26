import 'package:flutter/material.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';
import 'package:tennis_ai_app/core/utils/text_style.dart';


class CustomElevatedButton extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.text,
    required this.height,
    required this.width,
    required this.shape,
    required this.textColor,
  });
  final Function() onPressed;
  final Color color;
  final String text;
  final double? height;
  final double? width;
  final ShapeBorder shape;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: textColor ?? AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(),
            ),
            backgroundColor: color,
          ),
          child: Text(text,
              style: getBodyStyle(
                  fontWeight: FontWeight.bold, color: AppColors.whiteColor))),
    );
  }
}
