import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_theme.dart';

class LightTheme {
  static ThemeData lighttheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffffffff),
    primaryColor: LColors.primaryColor,
    textTheme: LTextTheme.lightTextTheme,
  //   elevatedButtonTheme :ElevatedButtonThemeData(style: ButtonStyle(shape: WidgetStateProperty.all(Radius.circular(7))))) ,
  );
}