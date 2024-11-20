import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_strings.dart';
import 'custom_text.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget(
      {super.key, this.title, this.height, this.havingScroll});

  final String? title;
  final double? height;
  final bool? havingScroll;

  @override
  Widget build(BuildContext context) {
    return havingScroll == true
        ? SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            child: SizedBox(
              height: height,
              child: Center(
                child: CustomText(
                  text: title ?? AppStrings.NO_DATA_FOUND_TEXT,
                  fontColor: AppColors.BLACK_COLOR,
                  fontSize: 15.sp,
                  fontFamily: AppFonts.MONTSERRAT_MEDIUM,
                  textAlign: TextAlign.center,
                ),
              ),
            ))
        : Container(
            height: height ?? null,
            child: Center(
              child: CustomText(
                text: title ?? AppStrings.NO_DATA_FOUND_TEXT,
                fontColor: AppColors.BLACK_COLOR,
                fontSize: 14.sp,
                fontFamily: AppFonts.MONTSERRAT_MEDIUM,
                textAlign: TextAlign.center,
              ),
            ),
          );
  }
}
