// import 'package:easy_stepper/easy_stepper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mecca/Utils/app_colors.dart';
// import 'package:mecca/Utils/app_fonts.dart';
// import 'package:mecca/Widgets/custom_text.dart';

// class CustomStepperWidget extends StatelessWidget {
//   CustomStepperWidget({super.key, required this.activeStep});

//   int activeStep;

//   @override
//   Widget build(BuildContext context) {
//     return EasyStepper(
//       activeStep: activeStep,
//       direction: Axis.horizontal,
//       internalPadding: 0,
//       padding: EdgeInsets.zero,
//       showTitle: false,
//       showScrollbar: false,
//       disableScroll: true,
//       lineStyle: LineStyle(
//         lineLength: 110.w,
//         lineType: LineType.dotted,
//       ),
//       showLoadingAnimation: false,
//       stepRadius: 12,
//       showStepBorder: false,
//       // lineDotRadius: 1.5,
//       steps: [
//         easyStepWidget(
//           title: '1',
//           bgColor:
//               activeStep >= 0 ? AppColors.PURPLE_COLOR : AppColors.WHITE_COLOR,
//           titleColor:
//               activeStep >= 0 ? AppColors.WHITE_COLOR : AppColors.BLACK_COLOR,
//         ),
//         easyStepWidget(
//           title: '2',
//           bgColor:
//               activeStep >= 1 ? AppColors.PURPLE_COLOR : AppColors.WHITE_COLOR,
//           titleColor:
//               activeStep >= 1 ? AppColors.WHITE_COLOR : AppColors.BLACK_COLOR,
//         ),
//         easyStepWidget(
//           title: '3',
//           bgColor:
//               activeStep >= 2 ? AppColors.PURPLE_COLOR : AppColors.WHITE_COLOR,
//           titleColor:
//               activeStep >= 2 ? AppColors.WHITE_COLOR : AppColors.BLACK_COLOR,
//         ),
//       ],
//       onStepReached: (index) {
//         // setState(() => activeStep = index)
//       },
//     );
//   }

//   EasyStep easyStepWidget({
//     required String title,
//     required Color bgColor,
//     required Color titleColor,
//   }) {
//     return EasyStep(
//       customStep: Stack(
//         children: [
//           CircleAvatar(
//             radius: 12,
//             backgroundColor: AppColors.AMBER_COLOR,
//             child: CircleAvatar(
//               radius: 10,
//               backgroundColor: bgColor,
//             ),
//           ),
//           Center(
//             child: CustomText(
//                 text: title,
//                 fontSize: 14.sp,
//                 fontColor: titleColor,
//                 fontFamily: AppFonts.KOROLEV_MEDIUM),
//           ),
//         ],
//       ),
//     );
//   }
// }
