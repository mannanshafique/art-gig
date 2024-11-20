// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:your_fastfood/Utils/app_colors.dart';
// import 'package:your_fastfood/Utils/app_fonts.dart';
// import 'package:your_fastfood/Utils/asset_paths.dart';
// import 'package:your_fastfood/Utils/extensions.dart';
// import 'package:your_fastfood/Widgets/custom_text.dart';

// class CustomIncrementDecrementWidget extends StatelessWidget {
//   const CustomIncrementDecrementWidget(
//       {super.key,
//       this.height,
//       this.width,
//       required this.itemCount,
//       required this.onIncrementTap,
//       required this.onDecrementTap});

//   final String itemCount;
//   final double? height;
//   final double? width;
//   final Function() onIncrementTap;
//   final Function() onDecrementTap;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width ?? 110.w,
//       height: height ?? 40.h,
//       padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 14.0),
//       decoration: BoxDecoration(
//           border: Border.all(
//             color: AppColors.DARK_YELLOW_COLOR,
//           ),
//           borderRadius: BorderRadius.circular(10.0)),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: onDecrementTap,
//             child: Image.asset(
//               AssetPaths.DELETE_ICON,
//               width: 16.h,
//               height: 16.h,
//               color: AppColors.MEDIUM_YELLOW_COLOR,
//             ),
//           ),
//           3.pw,
//           Expanded(
//             child: CustomText(
//               text: itemCount.toString(),
//               fontSize: 13.sp,
//               maxLines: 1,
//               textAlign: TextAlign.center,
//               fontColor: AppColors.BLACK_COLOR,
//               fontFamily: AppFonts.UNBOUNDED_REGULAR,
//             ),
//           ),
//           3.pw,
//           GestureDetector(
//             onTap: onIncrementTap,
//             child: Image.asset(
//               AssetPaths.ADD_CIRCLE_ICON,
//               width: 16.h,
//               height: 16.h,
//               color: AppColors.MEDIUM_YELLOW_COLOR,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
