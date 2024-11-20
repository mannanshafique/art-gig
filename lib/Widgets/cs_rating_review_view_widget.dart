// import 'package:flutter/cupertino.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:your_fastfood/Utils/app_colors.dart';
// import 'package:your_fastfood/Utils/app_fonts.dart';
// import 'package:your_fastfood/Utils/asset_paths.dart';
// import 'package:your_fastfood/Utils/extensions.dart';
// import 'package:your_fastfood/Widgets/custom_text.dart';

// class CustomRatingReviewViewWidget extends StatelessWidget {
//   const CustomRatingReviewViewWidget(
//       {super.key, required this.ratingReview, this.fontColor});

//   final String ratingReview;
//   final Color? fontColor;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Image.asset(
//           AssetPaths.HALF_FILL_STAR_ICON,
//           height: 14.h,
//           color: AppColors.YELLOW_COLOR,
//         ),
//         5.pw,
//         CustomText(
//           text: ratingReview,
//           fontColor: fontColor ?? AppColors.YELLOW_COLOR,
//           fontSize: 12.sp,
//           fontFamily: AppFonts.UNBOUNDED_REGULAR,
//         ),
//       ],
//     );
//   }
// }
