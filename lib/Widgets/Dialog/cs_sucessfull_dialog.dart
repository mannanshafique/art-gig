import 'package:artgig/Utils/app_route_name.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_fonts.dart';
import '../../Utils/app_navigation.dart';
import '../../Utils/app_strings.dart';
import '../../Utils/asset_paths.dart';
import '../custom_alert_dialog.dart';
import '../custom_button.dart';
import '../custom_text.dart';

class CustomSucessfullDialog extends StatelessWidget {
  const CustomSucessfullDialog({
    Key? key,
    required this.headerTitle,
    required this.title,
  }) : super(key: key);

  final String headerTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
        headerText: headerTitle,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              20.ph,
              Image.asset(
                AssetPaths.CIRCULAR_TICK_ICON,
                scale: 3,
                color: AppColors.ORANGE_COLOR,
              ),
              20.ph,
              CustomText(
                text: title.capitalizeFirst,
                fontSize: 15.sp,
                lineSpacing: 1.2,
                maxLines: 2,
                fontColor: AppColors.BLACK_COLOR,
                fontFamily: AppFonts.JONES_MEDIUM,
              ),
              20.ph,
              CustomButton(
                title: AppStrings.CONTINUE,
                containerColor: AppColors.PINK_COLOR,
                onTap: () {
                  AppNavigation.navigatorPop(context);
                  AppNavigation.navigateToRemovingAll(
                      context, AppRouteName.MAIN_MENU_SCREEN);
                },
              ),
              20.ph,
            ],
          ),
        ));
  }
}
