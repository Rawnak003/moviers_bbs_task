import 'package:flutter/material.dart';
import '../constant/colors.dart';

class AppElevatedButtonTheme {
  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.whiteColor,
        fixedSize: Size.fromHeight(50),
        textStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
