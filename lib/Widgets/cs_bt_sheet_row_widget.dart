// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:giftify/Utils/app_colors.dart';
// import 'package:giftify/Utils/extensions.dart';

// import '../Utils/app_fonts.dart';
// import 'custom_text.dart';

// class SuffixTitlePreffixRow extends StatelessWidget {
//   SuffixTitlePreffixRow({
//     super.key,
//     required this.title,
//     required this.image,
//     this.color,
//     this.subtitle,
//     required this.onTapFunction,
//   });

//   final String title;
//   final String? subtitle;
//   final String image;
//   final Color? color;
//   final Function() onTapFunction;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
//       child: InkWell(
//         splashColor: AppColors.TRANSPARENT_COLOR,
//         onTap: onTapFunction,
//         child: Row(
//           children: [
//             CircleAvatar(
//               backgroundColor: AppColors.BLACK_COLOR,
//               child: Image.asset(
//                 image,
//                 color: color,
//                 height: 17.h,
//                 width: 17.h,
//               ),
//             ),
//             Padding(padding: EdgeInsets.only(left: 0.03.sw)),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomText(
//                   text: title,
//                   fontColor: AppColors.BLACK_COLOR,
//                   fontSize: 14.sp,
//                   fontFamily: AppFonts.JONES_SEMIBOLD,
//                   textAlign: TextAlign.start,
//                 ),
//                 subtitle != null
//                     ? Column(
//                         children: [
//                           3.ph,
//                           CustomText(
//                             text: subtitle,
//                             fontColor: AppColors.BLACK_COLOR,
//                             fontSize: 12.sp,
//                             fontFamily: AppFonts.JONES_REGULAR,
//                             textAlign: TextAlign.start,
//                           ),
//                         ],
//                       )
//                     : const SizedBox.shrink(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
