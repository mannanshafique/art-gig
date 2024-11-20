// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:your_shadow/Utils/app_colors.dart';
// import 'package:your_shadow/Utils/app_fonts.dart';
// import 'package:your_shadow/Utils/app_strings.dart';
// import 'package:your_shadow/Utils/asset_paths.dart';
// import 'package:your_shadow/Utils/extensions.dart';
// import 'package:your_shadow/Widgets/cs_container_border.dart';
// import 'package:your_shadow/Widgets/custom_text.dart';

// class CustomSetupProfileTiles extends StatelessWidget {
//   const CustomSetupProfileTiles(
//       {super.key,
//       required this.researchTitle,
//       required this.researchDesc,
//       required this.researchImage,
//       this.onTapCross,
//       required this.stepType});

//   final String stepType;
//   final String? researchTitle;
//   final String? researchImage;
//   final String? researchDesc;
//   final Function()? onTapCross;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CustomContainerBorderWidget(
//           child: Row(
//             children: [
//               Container(
//                 height: 62.h,
//                 width: 74.h,
//                 padding: stepType != AppStrings.YOUR_RESEARCH
//                     ? const EdgeInsets.all(10.0)
//                     : EdgeInsets.zero,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15.0),
//                   border: Border.all(
//                       color: stepType == AppStrings.YOUR_RESEARCH
//                           ? AppColors.TRANSPARENT_COLOR
//                           : AppColors.BLACK_COLOR),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15.0),
//                   child: stepType != AppStrings.YOUR_RESEARCH
//                       ? Image.asset(
//                           AssetPaths.achievmentIcon,
//                           fit: BoxFit.contain,
//                         )
//                       : (researchImage ?? '').contains('assets')
//                           ? Image.asset(
//                               researchImage ?? '',
//                               fit: BoxFit.cover,
//                             )
//                           : Image.file(
//                               File(researchImage ?? ''),
//                               fit: stepType == AppStrings.YOUR_RESEARCH
//                                   ? BoxFit.cover
//                                   : BoxFit.contain,
//                             ),
//                 ),
//               ),
//               6.pw,
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       text: researchTitle,
//                       fontSize: 13.sp,
//                       fontColor: AppColors.BLACK_COLOR,
//                       fontFamily: AppFonts.AVERIA_LIGHT,
//                     ),
//                     4.ph,
//                     CustomText(
//                       text: researchDesc,
//                       fontSize: 13.sp,
//                       maxLines: 2,
//                       textAlign: TextAlign.start,
//                       fontFamily: AppFonts.AVERIA_LIGHT,
//                       fontColor: Colors.grey,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         onTapCross != null
//             ? Positioned(
//                 right: 10.0,
//                 top: 6.0,
//                 child: GestureDetector(
//                   onTap: onTapCross,
//                   child: Image.asset(
//                     'assets/icons/ic_cross.png',
//                     height: 21.h,
//                   ),
//                 ),
//               )
//             : SizedBox.shrink()
//       ],
//     );
//   }
// }
