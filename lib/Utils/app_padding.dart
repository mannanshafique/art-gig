import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPadding {
  static const double btnAndTxFieldBorderRadius = 12.0;
  static const double defaultHorizontalPadding = 20.0;
  static double backIconHeight = 3.5.sp;

  static const double buttonVerticalPadding = 18.0;
  static const double textFieldVerticalPadding = 18.0;
  static const double textFieldHorizontalPadding = 10.0;

  static const double defaultPadding = 16.0;
  static const double authContainerTopPadding = 30;
  static const double leftPadding = 12.0;
  static const double rightPadding = 12.0;
  static const double topPadding = 12.0;
  static double settingBoxHeight = 50.h;
  static const buttonBorder = 50.0;
  static const textFieldBorder = 8.0;
  static const appBarIconHeight = 2.5;

  static Widget appPadding() => const Padding(padding: EdgeInsets.all(12.0));
}
