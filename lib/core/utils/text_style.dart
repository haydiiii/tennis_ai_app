import 'package:flutter/material.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';

TextStyle getTitleStyle({
  Color? color,
  FontWeight? fontWeight,
  double? fontsize,
}) {
  return TextStyle(
    fontSize: fontsize ?? 25,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? AppColors.primaryColor,
  );
}

TextStyle getBodyStyle(
    {Color? color, FontWeight? fontWeight, double? fontsize}) {
  return TextStyle(
    fontSize: fontsize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.blackColor,
  );
}

TextStyle getSmallStyle(
  TextDecoration? decoration, {
  Color? color,
  FontWeight? fontWeight,
  double? fontsize,
}) {
  return TextStyle(
    decoration: decoration ?? TextDecoration.lineThrough,
    fontSize: fontsize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
    color: color ?? AppColors.buttonColor,
  );
}
