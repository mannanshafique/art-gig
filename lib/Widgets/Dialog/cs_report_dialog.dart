import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_constants.dart';
import '../../Utils/app_dialogs.dart';
import '../../Utils/app_navigation.dart';
import '../../Utils/app_strings.dart';
import '../../Utils/app_validator.dart';
import '../custom_alert_dialog.dart';
import '../custom_button.dart';
import '../custom_text.dart';
import '../custom_textfield.dart';

class CustomReportDialog extends StatefulWidget {
  CustomReportDialog({Key? key, required this.headerTitle}) : super(key: key);

  final String headerTitle;

  @override
  State<CustomReportDialog> createState() => _CustomReportDialogState();
}

class _CustomReportDialogState extends State<CustomReportDialog> {
  bool isOthers = false;

  List reason = [
    "Hate speech",
    "Violence or harmful behavior",
    "Abusive or harmful behavior",
    "Sexually explicit content",
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
      height: 170.h,
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
        controller: _reasonCtrl,
        keyboardType: TextInputType.name,
        maxlines: 5,
        lines: 8,
        hint: AppStrings.typeYourReasonHere,
        inputFormatters: [
          LengthLimitingTextInputFormatter(Constants.DESCRIPTION_MAX_LENGTH)
        ],
      ),
    );
  }

  Widget _reportButton(BuildContext context) {
    return CustomButton(
        title: AppStrings.REPORT,
        onTap: () {
          Constants.unFocusKeyboardMethod(context: context);
          if (isOthers == true) {
            bool isValidate =
                FieldValidator().validateReport(_reasonCtrl.text, context);
            if (isValidate) {
              AppNavigation.navigatorPop(context);
            }
          } else {
            AppNavigation.navigatorPop(context);
            AppDialogs.showToast(message: 'Report submit sucessfull');
          }
        });
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
          activeColor: AppColors.GREEN_COLOR,
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
