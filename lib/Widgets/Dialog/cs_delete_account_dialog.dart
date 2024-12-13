import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_constants.dart';
import '../../Utils/app_navigation.dart';
import '../../Utils/app_strings.dart';
import '../../Utils/app_validator.dart';
import '../custom_alert_dialog.dart';
import '../custom_button.dart';
import '../custom_text.dart';
import '../custom_textfield.dart';

class CustomDeleteAccountDialog extends StatefulWidget {
  CustomDeleteAccountDialog(
      {Key? key, required this.headerTitle, required this.onTapCancel})
      : super(key: key);

  final String headerTitle;
  final Function() onTapCancel;

  @override
  State<CustomDeleteAccountDialog> createState() =>
      _CustomDeleteAccountDialogState();
}

class _CustomDeleteAccountDialogState extends State<CustomDeleteAccountDialog> {
  bool isOthers = false;

  List reason = [
    "I don’t need it anymore.",
    "I don’t find it useful.",
    "Others",
  ];

  int _selectedOption = 0;

  final _reasonCtrl = TextEditingController();

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
              _reasonListView(),
              _reasonTextField(),
              isOthers ? 10.ph : SizedBox.shrink(),
              _reportButton(context),
              10.ph,
            ],
          ),
        ),
      ),
    );
  }

  Widget _reasonListView() {
    return Container(
      height: 120.h,
      width: Get.width,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: reason.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (cc, i) {
            return reasonViewWidget(
              title: reason[i],
              optionValue: i,
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                  if (reason[i] == 'Others') {
                    setState(() {
                      isOthers = true;
                    });
                  } else {
                    isOthers = false;
                  }
                  print("Other: ${isOthers}");
                });
              },
            );
          }),
    );
  }

  Widget _reasonTextField() {
    return Visibility(
      visible: isOthers,
      child: CustomTextField(
        isColorDecoration: true,
        borderRadius: 10.0,
        controller: _reasonCtrl,
        bgColor: AppColors.GREY_COLOR.withOpacity(0.4),
        keyboardType: TextInputType.name,
        maxlines: 5,
        lines: 8,
        label: false,
        hint: AppStrings.typeYourReasonHere,
        inputFormatters: [
          LengthLimitingTextInputFormatter(Constants.DESCRIPTION_MAX_LENGTH)
        ],
      ),
    );
  }

  Widget _reportButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            title: AppStrings.NO,
            containerColor: AppColors.PINK_COLOR,
            fontColor: AppColors.WHITE_COLOR,
            borderRadius: 50.0,
            fontSize: 14.sp,
            onTap: () {
              AppNavigation.navigatorPop(context);
            },
          ),
        ),
        12.pw,
        Expanded(
          child: CustomButton(
            title: AppStrings.YES,
            borderRadius: 50.0,
            fontSize: 14.sp,
            borderColor: Constants.isDarkTheme(context: context)
                ? AppColors.BLACK_COLOR
                : AppColors.PINK_COLOR,
            containerColor: AppColors.WHITE_COLOR,
            fontColor: Constants.isDarkTheme(context: context)
                ? AppColors.BLACK_COLOR
                : AppColors.PINK_COLOR,
            onTap: () {
              Constants.unFocusKeyboardMethod(context: context);
              if (isOthers == true) {
                bool isValidate =
                    FieldValidator().validateCancel(_reasonCtrl.text, context);
                if (isValidate) {
                  widget.onTapCancel();
                }
              } else {
                widget.onTapCancel();
              }
            },
          ),
        ),
      ],
    );

    // Row(
    //   children: [
    //     Expanded(
    //         child: CustomButton(
    //             title: AppStrings.NO,
    //             borderRadius: 10.0,
    //             fontSize: 14.sp,
    //             // borderColor: AppColors.DARK_YELLOW_COLOR,
    //             // containerColor: AppColors.WHITE_COLOR,
    //             // fontColor: AppColors.BLACK_COLOR,
    //             // fontFamily: AppFonts.UNBOUNDED_REGULAR,
    //             onTap: () {
    //               Constants.unFocusKeyboardMethod(context: context);
    //               AppNavigation.navigatorPop(context);
    //             })),
    //     10.pw,
    //     Expanded(
    //         child: CustomButton(
    //             title: AppStrings.YES,
    //             borderRadius: 10.0,
    //             // fontFamily: AppFonts.UNBOUNDED_REGULAR,
    //             fontSize: 14.sp,
    //             onTap: () {
    // Constants.unFocusKeyboardMethod(context: context);
    // if (isOthers == true) {
    //   bool isValidate = FieldValidator()
    //       .validateCancel(_reasonCtrl.text, context);
    //   if (isValidate) {
    //     widget.onTapCancel();
    //   }
    // } else {
    //   widget.onTapCancel();
    // }
    //             })),
    //   ],
    // );
  }

  Widget reasonViewWidget(
      {required int? optionValue,
      groupValue,
      Function(dynamic)? onChanged,
      title}) {
    return Row(
      children: [
        Radio(
          visualDensity: VisualDensity.compact,
          activeColor: AppColors.ORANGE_COLOR,
          value: optionValue,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        CustomText(
          text: title,
          fontSize: 14.sp,
          fontColor: AppColors.BLACK_COLOR,
        ),
      ],
    );
  }
}
