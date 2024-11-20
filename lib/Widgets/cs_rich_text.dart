import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';

class CustomRichTextWidget extends StatelessWidget {
  CustomRichTextWidget(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.fontFamily,
      this.fontSize});
  String firstText;
  String secondText;
  double? fontSize;
  String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          height: 2,
          color: AppColors.BLACK_COLOR,
        ),
        children: <TextSpan>[
          TextSpan(
              text: '$firstText ',
              style: TextStyle(
                fontSize: fontSize ?? 20.sp,
                fontFamily: fontFamily ?? AppFonts.MONTSERRAT_MEDIUM,
              )),
          TextSpan(
            text: secondText,
            style: TextStyle(
              color: AppColors.PINK_COLOR,
              fontSize: fontSize ?? 20.sp,
              fontFamily: fontFamily ?? AppFonts.MONTSERRAT_MEDIUM,
            ),
          ),
        ],
      ),
    );
  }
}
