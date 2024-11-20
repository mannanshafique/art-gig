import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_padding.dart';
import '../Utils/app_size.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Color containerColor, fontColor, borderColor;
  final bool withBoxShadow, isGradientBg;
  final double? fontSize, horizontalPadding, width;
  final double? verticalPadding;
  final double? borderRadius;
  final String? fontFamily;
  // final FontWeight? fontWeight;
  final bool? haveIcon;
  final bool? haveIconOnLeft;
  final String? iconPath;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.haveIconOnLeft,
    //  this.containerColor = AppColors.buttonColor,
    this.borderColor = AppColors.TRANSPARENT_COLOR,
    this.withBoxShadow = false,
    this.isGradientBg = true,
    this.horizontalPadding = 5,
    this.fontSize,
    this.containerColor = AppColors.BLACK_COLOR,
    this.width = AppSize.fullScreenWidth,
    this.verticalPadding,
    // this.fontFamily = AppFonts.openSansSemiBold,
    this.fontFamily,
    // this.fontWeight,
    this.fontColor = AppColors.WHITE_COLOR,
    this.haveIcon,
    this.borderRadius,
    this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(
                borderRadius ?? AppPadding.buttonBorder.r),
            border: Border.all(color: borderColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? AppPadding.buttonVerticalPadding),
          child: haveIcon == true
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    haveIconOnLeft == true
                        ? Image.asset(
                            iconPath ?? '',
                            height: 20.0,
                            width: 20.0,
                            color: fontColor,
                          )
                        : const SizedBox.shrink(),
                    15.pw,
                    haveIconOnLeft == null
                        ? Expanded(
                            child: CustomText(
                              text: title,
                              textAlign: TextAlign.start,
                              fontSize: fontSize ?? 16.sp,
                              fontColor: fontColor,
                              fontFamily:
                                  fontFamily ?? AppFonts.MONTSERRAT_MEDIUM,
                            ),
                          )
                        : CustomText(
                            text: title,
                            textAlign: TextAlign.start,
                            fontSize: fontSize ?? 16.sp,
                            fontColor: fontColor,
                            fontFamily:
                                fontFamily ?? AppFonts.MONTSERRAT_MEDIUM,
                          ),
                    10.pw,
                    haveIconOnLeft == true
                        ? SizedBox.shrink()
                        : Image.asset(
                            iconPath ?? '',
                            scale: 4,
                            color: fontColor,
                          ),
                    15.pw
                  ],
                )
              : Center(
                  child: CustomText(
                    text: title,
                    fontSize: fontSize ?? 16.sp,
                    fontColor: fontColor,
                    fontFamily: fontFamily ?? AppFonts.MONTSERRAT_MEDIUM,
                  ),
                ),
        ),
      ),
    );
  }
}
