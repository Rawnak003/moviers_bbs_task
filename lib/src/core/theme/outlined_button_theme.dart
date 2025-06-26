import 'package:flutter/material.dart';

import '../constant/colors.dart';

class AppOutlinedButtonTheme {
  static OutlinedButtonThemeData get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          color: AppColors.greyColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fixedSize: Size.fromHeight(50),
        elevation: 4,
      ),
    );
  }
}