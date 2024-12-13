import 'package:artgig/Common/Auth/Screens/Setup_Profile/pre_login_test.dart';
import 'package:artgig/Utils/app_constants.dart';
import 'package:artgig/Utils/app_dialogs.dart';
import 'package:artgig/Utils/app_strings.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:artgig/Widgets/cs_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_fonts.dart';
import '../../../../Widgets/cs_bottom_navg_button.dart';
import '../../../../Widgets/cs_container_border.dart';
import '../../../../Widgets/custom_auth_scaffold.dart';
import '../../../../Widgets/custom_button.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../Splash/Controller/splash_controller.dart';

class TestOptionSelection extends StatelessWidget {
  const TestOptionSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      isLeading: true,
      showLogo: false,
      appBarTitle: 'Create Profile',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.ph,
            CustomButton(
                onTap: () {
                  AppDialogs.showToast(message: 'Downloaded');
                  Get.to(() => PreLoginTestScreen());
                },
                title: 'Download Hand Book'),
            10.ph,
            CustomButton(
                onTap: () {
                  Get.to(() => TutorialGuideScreen());
                },
                title: 'Tutorial'),
          ],
        ),
      ),
    );
  }
}

class TutorialGuideScreen extends StatelessWidget {
  const TutorialGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      isLeading: true,
      showLogo: false,
      appBarTitle: 'Tutorial & Guides',
      bottomNavigationWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
        child: CustomBottomNavigationWidget(
          buttonTitle: 'Start Quiz',
          onTap: () {
            Constants.unFocusKeyboardMethod(context: context);
            Get.to(() => PreLoginTestScreen());
          },
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
          child: Column(
            children: [
              videoThumbnailView(context: context),
              10.ph,
              CustomText(
                text: 'Tutorial video for a better\nexperience',
                fontColor:
                    Constants.primaryTitleTextThemeColor(context: context),
                fontSize: 22.sp,
                lineSpacing: 1.3,
                fontFamily: AppFonts.JONES_MEDIUM,
              ),
              10.ph,
              CustomText(
                text: AppStrings.loremIpsum,
                fontColor: Constants.primaryTextThemeColor(context: context),
                fontSize: 16.sp,
                maxLines: 5,
                lineSpacing: 1.3,
                fontFamily: AppFonts.JONES_MEDIUM,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget videoThumbnailView({required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => VideoPlayerScreen(
            videoUrl:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
      },
      child: SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: CustomContainerBorderWidget(
          padding: EdgeInsets.zero,
          bgColor: Constants.isDarkTheme(context: context)
              ? AppColors.TRANSPARENT_COLOR
              : AppColors.WHITE_COLOR,
          borderColor: Constants.isDarkTheme(context: context)
              ? AppColors.WHITE_COLOR
              : AppColors.ORANGE_COLOR,
          borderRadius: 14.r,
          oppacityValue: Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(13.r),
                  child: Image.asset(
                    AssetPaths.TEMP_EVENT_IMAGES,
                    fit: BoxFit.cover,
                  )),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.BLACK_COLOR.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(13.r)),
                child: Icon(
                  Icons.play_circle_fill,
                  color: AppColors.WHITE_COLOR,
                  size: 50.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
