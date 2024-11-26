import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_fonts.dart';
import '../../Utils/app_navigation.dart';
import '../custom_alert_dialog.dart';
import '../custom_button.dart';
import '../custom_text.dart';

class CustomOptionsAlertDialogue extends StatelessWidget {
  const CustomOptionsAlertDialogue(
      {super.key,
      required this.headertitle,
      required this.title,
      this.b1Text,
      this.b2Text,
      this.b1onTap,
      required this.imagePath,
      required this.haveTwoButton,
      this.b2onTap});

  final String title;
  final String headertitle;
  final String? b1Text;
  final String? b2Text;
  final Function()? b1onTap;
  final Function()? b2onTap;
  final String? imagePath;
  final bool haveTwoButton;
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      headerText: headertitle,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: haveTwoButton == true ? 20.w : 0.0),
        child: Column(
          children: [
            20.ph,
            if (imagePath != null)
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.BLACK_COLOR,
                ),
                height: 100.h,
                width: 100.h,
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(
                  imagePath ?? '',
                  color: AppColors.WHITE_COLOR,
                ),
              ),
            20.ph,
            CustomText(
              text: title,
              fontColor: AppColors.BLACK_COLOR,
              fontSize: 15.sp,
              lineSpacing: 1.3,
              textAlign: TextAlign.center,
              fontFamily: AppFonts.JONES_MEDIUM,
            ),
            30.ph,
            haveTwoButton
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomButton(
                              title: b1Text ?? '',
                              containerColor: AppColors.BLACK_COLOR,
                              fontColor: AppColors.WHITE_COLOR,
                              borderRadius: 50.0,
                              fontSize: 14.sp,
                              onTap: b1onTap ??
                                  () {
                                    AppNavigation.navigatorPop(context);
                                  },
                            ),
                          ),
                          12.pw,
                          Expanded(
                            child: CustomButton(
                              title: b2Text ?? '',
                              borderRadius: 50.0,
                              fontSize: 14.sp,
                              borderColor: AppColors.BLACK_COLOR,
                              containerColor: AppColors.WHITE_COLOR,
                              fontColor: AppColors.BLACK_COLOR,
                              onTap: b2onTap ?? () {},
                            ),
                          ),
                        ],
                      ),
                      15.ph,
                    ],
                  )
                : GestureDetector(
                    onTap: b1onTap ??
                        () {
                          AppNavigation.navigatorPop(context);
                        },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 10.h),
                      decoration: BoxDecoration(
                          color: AppColors.YELLOW_COLOR,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.025.sw),
                              bottomRight: Radius.circular(0.025.sw))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: CustomText(
                              text: b1Text ?? '',
                              fontColor: AppColors.WHITE_COLOR,
                              fontSize: 15.sp,
                              fontFamily: AppFonts.JONES_LIGHT,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
