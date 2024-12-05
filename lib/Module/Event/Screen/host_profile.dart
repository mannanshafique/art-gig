import 'package:artgig/Utils/app_fonts.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:artgig/Widgets/cs_container_border.dart';
import 'package:artgig/Widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../Common/Splash/Controller/splash_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/custom_textfield.dart';
import '../../../Widgets/user_avatar_widget.dart';

class HostProfileScreen extends StatefulWidget {
  const HostProfileScreen({
    super.key,
  });

  @override
  State<HostProfileScreen> createState() => _HostProfileScreenState();
}

class _HostProfileScreenState extends State<HostProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scffoldBg: AppColors.TRANSPARENT_COLOR,
      appBar: customAppBar(
          context: context,
          isLeadingBack: true,
          title: AppStrings.EVENT_DETAIL),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCicrleAvatarWidget(
              circularColor: Constants.themeButton(context: context),
              imgPath: AssetPaths.BACKGROUNG_LIGHT_MODE_IMAGES,
              radius: 100.h,
              isExtendedImage: false,
            ),
            10.ph,
            CustomText(
              text: 'Lisa Marie',
              fontSize: 18.sp,
              fontColor: Constants.primaryTitleTextThemeColor(context: context),
            ),
            10.ph,
            Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.PINK_COLOR,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        10.ph,
                        CustomText(
                          text: 'Total Event Host',
                          fontSize: 20.sp,
                          fontColor: AppColors.WHITE_COLOR,
                        ),
                        5.ph,
                        CustomText(
                          text: '157K',
                          fontSize: 26.sp,
                          fontFamily: AppFonts.JONES_BOLD,
                          fontColor: AppColors.WHITE_COLOR,
                        ),
                      ],
                    ),
                  ],
                )),
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
              prefixIconPath: AssetPaths.PHONE_ICON,
              textEditingController: TextEditingController(text: 'dvsdvs'),
            ),
            10.ph,
            _customTextField(
              textEditingController: TextEditingController(text: 'dvsdvs'),
              isBio: true,
            ),
            Switch(
              value: SplashController.i.isDarkMode,
              onChanged: (value) {
                SplashController.i.toggleTheme(value);
              },
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
              controller: TextEditingController(text: 'few'),
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
