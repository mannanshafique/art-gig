import 'dart:io';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/app_fonts.dart';
import '../../Utils/app_strings.dart';
import '../../Utils/asset_paths.dart';
import '../custom_text.dart';
import 'bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final bottomNavigationController =
      Get.isRegistered<BottomNavigationController>()
          ? Get.find<BottomNavigationController>()
          : Get.put(BottomNavigationController());

  BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        color: AppColors.WHITE_COLOR,
        // padding: EdgeInsets.fromLTRB(0.04.sw, 2, 0.04.sw, 10),
        height: Platform.isIOS ? 0.24.sw : 0.21.sw,
        width: 1.sw,
        child: bottomBar()));
  }

  Widget bottomCustomButton(
      {required Function() onPressed,
      required String iconPath,
      required String title,
      required bool isSelected}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: AppColors.TRANSPARENT_COLOR,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              iconPath,
              height: 18.h,
              width: 18.h,
              color: isSelected ? AppColors.BLACK_COLOR : AppColors.GREY_COLOR,
            ),
            5.ph,
            CustomText(
              text: title,
              fontColor:
                  isSelected ? AppColors.BLACK_COLOR : AppColors.GREY_COLOR,
              fontSize: 14.sp,
              fontFamily: isSelected
                  ? AppFonts.MONTSERRAT_BOLD
                  : AppFonts.MONTSERRAT_REGULAR,
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Row(
      children: <Widget>[
        //!-----Home
        Expanded(
          child: bottomCustomButton(
              iconPath: AssetPaths.HOME_ICON,
              onPressed: () {
                bottomNavigationController.onItemTap(0);
              },
              title: AppStrings.HOME,
              isSelected:
                  bottomNavigationController.selectedIndex == 0 ? true : false),
        ),
        Expanded(
          child: bottomCustomButton(
              iconPath: AssetPaths.WHISHLIST_ICON,
              onPressed: () {
                bottomNavigationController.onItemTap(1);
              },
              title: AppStrings.WHISHLIST,
              isSelected:
                  bottomNavigationController.selectedIndex == 1 ? true : false),
        ),
        30.pw,
        Expanded(
          child: bottomCustomButton(
              iconPath: AssetPaths.CALENDER_ICON,
              onPressed: () {
                bottomNavigationController.onItemTap(2);
              },
              title: AppStrings.CALENDER,
              isSelected:
                  bottomNavigationController.selectedIndex == 2 ? true : false),
        ),
        Expanded(
          child: bottomCustomButton(
              iconPath: AssetPaths.CIRCULAR_PROFILE_ICON,
              onPressed: () {
                bottomNavigationController.onItemTap(3);
              },
              title: AppStrings.PROFILE,
              isSelected:
                  bottomNavigationController.selectedIndex == 3 ? true : false),
        ),
      ],
    );
  }
}
