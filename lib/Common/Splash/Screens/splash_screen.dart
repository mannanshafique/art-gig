import 'package:artgig/Utils/extensions.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/custom_logo.dart';
import '../../../Widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: 1.sw,
            height: 1.sh,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(AssetPaths.BACKGROUNG_SPLASH_IMAGE),
                    fit: BoxFit.fill,
                  )),
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        60.ph,
                        _centerLogo(),
                        const Spacer(),
                        Column(
                          children: [
                            CustomText(
                              text: AppStrings.ALL_YOUR_WISH,
                              fontColor: AppColors.BLACK_COLOR,
                              fontSize: 22.sp,
                              textAlign: TextAlign.start,
                              fontFamily: AppFonts.MONTSERRAT_BOLD,
                            ),
                            14.ph,
                            CustomText(
                              text: AppStrings.IN_ONE_PLACE,
                              fontColor: AppColors.BLACK_COLOR,
                              fontSize: 35.sp,
                              textAlign: TextAlign.start,
                              fontFamily: AppFonts.MONTSERRAT_BOLD,
                            ),
                            20.ph,
                            CustomText(
                              text: AppStrings.STORE_AND_SHARE_YOUR,
                              fontColor: AppColors.BLACK_COLOR,
                              fontSize: 17.sp,
                              lineSpacing: 1.3,
                              letterSpacing: 1.3,
                              textAlign: TextAlign.start,
                              fontFamily: AppFonts.MONTSERRAT_MEDIUM,
                            ),
                            50.ph,
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.h, vertical: 10.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: AppColors.BLACK_COLOR),
                              child: const Icon(
                                Icons.arrow_forward_outlined,
                                color: AppColors.WHITE_COLOR,
                              ),
                            ),
                            60.ph,
                          ],
                        ),
                      ],
                    )),
              ],
            )),
      ),
    );
  }

  Widget _centerLogo() {
    return Entry.scale(
      curve: Curves.easeIn,
      duration: const Duration(seconds: 2),
      child: _appLogo(),
    );
  }

  Widget _appLogo() {
    return CustomLogo(
      height: 210.w,
      width: 280.w,
      onTap: () {},
    );
  }
}
