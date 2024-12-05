import 'package:artgig/Utils/app_colors.dart';
import 'package:artgig/Utils/app_fonts.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    cardColor: AppColors.WHITE_COLOR,
    primaryColor: AppColors.PINK_COLOR,
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0, // Removes elevation splash when scrolling
      surfaceTintColor: AppColors.TRANSPARENT_COLOR, // Removes the tint effect
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.ORANGE_COLOR, fontFamily: AppFonts.JONES_BOLD),
      bodyMedium: TextStyle(
          color: AppColors.BLACK_COLOR, fontFamily: AppFonts.JONES_MEDIUM),
      bodySmall: TextStyle(
          color: AppColors.GREY_COLOR, fontFamily: AppFonts.JONES_REGULAR),
    ),
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
    cardColor: AppColors.BLACK_COLOR,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          color: AppColors.WHITE_COLOR, fontFamily: AppFonts.JONES_BOLD),
      bodyMedium: TextStyle(
          color: AppColors.WHITE_COLOR, fontFamily: AppFonts.JONES_MEDIUM),
      bodySmall: TextStyle(
          color: AppColors.GREY_COLOR, fontFamily: AppFonts.JONES_REGULAR),
    ),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0, // Removes elevation splash when scrolling
      surfaceTintColor: AppColors.TRANSPARENT_COLOR, // Removes the tint effect
    ),
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
