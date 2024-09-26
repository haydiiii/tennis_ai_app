import 'package:flutter/material.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';
import 'package:tennis_ai_app/core/utils/text_style.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    super.key,
    required this.labelText, required TextEditingController controller, this.validator,
  });
  final String labelText;
  final TextEditingController controller = TextEditingController();
    final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: getSmallStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
            TextDecoration.none,
            fontsize: 20),
        filled: true,
        fillColor: AppColors.bkgroundtxtffield,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
