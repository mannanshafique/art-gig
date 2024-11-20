// // ignore_for_file: constant_identifier_names
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:your_fastfood/Module/Resturant/My_Orders/Model/my_order_model.dart';
// import 'package:your_fastfood/Module/Resturant/resturant_controller.dart';
// import 'package:your_fastfood/Module/User/History/Screen/history_detail_screen.dart';
// import 'package:your_fastfood/Module/User/Order/Screens/order_track_screen.dart';
// import 'package:your_fastfood/Utils/app_colors.dart';
// import 'package:your_fastfood/Utils/app_constants.dart';
// import 'package:your_fastfood/Utils/app_fonts.dart';
// import 'package:your_fastfood/Utils/app_strings.dart';
// import 'package:your_fastfood/Utils/extensions.dart';
// import 'package:your_fastfood/Widgets/cs_rating_builder_widget.dart';
// import 'package:your_fastfood/Widgets/custom_text.dart';

// class CustomHistoryCardWidget extends StatelessWidget {
//   const CustomHistoryCardWidget({super.key, required this.historyData});

//   final OrdersData historyData;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         ResturantController.i.historyDetailDataById.value = null;
//         if (historyData.status?.toLowerCase() !=
//                 AppStrings.COMPLETED.toLowerCase() &&
//             historyData.status?.toLowerCase() != 'rejected' &&
//             historyData.status?.toLowerCase() != 'cancelled') {
//           Get.to(() => OrderTrackScreen(
//                 orderId: historyData.id ?? 0,
//               ));
//         } else {
//           Get.to(() => HistoryDetailScreen(
//                 orderId: historyData.id ?? 0,
//               ));
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 10.0),
//         padding: const EdgeInsets.all(10.0),
//         decoration:
//             BoxDecoration(color: AppColors.WHITE_COLOR.withOpacity(0.09)),
//         child: Column(
//           children: [
//             customRowForHistory(
//               leftText: '',
//               isRightOnly: true,
//               mainAxisAlignment: MainAxisAlignment.end,
//               rightWidget: CustomText(
//                 text: '${AppStrings.ORDER_NO}. ${historyData.id}',
//                 fontSize: 16.sp,
//                 fontColor: AppColors.DARK_YELLOW_COLOR,
//                 fontFamily: AppFonts.UNBOUNDED_REGULAR,
//               ),
//             ),
//             10.ph,
//             customRowForHistory(
//               leftText: '',
//               isRightOnly: true,
//               mainAxisAlignment: MainAxisAlignment.end,
//               rightWidget: CustomText(
//                 text: Constants.formatedDateFunction(
//                     createdAt: historyData.createdAt ?? ''),
//                 fontSize: 12.sp,
//                 fontColor: AppColors.WHITE_COLOR,
//                 fontFamily: AppFonts.UNBOUNDED_REGULAR,
//               ),
//             ),
//             10.ph,
//             customRowForHistory(
//               leftText: '${AppStrings.CUSTOMER_NAME}:',
//               isRightOnly: false,
//               rightWidget: Expanded(
//                 child: CustomText(
//                   text:
//                       '${historyData.user?.firstName} ${historyData.user?.lastName}',
//                   fontSize: 12.sp,
//                   textAlign: TextAlign.end,
//                   fontColor: AppColors.WHITE_COLOR,
//                   fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                 ),
//               ),
//             ),
//             10.ph,
//             customRowForHistory(
//               leftText: '${AppStrings.ITEMS}:',
//               isRightOnly: false,
//               rightWidget: Expanded(
//                 child: CustomText(
//                   text: historyData.orderItems
//                       ?.map((orderItem) => orderItem?.menu?.name)
//                       .join(', '),
//                   fontSize: 12.sp,
//                   textAlign: TextAlign.end,
//                   maxLines: 2,
//                   fontColor: AppColors.WHITE_COLOR,
//                   fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                 ),
//               ),
//             ),
//             10.ph,
//             customRowForHistory(
//               leftText: 'Total ${AppStrings.COST}:',
//               isRightOnly: false,
//               rightWidget: Expanded(
//                 child: CustomText(
//                   text: '\$${historyData.amount}',
//                   fontSize: 16.sp,
//                   textAlign: TextAlign.end,
//                   fontColor: AppColors.WHITE_COLOR,
//                   fontFamily: AppFonts.UNBOUNDED_MEDIUM,
//                 ),
//               ),
//             ),
//             10.ph,
//             customRowForHistory(
//                 leftText: AppStrings.STATUS,
//                 isRightOnly: false,
//                 rightWidget: Container(
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: historyData.status?.toLowerCase() == 'rejected' ||
//                             historyData.status?.toLowerCase() == 'cancelled'
//                         ? AppColors.RED_COLOR
//                         : AppColors.MEDIUM_YELLOW_COLOR,
//                     borderRadius: BorderRadius.circular(70.0),
//                   ),
//                   child: CustomText(
//                     text: historyData.status.toString().capitalizeFirst,
//                     // Constants.getStatusinText(
//                     //     historyData.status ?? Status.COMPLETED),
//                     fontSize: 13.sp,
//                     textAlign: TextAlign.end,
//                     fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                     fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                   ),
//                 )),
//             10.ph,
//             historyData.status?.toLowerCase() !=
//                     AppStrings.COMPLETED.toLowerCase()
//                 ? const SizedBox.shrink()
//                 : Column(
//                     children: [
//                       customRowForHistory(
//                           leftText: AppStrings.REVIEWS,
//                           isRightOnly: false,
//                           rightWidget: Row(
//                             children: [
//                               CustomText(
//                                 text: ((double.parse(historyData.rating ??
//                                                     '0.00') *
//                                                 10)
//                                             .floor() /
//                                         10)
//                                     .toString(),
//                                 fontSize: 15.sp,
//                                 textAlign: TextAlign.end,
//                                 fontColor: AppColors.WHITE_COLOR,
//                                 fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                               ),
//                               CustomRatingBarWidget(
//                                   rating:
//                                       double.parse(historyData.rating ?? '0.0'),
//                                   itemSize: 10.h,
//                                   isIgnoreGesture: true,
//                                   onRatingUpdate: (value) {}),
//                             ],
//                           )),
//                       10.ph,
//                     ],
//                   ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget customRowForHistory(
//       {required String leftText,
//       required Widget rightWidget,
//       MainAxisAlignment? mainAxisAlignment,
//       required bool isRightOnly}) {
//     return Row(
//       mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
//       children: [
//         isRightOnly
//             ? const SizedBox.shrink()
//             : Row(
//                 children: [
//                   CustomText(
//                     text: leftText,
//                     fontSize: 12.sp,
//                     fontColor: AppColors.WHITE_COLOR,
//                     fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                   ),
//                   10.pw,
//                 ],
//               ),
//         rightWidget
//       ],
//     );
//   }
// }
