import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';

class CustomContainerBorderWidget extends StatelessWidget {
  const CustomContainerBorderWidget({
    super.key,
    this.oppacityValue,
    this.offset,
    this.child,
    this.bgColor,
    this.padding,
  });
  final Offset? offset;
  final double? oppacityValue;
  final Widget? child;
  final Color? bgColor;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.WHITE_COLOR,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(oppacityValue ?? 0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: offset ?? const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
