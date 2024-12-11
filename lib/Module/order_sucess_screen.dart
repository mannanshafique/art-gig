import 'package:artgig/Utils/app_strings.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Common/Splash/Controller/splash_controller.dart';
import '../Utils/app_constants.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_navigation.dart';
import '../Utils/app_route_name.dart';
import '../Widgets/cs_bottom_navg_button.dart';
import '../Widgets/custom_scaffold.dart';
import '../Widgets/custom_text.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        bottomNavigationBar: CustomBottomNavigationWidget(
          buttonTitle: AppStrings.BACK_TO_HOME,
          onTap: () {
            AppNavigation.navigateToRemovingAll(
                context, AppRouteName.MAIN_MENU_SCREEN);
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            80.ph,
            Image.asset(
              AssetPaths.ORDER_SUCESS_ICON,
              height: 120.h,
            ),
            20.ph,
            CustomText(
              text: 'Order Sucessful!',
              fontColor: Constants.primaryTitleTextThemeColor(context: context),
              fontSize: 21.sp,
              maxLines: 1,
              fontFamily: AppFonts.JONES_BOLD,
            ),
            10.ph,
            CustomText(
              text: AppStrings.loremIpsum,
              fontColor: Constants.primaryTextThemeColor(context: context),
              fontSize: 16.sp,
              maxLines: 2,
              lineSpacing: 1.2,
              fontFamily: AppFonts.JONES_REGULAR,
            ),
          ],
        ));
  }
}
