import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import 'dialog_header_widget.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key, required this.body, required this.headerText});

  final String headerText;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 0.07.sw),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.03.sw),
      ),
      actionsPadding: EdgeInsets.only(
        bottom: 0.02.sh,
        left: 0.06.sw,
        right: 0.06.sw,
      ),
      backgroundColor: AppColors.TRANSPARENT_COLOR,
      title: Column(
        children: [
          DialogHeaderWidget(headerText: headerText),
          Container(
              decoration: const BoxDecoration(
                  color: AppColors.WHITE_COLOR,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              child: body),
        ],
      ),
    );
  }
}
