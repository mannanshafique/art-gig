import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';
import 'custom_text.dart';

class CustomDropDown2 extends StatelessWidget {
  final String? dropdownValue, hintText;
  double? maxLines;
  final Widget? prefix;
  final List<String>? dropDownData;
  final void Function(String?)? onChanged;
  final double? width,
      fontSize,
      dropDownWidth,
      buttonPadding,
      menuItemPadding,
      horizontalPadding,
      dropDownFontSize,
      verticalPadding;
  final Color? borderColor;
  final EdgeInsets? contentPadding;
  final Offset? offset;
  final String? Function(String?)? validator;
  final Color? hintColor;
  final double? borderRadius, dropIconSize;
  final Color? errorBorder;
  final bool? isBorder;

  CustomDropDown2(
      {Key? key,
      this.dropDownData,
      this.isBorder = true,
      this.borderColor = AppColors.BLACK_COLOR,
      this.dropdownValue,
      this.maxLines,
      this.errorBorder,
      this.width,
      this.onChanged,
      this.hintColor,
      this.fontSize,
      this.borderRadius,
      this.hintText,
      this.verticalPadding,
      this.horizontalPadding,
      this.validator,
      this.prefix,
      this.contentPadding,
      this.menuItemPadding,
      this.dropDownWidth,
      this.buttonPadding,
      this.dropIconSize,
      this.dropDownFontSize,
      this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<String?>(
        style: TextStyle(
            fontSize: fontSize,
            color: AppColors.WHITE_COLOR,
            fontFamily: AppFonts.JONES_MEDIUM),
        validator: validator,

        // : dropIconSize ?? 20.h,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(0.0, 16.0, 5.0, 16.0),
          isDense: true,
          prefixIcon: prefix,
          fillColor: AppColors.WHITE_COLOR,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              // width: 2,
              color: errorBorder ?? AppColors.WHITE_COLOR,
              style: isBorder == true ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              // width: 0,
              color: errorBorder ?? AppColors.RED_COLOR,
              style: isBorder == true ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              // width: 0,
              color: borderColor ?? AppColors.WHITE_COLOR,
              style: isBorder == true ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              // width: 1,
              color: borderColor ?? AppColors.WHITE_COLOR,
              style: isBorder == true ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            borderSide: BorderSide(
              // width: 1,
              color: borderColor ?? AppColors.WHITE_COLOR,
              style: isBorder == true ? BorderStyle.solid : BorderStyle.none,
            ),
          ),
          errorStyle: _errorStyle(),
          filled: true,
        ),
        isExpanded: true,
        items: dropDownData!.map<DropdownMenuItem<String?>>((String? value) {
          return DropdownMenuItem<String?>(
            value: value,
            child: _text(
                text: value,
                color: AppColors.BLACK_COLOR,
                fontSize: dropDownFontSize ?? 16.sp,
                maxLines: 1),
          );
        }).toList(),
        hint: _text(
            text: hintText, fontSize: fontSize, color: hintColor, maxLines: 1),
        value: dropdownValue,
        onChanged: onChanged,
        // buttonStyleData: ButtonStyleData(
        //   padding: EdgeInsets.only(left: buttonPadding ?? 7.w),
        //   //width: 0.5.sw,
        // ),
        // dropdownStyleData: DropdownStyleData(
        //   padding: EdgeInsets.only(left: horizontalPadding ?? 5.w),
        //   elevation: 1,
        //   width: dropDownWidth ?? 0.813.sw,
        //   offset: offset ?? const Offset(-5, -20),
        //   isOverButton: false,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(3),
        //     border: Border.all(width: 0, color: AppColors.transparentColor),
        //     color: AppColors.whiteColor,
        //   ),
        // ),
      ),
    );
  }

  TextStyle _errorStyle() {
    return TextStyle(
      color: Colors.red,
      height: 0.7,
      fontSize: 11.sp,
      fontFamily: AppFonts.JONES_MEDIUM,
    );
  }

  Widget _text({String? text, Color? color, int? maxLines, double? fontSize}) {
    return CustomText(
      lineThrough: false,
      text: text ?? "",
      fontSize: fontSize ?? 16.0,
      fontFamily: AppFonts.JONES_MEDIUM,
      textAlign: TextAlign.start,
      fontColor: color ?? AppColors.BLACK_COLOR,
      overflow: TextOverflow.visible,
      // lineSpacing: 1.3,
      maxLines: maxLines,
    );
  }
}

// Widget customizedDropDown(
//     {required List<String> dropDownDataList,
//     required String hintValue,
//     required String? dropDownValue,
//     Color? borderColor,
//     String? iconPath,
//     required Function(String)? onChangeFunction}) {
//   return CustomDropDown2(
//       dropIconSize: 20.h,
//       errorBorder: AppColors.RED_COLOR,
//       hintColor: AppColors.GREY_COLOR,
//       dropDownData: dropDownDataList,
//       hintText: hintValue,
//       dropdownValue: dropDownValue,
//       borderRadius: AppPadding.textFieldBorder,
//       contentPadding:
//           EdgeInsets.symmetric(vertical: AppPadding.textFieldVerticalPadding.h),
//       dropDownWidth: 0.914.sw,
//       prefix: iconPath != null
//           ? Padding(
//               padding: const EdgeInsets.all(14.0),
//               child: Image.asset(
//                 iconPath,
//                 height: 18.h,
//                 width: 18.h,
//                 color: AppColors.YELLOW_COLOR,
//               ),
//             )
//           : null,
//       offset: const Offset(-5, -25),
//       horizontalPadding: 0.w,
//       buttonPadding: 7.w,
//       fontSize: 16.0,
//       borderColor: borderColor ?? AppColors.YELLOW_COLOR,
//       validator: (value) => (value == null || value.isEmpty)
//           ? hintValue + 'AppStrings.FIELD_EMPTY_ERROR_TEXT'
//           : null,
//       onChanged: onChangeFunction);
// }
