import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_constants.dart';
import '../../Utils/app_fonts.dart';
import '../../Utils/app_navigation.dart';
import '../../Utils/app_strings.dart';
import '../custom_alert_dialog.dart';
import '../custom_button.dart';
import '../custom_text.dart';

class CustomEventTypeDialog extends StatefulWidget {
  CustomEventTypeDialog(
      {Key? key, required this.headerTitle, required this.onTap})
      : super(key: key);

  final String headerTitle;

  final Function() onTap;

  @override
  State<CustomEventTypeDialog> createState() => _CustomEventTypeDialogState();
}

class _CustomEventTypeDialogState extends State<CustomEventTypeDialog> {
  // List<CreateModel> createDataList = [

  // ];
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      headerText: widget.headerTitle,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              8.ph,
              Container(
                padding: EdgeInsets.all(20.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.isDarkTheme(context: context)
                        ? AppColors.WHITE_COLOR
                        : AppColors.ORANGE_COLOR),
                child: Image.asset(AssetPaths.QUESTION_MARK_ICON,
                    height: 40.h,
                    color: Constants.isDarkTheme(context: context)
                        ? AppColors.BLACK_COLOR
                        : AppColors.WHITE_COLOR),
              ),
              10.ph,
              CustomRadioListTile<String>(
                value: "Canvas Painting",
                groupValue: selectedOption,
                title: "Canvas Painting",
                fontColor: AppColors.BLACK_COLOR,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
              CustomRadioListTile<String>(
                value: "Wine Painting",
                fontColor: AppColors.BLACK_COLOR,
                groupValue: selectedOption,
                title: "Wine Painting",
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
              CustomRadioListTile<String>(
                value: "Tote Bag Painting",
                groupValue: selectedOption,
                fontColor: AppColors.BLACK_COLOR,
                title: "Tote Bag Painting",
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              ),
              10.ph,
              _customButton(title: AppStrings.CONTINUE, ontap: widget.onTap),
              20.ph,
            ],
          ),
        ),
      ),
    );
  }

  Widget _customButton({required String title, required Function() ontap}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CustomButton(
          fontSize: 14.sp,
          containerColor: AppColors.PINK_COLOR,
          fontColor: AppColors.WHITE_COLOR,
          title: title,
          onTap: ontap),
    );
  }
}

class CustomRadioListTile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final Color? fontColor;
  final String title;
  final ValueChanged<T?> onChanged;

  const CustomRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.title,
    this.fontColor,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      contentPadding: EdgeInsets.zero,
      dense: true,
      value: value,
      groupValue: groupValue,
      visualDensity: const VisualDensity(vertical: -1, horizontal: -4),
      activeColor: AppColors.ORANGE_COLOR,
      // activeColor: Constants.primaryTitleTextThemeColor(context: context),
      title: CustomText(
        text: title,
        // fontColor: AppColors.BLACK_COLOR,
        fontColor:
            fontColor ?? Constants.primaryTextThemeColor(context: context),
        fontSize: 16.sp,
        maxLines: 2,
        textAlign: TextAlign.start,
        fontFamily: AppFonts.JONES_REGULAR,
      ),
      onChanged: onChanged,
    );
  }
}
