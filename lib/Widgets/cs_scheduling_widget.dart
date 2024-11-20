// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mecca/Utils/app_colors.dart';
// import 'package:mecca/Utils/asset_paths.dart';
// import 'package:mecca/Widgets/custom_text.dart';

// class CustomAppoinmentScheduleWidget extends StatelessWidget {
//   final String? days, timing;
//   final bool? showArrow;
//   Color? borderColor;
//   void Function()? onTap;
//   CustomAppoinmentScheduleWidget(
//       {super.key,
//       this.days,
//       this.timing,
//       this.onTap,
//       this.showArrow = false,
//       this.borderColor});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 6.h),
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//             color: AppColors.WHITE_COLOR,
//             borderRadius: BorderRadius.circular(15.r),
//             border: Border.all(color: borderColor ?? AppColors.WHITE_COLOR),
//             boxShadow: [
//               BoxShadow(
//                   color: AppColors.GREY_COLOR.withOpacity(0.2),
//                   offset: const Offset(0, 0),
//                   blurRadius: 1.5,
//                   spreadRadius: 1.5), //B
//             ],
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 15.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(width: 96.w, child: _text(days)),
//                 showArrow! ? SizedBox() : Spacer(),
//                 _text(timing),
//                 showArrow! ? _icon() : SizedBox()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _text(text) {
//     return CustomText(
//       text: text,
//       fontColor: AppColors.BLACK_COLOR,
//       fontSize: 14.sp,
//       textAlign: TextAlign.start,
//     );
//   }

//   Widget _icon() {
//     return Image.asset(
//       AssetPaths.BACK_ARROW_ICON,
//       scale: 4.sp,
//     );
//   }
// }
