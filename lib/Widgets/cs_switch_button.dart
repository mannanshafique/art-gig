// ignore_for_file: must_be_immutable

import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import '../Utils/asset_paths.dart';
import 'custom_text.dart';

class CustomSwitchButtonWidget extends StatelessWidget {
  CustomSwitchButtonWidget(
      {required this.isSwitch,
      required this.onToggle,
      required this.title,
      this.activeColor,
      this.fontColor,
      this.fontFamily,
      this.fontSize,
      this.isIcon,
      super.key});
  String title;
  bool isSwitch;
  final bool? isIcon;
  final Function(bool)? onToggle;
  final Color? activeColor, fontColor;
  final String? fontFamily;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isIcon == true
            ? Image.asset(
                AssetPaths.CIRCULAR_CROSS_ICON,
                height: 22.h,
              )
            : const SizedBox.shrink(),
        isIcon == true ? 10.pw : 0.pw,
        Expanded(
          child: CustomText(
            text: title,
            fontColor: fontColor ?? AppColors.WHITE_COLOR,
            fontSize: fontSize ?? 15.sp,
            textAlign: TextAlign.start,
            fontFamily: fontFamily ?? AppFonts.JONES_REGULAR,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: CupertinoSwitch(
            activeColor: activeColor ?? AppColors.WHITE_COLOR,
            value: isSwitch,
            onChanged: onToggle,
          ),
        ),
      ],
    );
  }
}
