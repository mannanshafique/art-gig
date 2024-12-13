import 'package:artgig/Utils/app_navigation.dart';
import 'package:artgig/Utils/app_strings.dart';
import 'package:artgig/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_constants.dart';
import '../Utils/app_fonts.dart';
import 'cs_container_border.dart';
import 'custom_text.dart';
import 'custom_textfield.dart';

class CustomFilterBottomSheet extends StatefulWidget {
  const CustomFilterBottomSheet({super.key});

  @override
  State<CustomFilterBottomSheet> createState() =>
      _CustomFilterBottomSheetState();
}

class _CustomFilterBottomSheetState extends State<CustomFilterBottomSheet> {
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController userTagEditingController =
      TextEditingController();
  final TextEditingController ageGroupEditingController =
      TextEditingController();
  final TextEditingController locationEditingController =
      TextEditingController();
  final TextEditingController zipCodeEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        height: 500,
        decoration: BoxDecoration(
            color: Constants.isDarkTheme(context: context)
                ? AppColors.BLACK_COLOR
                : AppColors.WHITE_COLOR,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.r),
                topLeft: Radius.circular(12.r))),
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.015.sw),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      textAlign: TextAlign.center,
                      text: "Filter",
                      fontColor:
                          Constants.primaryTextThemeColor(context: context),
                      fontSize: 16.sp,
                      fontFamily: AppFonts.JONES_BOLD,
                    ),
                  ],
                ),
                10.verticalSpace,
                _customTextField(
                  textEditingController: nameEditingController,
                  hintText: AppStrings.NAME,
                  keybordType: TextInputType.name,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(Constants.NAME_MAX_LENGHT)
                  ],
                ),
                5.verticalSpace,
                _customTextField(
                  textEditingController: userTagEditingController,
                  hintText: AppStrings.USER_TAG,
                  keybordType: TextInputType.name,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(Constants.NAME_MAX_LENGHT)
                  ],
                ),
                5.verticalSpace,
                _customTextField(
                  textEditingController: ageGroupEditingController,
                  hintText: AppStrings.AGE_GROUP,
                  keybordType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(3)],
                ),
                5.verticalSpace,
                _customTextField(
                  textEditingController: locationEditingController,
                  hintText: AppStrings.LOCATION,
                  keybordType: TextInputType.number,
                  inputFormatters: [LengthLimitingTextInputFormatter(3)],
                ),
                15.verticalSpace,
                CustomText(
                  text: 'Nearby Location', // Show the current radius
                  fontColor: Constants.primaryTextThemeColor(context: context),
                  fontFamily: AppFonts.JONES_BOLD,
                ),
                10.verticalSpace,
                customRadiusSelector(context: context, setState: setState),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                            containerColor:
                                Constants.isDarkTheme(context: context)
                                    ? AppColors.BLACK_COLOR
                                    : AppColors.WHITE_COLOR,
                            borderColor: Constants.isDarkTheme(context: context)
                                ? AppColors.WHITE_COLOR
                                : AppColors.PINK_COLOR,
                            onTap: () {
                              nameEditingController.clear();
                              userTagEditingController.clear();
                              ageGroupEditingController.clear();
                              locationEditingController.clear();
                              zipCodeEditingController.clear();
                              radius = 0.0;
                            },
                            fontColor: Constants.isDarkTheme(context: context)
                                ? AppColors.WHITE_COLOR
                                : AppColors.PINK_COLOR,
                            title: AppStrings.RESET)),
                    10.horizontalSpace,
                    Expanded(
                        child: CustomButton(
                            onTap: () {
                              AppNavigation.navigatorPop(context);
                            },
                            title: AppStrings.APPLY)),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _customTextField(
      {required TextEditingController textEditingController,
      List<TextInputFormatter>? inputFormatters,
      String? hintText,
      TextInputType? keybordType,
      bool? readOnly}) {
    return CustomContainerBorderWidget(
      padding: EdgeInsets.zero,
      bgColor: AppColors.TRANSPARENT_COLOR,
      borderRadius: 50.r,
      oppacityValue: Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
      child: CustomTextField(
          controller: textEditingController,
          hint: hintText ?? '',
          readOnly: readOnly ?? false,
          label: false,
          isDense: true,
          divider: false,
          keyboardType: keybordType,
          verticalPadding: 2.0,
          bgColor: Constants.isDarkTheme(context: context)
              ? AppColors.TRANSPARENT_COLOR
              : AppColors.WHITE_COLOR,
          borderColor: Constants.isDarkTheme(context: context)
              ? AppColors.WHITE_COLOR
              : AppColors.ORANGE_COLOR,
          textCapitalization: TextCapitalization.none,
          inputFormatters: inputFormatters),
    );
  }

  double radius = 20.0; // Default radius value
  Widget customRadiusSelector(
      {required BuildContext context, required dynamic setState}) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomText(
            text:
                'Selected Radius: ${radius.toInt()} Miles', // Show the current radius
            fontColor: Constants.primaryTextThemeColor(context: context),
          ),
        ),
        Slider(
          value: radius,
          min: 0,
          max: 60,
          activeColor: AppColors.ORANGE_COLOR,
          divisions: 60, // Creates 59 divisions (1 to 60)
          label: radius.toInt().toString(),
          onChanged: (value) {
            setState(() {
              radius = value; // Update the radius value
            });
          },
        ),
      ],
    );
  }
}
