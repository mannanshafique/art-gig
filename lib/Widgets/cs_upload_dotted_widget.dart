import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_strings.dart';
import '../Utils/asset_paths.dart';
import 'cs_dotted_button.dart';
import 'custom_text.dart';

class CustomUploadDotted extends StatelessWidget {
  const CustomUploadDotted({super.key, required this.onTap, this.title});

  final Function() onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomDottedBorder(
          widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          10.ph,
          Image.asset(AssetPaths.UPLOAD_ICON, scale: 3.4),
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: title ?? AppStrings.IMAGE_UPLOAD,
                fontColor: AppColors.PINK_COLOR,
                fontSize: 15.sp,
                fontFamily: AppFonts.JONES_MEDIUM,
              ),
            ],
          ),
          10.ph,
        ],
      )),
    );
  }
}
