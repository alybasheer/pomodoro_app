import 'package:flutter/material.dart';
import 'package:pomodoro/utility/constants/app_colors.dart';

class LTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.primaryColor,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 48,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor,
    ),
  );
}
