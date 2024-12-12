import 'dart:developer';

import 'package:artgig/Common/Profile/host_profile.dart';
import 'package:artgig/Utils/app_fonts.dart';
import 'package:artgig/Utils/app_navigation.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:artgig/Widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Common/Role_Selection/Controller/role_controller.dart';
import '../../../Common/Splash/Controller/splash_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/user_avatar_widget.dart';
import '../Model/event_model.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key, this.eventData, required this.havingButton});

  final EventData? eventData;
  final bool havingButton;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scffoldBg: AppColors.TRANSPARENT_COLOR,
      appBar: customAppBar(
          context: context,
          isLeadingBack: true,
          title: AppStrings.EVENT_DETAIL),
      bottomNavigationBar: (RoleController.isArtist() && havingButton)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.ph,
                CustomButton(
                    verticalPadding: 12.h,
                    onTap: () {
                      AppNavigation.navigatorPop(context);
                    },
                    title: 'Accept Request'),
                8.ph,
                CustomButton(
                    verticalPadding: 12.h,
                    containerColor: Theme.of(context).cardColor,
                    borderColor: Constants.themeButton(context: context),
                    fontColor: Constants.themeButton(context: context),
                    onTap: () {
                      AppNavigation.navigatorPop(context);
                    },
                    title: 'Reject Request'),
                10.ph,
              ],
            )
          : const SizedBox.shrink(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: eventData?.title,
              fontSize: 18.sp,
              fontColor: Constants.primaryTitleTextThemeColor(context: context),
            ),
            10.ph,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    width: 2.0,
                    color: Constants.themeButton(context: context),
                  )),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      eventData?.imagePath ?? "",
                      height: 200.h,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.WHITE_COLOR),
                            color: AppColors.PINK_COLOR.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          children: [
                            CustomText(
                              text: '10',
                              fontSize: 18.sp,
                              fontFamily: AppFonts.JONES_BOLD,
                              fontColor: AppColors.WHITE_COLOR,
                            ),
                            1.ph,
                            CustomText(
                              text: 'dec'.capitalize,
                              fontSize: 14.sp,
                              fontColor: AppColors.WHITE_COLOR,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            10.ph,
            CustomText(
              text: eventData?.description,
              fontSize: 15.sp,
              maxLines: 14,
              lineSpacing: 1.1,
              textAlign: TextAlign.start,
              fontFamily: AppFonts.JONES_REGULAR,
              fontColor: Constants.primaryTextThemeColor(context: context),
            ),
            20.ph,
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: 'Start Time: ${eventData?.startTime}',
                    fontSize: 18.sp,
                    textAlign: TextAlign.start,
                    fontColor:
                        Constants.primaryTitleTextThemeColor(context: context),
                  ),
                ),
                Expanded(
                  child: CustomText(
                    text: 'End Time: ${eventData?.endTime}',
                    fontSize: 18.sp,
                    textAlign: TextAlign.end,
                    fontColor:
                        Constants.primaryTitleTextThemeColor(context: context),
                  ),
                ),
              ],
            ),
            20.ph,
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: 'Event Fee: ${eventData?.eventFee}',
                    fontSize: 18.sp,
                    textAlign: TextAlign.start,
                    fontColor:
                        Constants.primaryTitleTextThemeColor(context: context),
                  ),
                ),
              ],
            ),
            10.ph,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.location_on,
                    size: 18.w,
                    color: Constants.isDarkTheme(context: context)
                        ? AppColors.WHITE_COLOR
                        : AppColors.PINK_COLOR),
                SizedBox(width: 4.w),
                Expanded(
                  child: CustomText(
                    text: eventData?.location,
                    textAlign: TextAlign.start,
                    fontSize: 14.sp,
                    fontColor:
                        Constants.primaryTextThemeColor(context: context),
                  ),
                ),
              ],
            ),
            10.ph,
            GestureDetector(
              onTap: () {
                Get.to(() => const HostProfileScreen(
                      isFromMainMenu: false,
                    ));
              },
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CustomCicrleAvatarWidget(
                          imgPath: AssetPaths.TEMP_EVENT_IMAGES,
                          radius: 40.h,
                          isExtendedImage: true,
                        ),
                        5.pw,
                        CustomText(
                          text: eventData?.organizerName,
                          fontSize: 15.sp,
                          textAlign: TextAlign.end,
                          fontFamily: AppFonts.JONES_BOLD,
                          fontColor: Constants.primaryTitleTextThemeColor(
                              context: context),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomText(
                        text: '4.8',
                        fontSize: 24.sp,
                        fontFamily: AppFonts.JONES_BOLD,
                        textAlign: TextAlign.end,
                        fontColor: Constants.primaryTitleTextThemeColor(
                            context: context),
                      ),
                      2.pw,
                      const Icon(
                        Icons.star,
                        color: AppColors.ORANGE_COLOR,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
