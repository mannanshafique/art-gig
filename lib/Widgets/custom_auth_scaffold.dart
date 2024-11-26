import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_navigation.dart';
import '../Utils/asset_paths.dart';
import 'custom_logo.dart';
import 'custom_text.dart';

class CustomAuthScaffold extends StatelessWidget {
  final String? title, subtitle, appBarTitle;
  final Widget child;
  final bool? showLogo;
  final double? height;
  final bool? isLeading;
  final Function()? onLeadingTap;
  final Widget? bottomNavigationWidget;
  const CustomAuthScaffold({
    Key? key,
    this.title,
    this.appBarTitle,
    this.subtitle,
    this.onLeadingTap,
    this.height,
    this.isLeading,
    this.showLogo = true,
    this.bottomNavigationWidget,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    Theme.of(context).brightness == Brightness.dark
                        ? AssetPaths.BACKGROUNG_DARK_SPLASH_IMAGE
                        : AssetPaths.BACKGROUNG_LIGHT_SPLASH_IMAGE),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Container(
              height: 1.sh,
              width: 1.sw,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.WHITE_COLOR.withOpacity(0.5)
                  : AppColors.BLACK_COLOR.withOpacity(0.05),
            ),
            Scaffold(
              backgroundColor: AppColors.TRANSPARENT_COLOR,
              bottomNavigationBar: bottomNavigationWidget,
              appBar: AppBar(
                elevation: 0.0,
                centerTitle: true,
                title: CustomText(
                  text: appBarTitle,
                  fontSize: 16.sp,
                  fontColor: Theme.of(context).textTheme.bodyLarge?.color,
                  fontFamily: AppFonts.JONES_BOLD,
                ),
                backgroundColor: AppColors.TRANSPARENT_COLOR,
                leading: isLeading == true
                    ? GestureDetector(
                        onTap: onLeadingTap ??
                            () {
                              AppNavigation.navigatorPop(context);
                            },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            AssetPaths.BACK_ARROW_ICON,
                            color: Theme.of(context).iconTheme.color,
                          ),
                        ))
                    : const SizedBox.shrink(),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    if (showLogo == true) ...[
                      30.ph,
                      CustomLogo(
                        width: 240.h,
                      ),
                      20.ph,
                      title != null
                          ? Column(
                              children: [
                                10.ph,
                                CustomText(
                                  text: title,
                                  fontSize: 20.sp,
                                  fontColor: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                  fontFamily: AppFonts.JONES_BOLD,
                                ),
                                12.ph,
                                CustomText(
                                  text: subtitle,
                                  fontSize: 14.sp,
                                  lineSpacing: 1.3,
                                  fontColor: AppColors.WHITE_COLOR,
                                  fontFamily: AppFonts.JONES_MEDIUM,
                                ),
                                10.ph,
                              ],
                            )
                          : const SizedBox.shrink(),
                    ],
                    child,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
