import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import 'custom_button.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  const CustomBottomNavigationWidget(
      {super.key, required this.buttonTitle, required this.onTap, this.color});
  final String buttonTitle;
  final Function() onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(bottom: 20.h, top: 5.h),
      child: CustomButton(
        fontSize: 17.sp,
        title: buttonTitle,
        fontFamily: AppFonts.JONES_MEDIUM,
        onTap: onTap,
        containerColor: color ?? AppColors.BLACK_COLOR,
        verticalPadding: 0.0,
      ),
    );
  }
}
