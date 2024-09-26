import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tennis_ai_app/core/utils/constants.dart';
import 'package:tennis_ai_app/core/utils/text_style.dart';


showLoadingDialog(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: AlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                //  const Gap(25),
                const CircularProgressIndicator(),
                const Gap(10),
                Text(
                  "Loading...",
                  style: getBodyStyle(),
                ),
                // const Gap(25),
              ],
            ),
          ),
        ),
      );
    },
    barrierColor: AppColors.primaryColor.withOpacity(0.3),
    barrierDismissible: false,
  );
}
