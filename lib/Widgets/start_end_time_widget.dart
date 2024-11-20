// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../Utils/app_colors.dart';
// import '../Utils/app_fonts.dart';

// class StartEndTimeWidget extends StatelessWidget {
//   StartEndTimeWidget(
//       {super.key,
//       required this.hour,
//       required this.minute,
//       required this.title,
//       required this.timeAMOrPM,
//       required this.onHourTopTap,
//       required this.onHourBottomTap,
//       required this.onMinuteTopTap,
//       required this.onMinuteBottomTap,
//       required this.onAmPmTopTap,
//       required this.onAmPmBottomTap});

//   final String? title;

//   final int? hour;

//   final int? minute;

//   final String? timeAMOrPM;

//   final Function()? onHourTopTap;

//   final Function()? onHourBottomTap;

//   final Function()? onMinuteTopTap;

//   final Function()? onMinuteBottomTap;

//   final Function()? onAmPmTopTap;

//   final Function()? onAmPmBottomTap;

//   @override
//   Widget build(BuildContext context) {
//     return timeRow(
//         hour: hour ?? 0,
//         minute: minute ?? 0,
//         timeAMOrPM: timeAMOrPM ?? 'AM',
//         title: title ?? '',
//         onHourTopTap: onHourTopTap!,
//         onHourBottomTap: onHourBottomTap!,
//         onMinuteTopTap: onMinuteTopTap!,
//         onMinuteBottomTap: onMinuteBottomTap!,
//         onAmPmTopTap: onAmPmTopTap!,
//         onAmPmBottomTap: onAmPmBottomTap!);
//   }

//   Widget timeRow({
//     required String title,
//     required int hour,
//     required int minute,
//     required String timeAMOrPM,
//     required Function() onHourTopTap,
//     required Function() onHourBottomTap,
//     required Function() onMinuteTopTap,
//     required Function() onMinuteBottomTap,
//     required Function() onAmPmTopTap,
//     required Function() onAmPmBottomTap,
//   }) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 100.w,
//           child: CustomText(
//             text: title,
//             fontColor: AppColors.GREEN_COLOR,
//             fontSize: 16.sp,
//             textAlign: TextAlign.start,
//             fontFamily: AppFonts.KOROLEV_LIGHT,
//           ),
//         ),
//         Expanded(
//           child: customContainer(
//               text: hour < 10 ? "0$hour" : "$hour",
//               onTopTap: onHourTopTap,
//               onBottomTap: onHourBottomTap),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           child: customContainer(
//               text: minute < 10 ? "0$minute" : "$minute",
//               onTopTap: onMinuteTopTap,
//               onBottomTap: onMinuteBottomTap),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         Expanded(
//           child: customContainer(
//             text: timeAMOrPM,
//             onTopTap: onAmPmTopTap,
//             onBottomTap: onAmPmBottomTap,
//           ),
//         )
//       ],
//     );
//   }

//   Widget customContainer(
//       {required String text,
//       required Function() onTopTap,
//       required Function() onBottomTap}) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: AppColors.GREEN_COLOR,
//           border: Border.all(
//             color: AppColors.BLACK_COLOR,
//             width: 1,
//           )),
//       child: Padding(
//           padding:
//               EdgeInsets.only(top: 2.h, bottom: 2.h, left: 5.h, right: 5.h),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               CustomText(
//                 text: text,
//                 fontColor: AppColors.WHITE_COLOR,
//                 fontSize: 16.sp,
//                 textAlign: TextAlign.start,
//                 fontFamily: AppFonts.KOROLEV_LIGHT,
//               ),
//               const SizedBox(
//                 width: 2,
//               ),
//               Column(
//                 children: [
//                   //!---Upward On Tap
//                   InkWell(
//                       onTap: onTopTap,
//                       child: const Icon(
//                         Icons.keyboard_arrow_up,
//                         color: AppColors.WHITE_COLOR,
//                         size: 22,
//                       )),
//                   //!---Downward On Tap
//                   InkWell(
//                       onTap: onBottomTap,
//                       child: const Icon(
//                         Icons.keyboard_arrow_down,
//                         color: AppColors.WHITE_COLOR,
//                         size: 22,
//                       )),
//                 ],
//               ),
//             ],
//           )),
//     );
//   }
// }
