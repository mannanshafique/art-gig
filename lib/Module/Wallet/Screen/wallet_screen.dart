import 'package:artgig/Utils/app_colors.dart';
import 'package:artgig/Utils/app_fonts.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_constants.dart';
import '../../../Utils/app_padding.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/custom_text.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.ph,
        Row(
          children: [
            Expanded(
              child: totalWigdet(title: 'Total Earning', subTitle: '\$27K'),
            ),
            12.pw,
            Expanded(
              child: totalWigdet(title: 'Pending Earning', subTitle: '\$12K'),
            ),
          ],
        ),
        10.ph,
        Center(
          child: Container(
            decoration: BoxDecoration(
              color: Constants.isDarkTheme(context: context)
                  ? AppColors.PINK_COLOR.withOpacity(0.6)
                  : AppColors.LIGHT_GREY_COLOR,
              borderRadius: BorderRadius.circular(50.r),
            ),
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: customToggleButton(
                      title: AppStrings.WEEKLY,
                      isSelected: selectedIndex == 0 ? true : false,
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      }),
                ),
                Expanded(
                  child: customToggleButton(
                      title: AppStrings.MONTHLY,
                      isSelected: selectedIndex == 1 ? true : false,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
        10.ph,
        paymentRow(),
        10.ph,
        paymentRow(),
        10.ph,
        paymentRow(),
        10.ph,
      ],
    );
  }

  Widget paymentRow() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.buttonVerticalPadding),
      decoration: BoxDecoration(
          color: Constants.isDarkTheme(context: context)
              ? AppColors.BLACK_COLOR
              : AppColors.BLUE_COLOR,
          borderRadius: BorderRadius.circular(AppPadding.buttonBorder.r),
          border: Border.all(
            color: Constants.isDarkTheme(context: context)
                ? AppColors.WHITE_COLOR
                : AppColors.TRANSPARENT_COLOR,
          )),
      child: Row(
        children: [
          Image.asset(
            AssetPaths.VISA_ICON,
            scale: 5.sp,
            color: AppColors.WHITE_COLOR,
          ),
          10.horizontalSpace,
          CustomText(text: '**** **** 5679'),
          Spacer(),
          CustomText(
            text: "\$ " + '30',
            weight: FontWeight.bold,
          )
        ],
      ),
    );
  }

  Widget totalWigdet({required String title, required String subTitle}) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.PINK_COLOR,
      ),
      child: Column(
        children: [
          10.ph,
          CustomText(
            text: title,
            fontSize: 16.sp,
            fontColor: AppColors.WHITE_COLOR,
          ),
          5.ph,
          CustomText(
            text: subTitle,
            fontSize: 22.sp,
            fontFamily: AppFonts.JONES_BOLD,
            fontColor: AppColors.WHITE_COLOR,
          ),
        ],
      ),
    );
  }

  Widget customToggleButton(
      {required String title,
      required bool isSelected,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: isSelected
                ? AppColors.PINK_COLOR
                : AppColors.TRANSPARENT_COLOR),
        child: Center(
          child: CustomText(
              text: title,
              textAlign: TextAlign.start,
              fontSize: 15.sp,
              fontColor: AppColors.WHITE_COLOR,
              fontFamily: AppFonts.JONES_MEDIUM),
        ),
      ),
    );
  }
}
