import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import 'custom_text.dart';

class CustomRowDataWithDivider extends StatelessWidget {
  const CustomRowDataWithDivider({
    super.key,
    required this.data,
    required this.title,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        4.ph,
        Row(
          children: [
            CustomText(
              text: title,
              fontColor: AppColors.PINK_COLOR,
              fontSize: 16.sp,
              fontFamily: AppFonts.JONES_MEDIUM,
            ),
            5.pw,
            Expanded(
              child: CustomText(
                textAlign: TextAlign.end,
                text: data,
                fontColor: AppColors.BLACK_COLOR,
                fontSize: 15.sp,
                fontFamily: AppFonts.JONES_LIGHT,
              ),
            ),
          ],
        ),
        4.ph,
      ],
    );
  }
}
