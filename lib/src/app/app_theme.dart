import 'package:flutter/material.dart';

import '../core/constant/colors.dart';
import '../core/theme/elevated_button_theme.dart';
import '../core/theme/input_decoration_theme.dart';
import '../core/theme/outlined_button_theme.dart';
import '../core/theme/text_theme.dart';

class AppTheme {
  static const Color primaryColor = AppColors.primaryColor;

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.appTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonTheme,
    inputDecorationTheme: AppInputDecoration.inputDecoration,
    outlinedButtonTheme: AppOutlinedButtonTheme.outlinedButtonTheme,
  );
}