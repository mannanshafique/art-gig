// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:your_shadow/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:your_shadow/MainMenu/Screens/Request/Model/requests_model.dart';
// import 'package:your_shadow/Module/User/RateReview/create_edit_review.dart';
// import 'package:your_shadow/Utils/app_colors.dart';
// import 'package:your_shadow/Utils/app_fonts.dart';
// import 'package:your_shadow/Utils/app_strings.dart';
// import 'package:your_shadow/Utils/asset_paths.dart';
// import 'package:your_shadow/Utils/extensions.dart';
// import 'package:your_shadow/Widgets/cs_container_border.dart';
// import 'package:your_shadow/Widgets/custom_button.dart';
// import 'package:your_shadow/Widgets/custom_text.dart';
// import 'package:your_shadow/Widgets/user_avatar_widget.dart';

// class CustomStatusCardWidget extends StatefulWidget {
//   const CustomStatusCardWidget({super.key, required this.requestModel});

//   final RequestModel requestModel;

//   @override
//   State<CustomStatusCardWidget> createState() => _CustomStatusCardWidgetState();
// }

// class _CustomStatusCardWidgetState extends State<CustomStatusCardWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final bool isFromUser = Get.find<RoleController>().fromUser.value;
//     return CustomContainerBorderWidget(
//       oppacityValue: 0.4,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomCicrleAvatarWidget(
//             imgPath: widget.requestModel.userImage,
//             radius: 42.h,
//           ),
//           8.pw,
//           Expanded(
//             child: Column(
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomText(
//                             text: widget.requestModel.username,
//                             fontSize: 15.sp,
//                             fontColor: AppColors.BLACK_COLOR,
//                             fontFamily: AppFonts.AVERIA_REGULAR,
//                           ),
//                           2.ph,
//                           CustomText(
//                             text: widget.requestModel.userSpecility,
//                             fontSize: 13.sp,
//                             fontColor: AppColors.GREY_COLOR,
//                             fontFamily: AppFonts.AVERIA_LIGHT,
//                           ),
//                         ],
//                       ),
//                     ),
//                     5.pw,
//                     Expanded(
//                         child: statusSwitchCase(
//                             status: widget.requestModel.status,
//                             isUser: isFromUser)),
//                   ],
//                 ),
//                 2.ph,
//                 Divider(
//                   color: AppColors.GREY_COLOR,
//                 ),
//                 2.ph,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           AssetPaths.calenderIcon,
//                           height: 18.0,
//                           color: AppColors.GREEN_COLOR,
//                         ),
//                         10.pw,
//                         CustomText(
//                           text: widget.requestModel.createdAt,
//                           fontSize: 14.sp,
//                           fontColor: AppColors.GREY_COLOR,
//                           fontFamily: AppFonts.AVERIA_REGULAR,
//                         ),
//                       ],
//                     ),
//                     iconsAsPerStatus(
//                                 status: widget.requestModel.status,
//                                 isUser: isFromUser) !=
//                             ''
//                         ? Image.asset(
//                             iconsAsPerStatus(
//                                 status: widget.requestModel.status,
//                                 isUser: isFromUser),
//                             height: 18.0,
//                             color: AppColors.GREEN_COLOR,
//                           )
//                         : SizedBox.shrink(),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget statusSwitchCase({required Status status, required bool isUser}) {
//     // bool isUser = Get.find<RoleController>().fromUser.value;
//     switch (status) {
//       case Status.PENDING:
//         return Row(
//           children: isUser
//               ? [
//                   Flexible(
//                     child: CustomButton(
//                       title: 'Cancel Request',
//                       verticalPadding: 10.0,
//                       horizontalPadding: 8.0,
//                       fontSize: 13.sp,
//                       onTap: () {
//                         int index = AppStrings.requestDataList.indexWhere(
//                             (element) => element.id == widget.requestModel.id);
//                         AppStrings.requestDataList[index].status =
//                             Status.CANCELLED;
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                 ]
//               : [
//                   Flexible(
//                     child: CustomButton(
//                       title: 'Accept',
//                       onTap: () {
//                         int index = AppStrings.requestDataList.indexWhere(
//                             (element) => element.id == widget.requestModel.id);
//                         AppStrings.requestDataList[index].status =
//                             Status.IN_PROGRESS;
//                         setState(() {});
//                       },
//                       verticalPadding: 10.0,
//                       horizontalPadding: 8.0,
//                       fontSize: 13.sp,
//                     ),
//                   ),
//                   5.pw,
//                   Flexible(
//                     child: CustomButton(
//                       title: 'Reject',
//                       verticalPadding: 10.0,
//                       horizontalPadding: 8.0,
//                       fontSize: 13.sp,
//                       borderColor: AppColors.GREEN_COLOR,
//                       fontColor: AppColors.GREEN_COLOR,
//                       containerColor: AppColors.WHITE_COLOR,
//                       onTap: () {
//                         int index = AppStrings.requestDataList.indexWhere(
//                             (element) => element.id == widget.requestModel.id);
//                         AppStrings.requestDataList[index].status =
//                             Status.REJECTED;
//                         setState(() {});
//                       },
//                     ),
//                   ),
//                 ],
//         );
//       case Status.IN_PROGRESS:
//         return isUser
//             ? CustomButton(
//                 title: 'Mark As Complete',
//                 onTap: () {
//                   int index = AppStrings.requestDataList.indexWhere(
//                       (element) => element.id == widget.requestModel.id);
//                   AppStrings.requestDataList[index].status = Status.COMPLETED;
//                   setState(() {});
//                 },
//                 verticalPadding: 10.0,
//                 horizontalPadding: 8.0,
//                 fontSize: 13.sp,
//               )
//             : CustomText(
//                 text: 'In-Progress',
//                 fontSize: 14.sp,
//                 textAlign: TextAlign.end,
//                 fontColor: AppColors.YELLOW_COLOR,
//                 fontFamily: AppFonts.AVERIA_REGULAR,
//               );
//       case Status.COMPLETED:
//         return isUser
//             ? CustomButton(
//                 title: 'Post A Review',
//                 onTap: () {
//                   int index = AppStrings.requestDataList.indexWhere(
//                       (element) => element.id == widget.requestModel.id);
//                   Get.to(() => CreateEditReview(
//                         isFromEdit: false,
//                         index: index,
//                       ));
//                 },
//                 verticalPadding: 10.0,
//                 horizontalPadding: 8.0,
//                 fontSize: 13.sp,
//               )
//             : CustomText(
//                 text: 'Completed',
//                 textAlign: TextAlign.end,
//                 fontSize: 14.sp,
//                 fontColor: AppColors.GREEN_COLOR,
//                 fontFamily: AppFonts.AVERIA_REGULAR,
//               );
//       case Status.REJECTED:
//         return CustomText(
//           text: 'Rejected',
//           textAlign: TextAlign.end,
//           fontSize: 14.sp,
//           fontColor: AppColors.RED_COLOR,
//           fontFamily: AppFonts.AVERIA_REGULAR,
//         );
//       case Status.CANCELLED:
//         return CustomText(
//           text: 'Cancelled',
//           textAlign: TextAlign.end,
//           fontSize: 14.sp,
//           fontColor: AppColors.RED_COLOR,
//           fontFamily: AppFonts.AVERIA_REGULAR,
//         );
//       case Status.REVIEWED:
//         return isUser
//             ? CustomText(
//                 text: 'Reviewed',
//                 fontSize: 14.sp,
//                 textAlign: TextAlign.end,
//                 fontColor: AppColors.GREEN_COLOR,
//                 fontFamily: AppFonts.AVERIA_REGULAR,
//               )
//             : CustomText(
//                 text: 'Reviewed',
//                 textAlign: TextAlign.end,
//                 fontSize: 14.sp,
//                 fontColor: AppColors.GREEN_COLOR,
//                 fontFamily: AppFonts.AVERIA_REGULAR,
//               );
//       default:
//         return Container();
//     }
//   }

//   String iconsAsPerStatus({required Status status, required bool isUser}) {
// // bool isUser = Get.find<RoleController>().fromUser.value;
//     switch (status) {
//       case Status.PENDING:
//         return isUser ? AssetPaths.pendingIcon : '';
//       case Status.IN_PROGRESS:
//         return AssetPaths.inProgressIcon;
//       case Status.COMPLETED:
//         return AssetPaths.checkIcon;
//       default:
//         return '';
//     }
//   }
// }

// enum Status {
//   PENDING,
//   CANCELLED,
//   REJECTED,
//   IN_PROGRESS,
//   COMPLETED,
//   REVIEWED,
//   SCHEDULE
// }


// //!--------Status
// //* Doctor
// //? Pending -- having Accept/Reject Button
// //? InProgress -- having Text(In-progress)
// //? Completed -- having Text(Completed)
// //? Schedlue -- having Nothing
// //* User
// //? Pending -- having Cancel Button
// //? InProgress -- having Mark as COmplete Button
// //? Completed -- having Post a Review Button
