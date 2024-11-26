// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_fonts.dart';

class CustomTextField extends StatelessWidget {
  void Function()? onPrefixTap, onTap;
  String? prefxicon, suffixIcon;
  bool? isSuffixIcon, isDataFill;
  TextInputType? keyboardType;
  double? prefixRIghtPadding, sufixRIghtPadding;
  int? lines, maxlines;
  bool readOnly, divider, label, isPasswordField, showShadow;
  Color? color, eyeColor, bgColor, decorationColor;
  EdgeInsetsGeometry? contentPadding;
  final String hint;
  final double? fontsize, width, verticalPadding;
  final bool? obscureText, isColorDecoration;
  final Color? prefixIconColor, bdColor, borderColor;
  FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function()? onSuffixTap;
  TextEditingController? controller;
  String? Function(String?)? validator;
  void Function(String)? onchange;
  final void Function()? onclick;
  List<TextInputFormatter>? inputFormatters;
  TextCapitalization? textCapitalization;
  final bool? isDense;
  final Color? labelColor;
  final double? borderRadius;

  CustomTextField({
    Key? key,
    this.isDense,
    this.labelColor,
    this.onSuffixTap,
    this.onPrefixTap,
    this.borderRadius,
    this.prefxicon,
    this.prefixRIghtPadding,
    this.verticalPadding,
    this.sufixRIghtPadding,
    this.borderColor = AppColors.TRANSPARENT_COLOR,
    this.decorationColor = AppColors.GREY_COLOR,
    this.isSuffixIcon,
    this.isColorDecoration = false,
    this.lines,
    this.maxlines,
    this.bgColor,
    this.textCapitalization,
    this.bdColor,
    this.showShadow = true,
    this.obscureText = false,
    this.isPasswordField = false,
    required this.hint,
    this.fontsize,
    this.isDataFill = false,
    this.width,
    this.suffixIcon,
    this.prefixIconColor,
    this.contentPadding,
    this.onclick,
    this.controller,
    this.validator,
    this.onchange,
    this.onTap,
    this.keyboardType,
    this.focusNode,
    this.readOnly = false,
    this.divider = true,
    this.label = true,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.onEditingComplete,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 2.h),
      decoration: BoxDecoration(
          color: bgColor ?? AppColors.WHITE_COLOR,
          // color: isColorDecoration == true ? decorationColor : bgColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 50.r),
          border: Border.all(color: borderColor ?? AppColors.TRANSPARENT_COLOR),
          boxShadow: [
            // BoxShadow(
            //     color: isColorDecoration == true
            //         ? AppColors.TRANSPARENT_COLOR
            //         : showShadow == true
            //             ? AppColors.LIGHT_GREY_COLOR
            //             : AppColors.TRANSPARENT_COLOR,
            //     offset: const Offset(0.0, 0.0),
            //     blurRadius: 1.0,
            //     spreadRadius: 1.0)
          ]),
      child: TextFormField(
        focusNode: focusNode,
        onTap: onTap,
        readOnly: readOnly,
        textInputAction: TextInputAction.done,
        textCapitalization: textCapitalization ?? TextCapitalization.sentences,
        keyboardType: keyboardType,
        onChanged: onchange,
        validator: validator,
        cursorColor: Theme.of(context).iconTheme.color,
        maxLines: maxlines ?? 1,
        controller: controller,
        // minLines: lines ?? 1,
        onFieldSubmitted: onFieldSubmitted,
        autofocus: false,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          fontSize: fontsize ?? 16.sp,
          color: Theme.of(context).textTheme.bodySmall?.color,
          fontFamily: AppFonts.JONES_MEDIUM,
        ),
        decoration:
            // isColorDecoration == true
            //     ? colorInputDecoration()
            //     :
            outlineInputDecoration(),
      ),
    );
  }

  InputDecoration outlineInputDecoration() {
    return InputDecoration(
      alignLabelWithHint: (maxlines ?? 0) > 1 ? true : false,
      // contentPadding: prefxicon == null
      //     ? EdgeInsets.symmetric(vertical: 6.sp, horizontal: 14.sp)
      //     : contentPadding,
      fillColor: AppColors.TRANSPARENT_COLOR,
      filled: true,
      contentPadding: contentPadding ?? const EdgeInsets.all(12),
      labelText: label ? hint : null,
      hintText: label ? null : hint,
      hintStyle: TextStyle(
        color: AppColors.GREY_COLOR.withOpacity(0.8),
        fontSize: 14.sp,
        fontFamily: AppFonts.JONES_MEDIUM,
      ),
      labelStyle: TextStyle(
        color: labelColor ?? AppColors.MEDIUM_LIGHT_GREY_COLOR,
        fontSize: 14.sp,
      ),
      border: InputBorder.none,
      isDense: isDense ?? true,
      errorStyle: const TextStyle(overflow: TextOverflow.visible),
      prefixIcon: prefxicon != null
          ? GestureDetector(
              onTap: onPrefixTap,
              child: Container(
                height: 25.h,
                margin: EdgeInsets.only(left: 10.w, right: 8.w),
                padding: EdgeInsets.only(right: prefixRIghtPadding ?? 5.w),
                decoration: divider == true
                    ? const BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(color: AppColors.LIGHT_GREY_COLOR)))
                    : null,
                child: Image.asset(
                  prefxicon!,
                  height: 20.h,
                  width: 22.w,
                  color: prefixIconColor ?? AppColors.BLACK_COLOR,
                  // scale: 3.5.sp,
                ),
              ),
            )
          : null,
      prefixIconConstraints: const BoxConstraints(),
      suffixIcon: isSuffixIcon == true
          ? _suffixIconWidget(onTap: onSuffixTap ?? () {})
          : null,
    );
  }

  Widget _suffixIconWidget({required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: Image.asset(
          suffixIcon!,
          height: 10.h,
          color: color ?? AppColors.BLACK_COLOR,
        ),
      ),
    );
  }
}
