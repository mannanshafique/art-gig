// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:your_shadow/Utils/app_colors.dart';
// import 'package:your_shadow/Utils/app_fonts.dart';
// import 'package:your_shadow/Utils/app_strings.dart';
// import 'package:your_shadow/Utils/extensions.dart';
// import 'package:your_shadow/Widgets/custom_text.dart';

// class LiveTextContainer extends StatelessWidget {
//   const LiveTextContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.WHITE_COLOR,
//         borderRadius: BorderRadius.circular(20.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(1),
//             spreadRadius: 0,
//             blurRadius: 4,
//             offset: Offset(0, 2), // changes position of shadow
//           ),
//         ],
//       ),
//       padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 4.0,
//             backgroundColor: AppColors.GREEN_COLOR,
//           ),
//           4.pw,
//           CustomText(
//             text: AppStrings.LIVE,
//             fontSize: 12.sp,
//             fontColor: AppColors.BLACK_COLOR,
//             fontFamily: AppFonts.AVERIA_REGULAR,
//           ),
//         ],
//       ),
//     );
//   }
// }
