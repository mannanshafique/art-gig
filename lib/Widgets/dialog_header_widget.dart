import 'package:artgig/Utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import 'custom_text.dart';

class DialogHeaderWidget extends StatelessWidget {
  const DialogHeaderWidget({super.key, required this.headerText});
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
      decoration: BoxDecoration(
          color: Constants.isDarkTheme(context: context) ? AppColors.PINK_COLOR : AppColors.ORANGE_COLOR,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.03.sw),
              topRight: Radius.circular(0.03.sw))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: CustomText(
              text: headerText,
              fontColor: AppColors.WHITE_COLOR,
              fontSize: 16.sp,
              fontFamily: AppFonts.JONES_BOLD,
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: const BoxDecoration(
                  color: AppColors.WHITE_COLOR, shape: BoxShape.circle),
              child: const Icon(
                Icons.close,
                size: 20,
                color: AppColors.BLACK_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
