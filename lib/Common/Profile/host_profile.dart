import 'package:artgig/Common/Profile/rating_reviews_screen.dart';
import 'package:artgig/Common/Role_Selection/Controller/role_controller.dart';
import 'package:artgig/Utils/app_fonts.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:artgig/Widgets/cs_container_border.dart';
import 'package:artgig/Widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../Widgets/cs_rating_builder_widget.dart';
import '../Splash/Controller/splash_controller.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/app_constants.dart';
import '../../Utils/app_strings.dart';
import '../../Widgets/cs_appbar.dart';
import '../../Widgets/custom_text.dart';
import '../../Widgets/custom_textfield.dart';
import '../../Widgets/user_avatar_widget.dart';

class HostProfileScreen extends StatefulWidget {
  const HostProfileScreen({
    super.key,
    required this.isFromMainMenu,
  });

  final bool isFromMainMenu;
  @override
  State<HostProfileScreen> createState() => _HostProfileScreenState();
}

class _HostProfileScreenState extends State<HostProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.isFromMainMenu
        ? profileBody()
        : CustomScaffold(
            scffoldBg: AppColors.TRANSPARENT_COLOR,
            appBar: customAppBar(
                context: context,
                isLeadingBack: true,
                title: AppStrings.PROFILE),
            body: profileBody());
  }

  Widget profileBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCicrleAvatarWidget(
              circularColor: Constants.themeButton(context: context),
              imgPath: AssetPaths.TEMP_PROFILE_IMAGES,
              radius: 100.h,
              isExtendedImage: false,
            ),
            10.ph,
            CustomText(
              text: 'Lisa Marie',
              fontSize: 18.sp,
              fontColor: Constants.primaryTitleTextThemeColor(context: context),
            ),
            if (RoleController.isArtist()) ...[
              10.ph,
              GestureDetector(
                onTap: () {
                  Get.to(() => RatingReviewsScreen());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: '4.8',
                      textAlign: TextAlign.start,
                      fontColor: Constants.primaryTitleTextThemeColor(
                          context: context),
                      fontSize: 40.sp,
                      fontFamily: AppFonts.JONES_BOLD,
                    ),
                    5.pw,
                    CustomRatingBarWidget(
                        rating: double.parse('4.2'),
                        itemSize: 14.h,
                        fillIconColor: AppColors.ORANGE_COLOR,
                        isIgnoreGesture: true,
                        onRatingUpdate: (value) {}),
                  ],
                ),
              ),
              10.ph,
              Row(
                children: [
                  totalEventAndEarningWigdet(
                      title: 'Total Event Host', subTitle: '257K'),
                  10.pw,
                  totalEventAndEarningWigdet(
                      title: 'Total Earning', subTitle: '\$27K'),
                ],
              ),
            ],
            10.ph,
            _customTextField(
              prefixIconPath: AssetPaths.EMAIL_ICON,
              textEditingController:
                  TextEditingController(text: 'lisa@gmail.com'),
              inputFormatters: [
                LengthLimitingTextInputFormatter(Constants.EMAIL_MAX_LENGTH)
              ],
            ),
            10.ph,
            _customTextField(
              prefixIconPath: AssetPaths.PHONE_ICON,
              textEditingController:
                  TextEditingController(text: '+1234 4565474'),
              inputFormatters: [
                LengthLimitingTextInputFormatter(Constants.PHONE_MAX_LENGHT),
                MaskTextInputFormatter(
                    mask: '(+1)###-###-####', filter: {"#": RegExp(r'[0-9]')}),
              ],
            ),
            10.ph,
            _customTextField(
              prefixIconPath: AssetPaths.LOCATION_ICON,
              textEditingController: TextEditingController(text: 'dvsdvs'),
            ),
            10.ph,
            _customTextField(
              textEditingController:
                  TextEditingController(text: AppStrings.loremIpsum),
              isBio: true,
            ),
            if (RoleController.isArtist()) ...[
              10.ph,
              Row(
                children: [
                  CustomText(
                    text: AppStrings.portfolio,
                    fontSize: 18.sp,
                    fontColor:
                        Constants.primaryTitleTextThemeColor(context: context),
                  ),
                ],
              ),
              10.ph,
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(
                            AssetPaths.TEMP_EVENT_IMAGES,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            30.ph,
          ],
        ),
      ),
    );
  }

  Widget totalEventAndEarningWigdet(
      {required String title, required String subTitle}) {
    return Expanded(
      child: Container(
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
              fontSize: 18.sp,
              fontColor: AppColors.WHITE_COLOR,
            ),
            5.ph,
            CustomText(
              text: subTitle,
              fontSize: 26.sp,
              fontFamily: AppFonts.JONES_BOLD,
              fontColor: AppColors.WHITE_COLOR,
            ),
          ],
        ),
      ),
    );
  }

  Widget _customTextField(
      {required TextEditingController textEditingController,
      List<TextInputFormatter>? inputFormatters,
      String? prefixIconPath,
      int? maxLines,
      bool isBio = false}) {
    return CustomContainerBorderWidget(
      padding: EdgeInsets.zero,
      bgColor: AppColors.TRANSPARENT_COLOR,
      borderRadius: isBio ? 12.r : 50.r,
      oppacityValue: Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
      child: isBio
          ? CustomTextField(
              controller: textEditingController,
              hint: 'Bio',
              readOnly: true,
              label: true,
              isDense: true,
              maxlines: 4,
              divider: false,
              verticalPadding: 2.0,
              borderRadius: 12.r,
              bgColor: Constants.isDarkTheme(context: context)
                  ? AppColors.TRANSPARENT_COLOR
                  : AppColors.WHITE_COLOR,
              borderColor: Constants.isDarkTheme(context: context)
                  ? AppColors.WHITE_COLOR
                  : AppColors.TRANSPARENT_COLOR,
              textCapitalization: TextCapitalization.none,
            )
          : CustomTextField(
              controller: textEditingController,
              hint: '',
              readOnly: true,
              label: false,
              isDense: true,
              maxlines: maxLines,
              prefxicon: prefixIconPath,
              prefixIconColor:
                  Constants.primaryTitleTextThemeColor(context: context),
              divider: false,
              verticalPadding: 2.0,
              bgColor: Constants.isDarkTheme(context: context)
                  ? AppColors.TRANSPARENT_COLOR
                  : AppColors.WHITE_COLOR,
              borderColor: Constants.isDarkTheme(context: context)
                  ? AppColors.WHITE_COLOR
                  : AppColors.TRANSPARENT_COLOR,
              textCapitalization: TextCapitalization.none,
              inputFormatters: inputFormatters),
    );
  }
}
