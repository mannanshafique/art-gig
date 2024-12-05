import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_navigation.dart';
import '../Utils/asset_paths.dart';
import 'custom_text.dart';

AppBar customAppBar(
    {String? title,
    bool? isLeadingBack,
    required BuildContext context,
    Widget? actionWidget,
    Widget? leadingWidget,
    Function()? onTap}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: AppColors.TRANSPARENT_COLOR,
    leading: GestureDetector(
        onTap: onTap ??
            () {
              AppNavigation.navigatorPop(context);
            },
        child: leadingWidget ??
            Container(
              // padding: const EdgeInsets.all(4.0),
              child: isLeadingBack == true
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        AssetPaths.BACK_ARROW_ICON,
                        color: Theme.of(context).textTheme.bodyMedium?.color ??
                            AppColors.BLACK_COLOR,
                      ),
                    )
                  : const SizedBox.shrink(),
            )),
    centerTitle: true,
    title: CustomText(
      text: title,
      fontColor: Theme.of(context).textTheme.bodyMedium?.color ??
          AppColors.BLACK_COLOR,
      fontSize: 18.sp,
      fontFamily: AppFonts.JONES_BOLD,
    ),
    actions: [actionWidget ?? const SizedBox.shrink()],
  );
}
