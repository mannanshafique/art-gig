import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Common/Auth/Model/user_model.dart';
import '../Utils/app_backdrop_filter.dart';
import '../Utils/app_colors.dart';
import '../Utils/app_dialogs.dart';
import '../Utils/app_fonts.dart';
import '../Utils/app_navigation.dart';
import '../Utils/app_strings.dart';
import '../Utils/asset_paths.dart';
import 'custom_text.dart';
import 'user_avatar_widget.dart';

class CustomDrawerWidget extends StatelessWidget {
  CustomDrawerWidget({super.key, this.scffoldKey});

  // final RoleController roleController = Get.find<RoleController>();
  final GlobalKey<ScaffoldState>? scffoldKey;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: CustomBlurFilter.getBlurFilter(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.76,
        decoration: const BoxDecoration(
            color: AppColors.BLACK_COLOR,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        child: Drawer(
          backgroundColor: AppColors.TRANSPARENT_COLOR,
          shadowColor: AppColors.TRANSPARENT_COLOR,
          surfaceTintColor: AppColors.TRANSPARENT_COLOR,
          elevation: 0.0,
          child: SafeArea(
            child: Column(
              children: [
                _headerDrawer(),
                25.ph,
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.WHITE_COLOR,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20.0))),
                    child: SingleChildScrollView(
                        child: drawerItems(context: context)),
                  ),
                ),
                // 40.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }

//User Account Header Drawer

  Widget _headerDrawer() {
    UserDataModel? userDataModel = UserDataModel();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        10.ph,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
                onTap: () {
                  scffoldKey?.currentState!.closeDrawer();
                },
                child: Image.asset(
                  AssetPaths.CIRCULAR_CROSS_ICON,
                  color: AppColors.WHITE_COLOR,
                  height: 22.h,
                )),
            10.pw,
          ],
        ),
        10.ph,
        CustomCicrleAvatarWidget(
          isExtendedImage: true,
          circularColor: AppColors.WHITE_COLOR,
          imgPath: userDataModel?.imageName ?? '',
          radius: 90.h,
        ),
        8.ph,
        CustomText(
          text: 'John Smith',
          fontColor: AppColors.WHITE_COLOR,
          fontSize: 16.sp,
          fontFamily: AppFonts.JONES_BOLD,
        ),
        8.ph,
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: CustomText(
            text: 'john.smith@example.com',
            fontColor: AppColors.LIGHT_GREY_COLOR,
            fontSize: 14.sp,
            fontFamily: AppFonts.JONES_REGULAR,
          ),
        ),
      ],
    );
  }

// Drawer Body

  Widget _createDrawerItem(
      {String? iconPath,
      String? title,
      GestureTapCallback? onTap,
      EdgeInsetsGeometry? padding}) {
    return Padding(
      padding: padding ??
          const EdgeInsets.only(left: 20.0, right: 60.0, bottom: 25.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            iconPath ?? '',
            color: AppColors.BLACK_COLOR,
            // scale: 3.5,
            height: 22,
            width: 22,
          ),
          20.pw,
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: <Widget>[
                CustomText(
                  text: title,
                  fontColor: AppColors.BLACK_COLOR,
                  fontSize: 16.sp,
                  fontFamily: AppFonts.JONES_BOLD,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItems({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.ph,
        _createDrawerItem(
            iconPath: AssetPaths.HOME_ICON,
            onTap: () {
              scffoldKey?.currentState!.closeDrawer();
            },
            title: AppStrings.HOME),
        _createDrawerItem(
            iconPath: AssetPaths.REMINDER_ICON,
            onTap: () {},
            title: AppStrings.SET_REMINDER),
        _createDrawerItem(
            iconPath: AssetPaths.SETTING_ICON,
            onTap: () {
              // Get.to(() => ScheduleScreen(
              //       isFromEdit: true,
              //     ));
            },
            title: AppStrings.SETTINGS),
        _createDrawerItem(
            iconPath: AssetPaths.TERMS_ICON,
            onTap: () {
              // Get.to(() => ScheduleScreen(
              //       isFromEdit: true,
              //     ));
            },
            title: AppStrings.TERMS_AND_CONDITION),
        _createDrawerItem(
            iconPath: AssetPaths.PRIVACY_ICON,
            onTap: () {
              // Get.to(() => ScheduleScreen(
              //       isFromEdit: true,
              //     ));
            },
            title: AppStrings.PRIVACY_POLICY),
        30.ph,
        logoutButton(context: context, onTap: () {})
      ],
    );
  }

  Widget logoutButton(
      {required BuildContext context, required Function() onTap}) {
    return GestureDetector(
      onTap: () {
        AppDialogs().showOptionsDialog(
            headertitle: AppStrings.LOGOUT,
            title:
                '${AppStrings.ARE_YOU_SURE} \n${AppStrings.LOGOUT.toLowerCase()}?',
            haveTwoButton: true,
            b1Text: AppStrings.CANCEL,
            b2Text: AppStrings.LOGOUT,
            imagePath: AssetPaths.LOGOUT_ICON,
            b1onTap: () {
              AppNavigation.navigatorPop(context);
            },
            b2onTap: onTap,
            context: context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: const BoxDecoration(
            color: AppColors.BLACK_COLOR,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetPaths.LOGOUT_ICON,
              color: AppColors.WHITE_COLOR,
              // scale: 3.5,
              height: 22,
              width: 22,
            ),
            20.pw,
            CustomText(
              text: AppStrings.LOGOUT,
              fontColor: AppColors.WHITE_COLOR,
              fontSize: 17.sp,
              fontFamily: AppFonts.JONES_MEDIUM,
            ),
          ],
        ),
      ),
    );
  }
}
