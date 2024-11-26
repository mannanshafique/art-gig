import 'dart:ui';

import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widgets/custom_text.dart';
import 'app_colors.dart';
import 'app_fonts.dart';
import 'asset_paths.dart';

class AppBottomSheet {
  Future showCustomBottomSheetWithHeight({
    context,
    required double bottomSheetHeight,
    required Widget sheetBody,
    bool? isScrollControlled,
  }) {
    return showModalBottomSheet<void>(
        isScrollControlled: isScrollControlled ?? false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0.04.sw),
          ),
        ),
        backgroundColor: AppColors.WHITE_COLOR,
        context: context,
        builder: (context) {
          return SizedBox(
            height: bottomSheetHeight,
            child: Padding(
                padding: EdgeInsets.all(0.04.sw),
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.LIGHT_GREY_COLOR,
                        borderRadius: BorderRadius.circular(12.r)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12.0),
                    child: sheetBody)),
          );
        });
  }

//!---Use in Gifty APp ---Likes/Select Friend / Following
  Future showCustomBottomSheetWithMaxHeight({
    context,
    required double bottomSheetHeight,
    required Widget sheetBody,
    String? title,
    bool? isSuffix,
    bool? isScrollControlled,
  }) {
    return showModalBottomSheet<void>(
        isScrollControlled: isScrollControlled ?? false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0.04.sw),
          ),
        ),
        backgroundColor: AppColors.WHITE_COLOR,
        context: context,
        builder: (context) {
          return SizedBox(
            height: bottomSheetHeight,
            child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 14),
                child: Column(
                  children: [
                    title == null
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              Expanded(
                                child: CustomText(
                                  text: title,
                                  fontSize: 16.sp,
                                  fontColor: AppColors.BLACK_COLOR,
                                  fontFamily: AppFonts.JONES_BOLD,
                                ),
                              ),
                              isSuffix ?? false
                                  ? Image.asset(
                                      AssetPaths.FORWARD_ARROW_ICON,
                                      color: AppColors.BLACK_COLOR,
                                      height: 16.h,
                                    )
                                  : const SizedBox.shrink()
                            ],
                          ),
                    10.ph,
                    Container(
                        decoration: BoxDecoration(
                            color: AppColors.LIGHT_GREY_COLOR,
                            borderRadius: BorderRadius.circular(12.r)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 12.0),
                        child: sheetBody),
                  ],
                )),
          );
        });
  }

  Future showCustomCommentBottomSheet({
    context,
    required Widget sheetBody,
    bool? isScrollControlled,
  }) {
    return showModalBottomSheet<void>(
        isScrollControlled: isScrollControlled ?? false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(0.04.sw),
          ),
        ),
        backgroundColor: AppColors.WHITE_COLOR,
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  right: 0.02.sw,
                  left: 0.02.sw),
              child: sheetBody,
            ),
          );
        });
  }
}
