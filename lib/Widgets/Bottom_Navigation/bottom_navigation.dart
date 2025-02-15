import 'dart:io';
import 'package:artgig/Common/Role_Selection/Controller/role_controller.dart';
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
        decoration: BoxDecoration(
            color: AppColors.BLUE_COLOR,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            )),
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
              height: 22.h,
              width: 22.h,
              color: isSelected
                  ? AppColors.WHITE_COLOR
                  : AppColors.WHITE_COLOR.withOpacity(0.7),
            ),
            5.ph,
            CustomText(
              text: title,
              fontColor: isSelected
                  ? AppColors.WHITE_COLOR
                  : AppColors.WHITE_COLOR.withOpacity(0.7),
              fontSize: 14.sp,
              fontFamily:
                  isSelected ? AppFonts.JONES_BOLD : AppFonts.JONES_REGULAR,
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
              isSelected: bottomNavigationController.selectedIndex.value == 0
                  ? true
                  : false),
        ),
        Expanded(
          child: bottomCustomButton(
              iconPath: AssetPaths.CALENDER_ICON,
              onPressed: () {
                bottomNavigationController.onItemTap(1);
              },
              title: AppStrings.EVENTS,
              isSelected: bottomNavigationController.selectedIndex.value == 1
                  ? true
                  : false),
        ),
        Expanded(
          child: bottomCustomButton(
              iconPath: AssetPaths.PROFILE_ICON,
              onPressed: () {
                bottomNavigationController.onItemTap(2);
              },
              title: AppStrings.PROFILE,
              isSelected: bottomNavigationController.selectedIndex.value == 2
                  ? true
                  : false),
        ),
        Expanded(
          child: bottomCustomButton(
              iconPath: AssetPaths.SETTING_ICON,
              onPressed: () {
                bottomNavigationController.onItemTap(3);
              },
              title: AppStrings.SETTINGS,
              isSelected: bottomNavigationController.selectedIndex.value == 3
                  ? true
                  : false),
        ),
        if (RoleController.i.selectedRole.value == AppStrings.ARTIST)
          Expanded(
            child: bottomCustomButton(
                iconPath: AssetPaths.WALLET_ICON,
                onPressed: () {
                  bottomNavigationController.onItemTap(4);
                },
                title: AppStrings.WALLET,
                isSelected: bottomNavigationController.selectedIndex.value == 4
                    ? true
                    : false),
          ),
      ],
    );
  }
}
