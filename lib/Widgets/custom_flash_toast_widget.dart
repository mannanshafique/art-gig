import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import 'custom_text.dart';

class FlushBar {
  Future<void> showFlushBar(context, text, {color, fromWhere}) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      barBlur: 10,
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: AppColors.RED_COLOR,
      messageText: CustomText(
        text: text,
        fontSize: 16.sp,
        textAlign: TextAlign.start,
        fontFamily: AppFonts.JONES_MEDIUM,
        fontColor: AppColors.WHITE_COLOR,
      ),
      blockBackgroundInteraction: true,
      duration: const Duration(milliseconds: 2000),
    ).show(context);
  }
}
