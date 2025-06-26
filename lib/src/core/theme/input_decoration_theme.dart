import 'package:flutter/material.dart';

import '../../app/app_spacing.dart';
import '../constant/colors.dart';

class AppInputDecoration {
  static InputDecorationTheme get inputDecoration {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.horizontalPadding,
      ),
      hintStyle: TextStyle(color: AppColors.greyColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.greyColor),
      ),
    );
  }
}