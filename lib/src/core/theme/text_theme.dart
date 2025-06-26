import 'package:flutter/material.dart';

import '../constant/colors.dart';

class AppTextTheme {
  static TextTheme get appTextTheme {
    return TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        color: AppColors.greyColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColors.greyColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
