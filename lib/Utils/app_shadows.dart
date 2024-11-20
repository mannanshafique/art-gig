import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadow {
  static List<BoxShadow>? boxShadow() {
    return [
      BoxShadow(
        color: AppColors.BLACK_COLOR.withOpacity(0.05),
        //offset: const Offset(1.0, 0),
        blurRadius: 2,
        spreadRadius: 2,
      ),
    ];
  }
}
