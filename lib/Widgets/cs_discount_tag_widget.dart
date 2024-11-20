// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:your_fastfood/Utils/app_colors.dart';
// import 'package:your_fastfood/Utils/app_fonts.dart';
// import 'package:your_fastfood/Utils/asset_paths.dart';
// import 'package:your_fastfood/Utils/extensions.dart';
// import 'package:your_fastfood/Widgets/custom_text.dart';

// class CustomDiscountTagWidget extends StatelessWidget {
//   const CustomDiscountTagWidget(
//       {super.key,
//       required this.discountInPercent,
//       required this.margin,
//       this.fontSize,
//       this.fontColor,
//       this.bgColor});
//   final String discountInPercent;
//   final double margin;
//   final double? fontSize;
//   final Color? fontColor;
//   final Color? bgColor;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: margin, left: margin),
//       decoration: BoxDecoration(
//           color: bgColor ?? AppColors.MEDIUM_YELLOW_COLOR,
//           borderRadius: BorderRadius.circular(5.0)),
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(
//             AssetPaths.TAG_ICON,
//             color: fontColor ?? const Color.fromRGBO(63, 63, 63, 1),
//             fit: BoxFit.cover,
//             height: 13.h,
//           ),
//           5.pw,
//           CustomText(
//             text: '$discountInPercent% off',
//             // '${resMenuData.discountInPercentage}% off',
//             fontSize: fontSize ?? 11.sp,
//             textAlign: TextAlign.start,
//             fontColor: fontColor ?? AppColors.MEDIUM_BLACK_COLOR,
//             fontFamily: AppFonts.UNBOUNDED_MEDIUM,
//           ),
//         ],
//       ),
//     );
//   }
// }
