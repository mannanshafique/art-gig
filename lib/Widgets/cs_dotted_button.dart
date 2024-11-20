import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../Utils/app_colors.dart';

class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({super.key, required this.widget, this.padding});

  final Widget widget;
  final EdgeInsets?  padding;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: AppColors.BLACK_COLOR,
      radius: const Radius.circular(12),
      padding: padding ?? const EdgeInsets.all(6),
      child: widget,
    );
  }
}
