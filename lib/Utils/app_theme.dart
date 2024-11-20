import 'package:artgig/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.PINK_COLOR,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.WHITE_COLOR,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.PINK_COLOR,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.BLACK_COLOR,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
