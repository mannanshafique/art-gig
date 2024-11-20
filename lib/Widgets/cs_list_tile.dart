// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:mecca/Common/Auth/Screens/Setup_Profile/create_edit_profile_screen.dart';
// import 'package:mecca/Utils/app_colors.dart';
// import 'package:mecca/Utils/app_fonts.dart';
// import 'package:mecca/Utils/asset_paths.dart';
// import 'package:mecca/Utils/extensions.dart';
// import 'package:mecca/Widgets/cs_container_border.dart';
// import 'package:mecca/Widgets/custom_text.dart';
// import 'package:mecca/Widgets/user_avatar_widget.dart';

// //!----
// class CustomProfileListTile extends StatelessWidget {
//   const CustomProfileListTile(
//       {super.key,
//       required this.name,
//       required this.imgPath,
//       this.dataWidget,
//       this.nameFontSize,
//       this.isEdit});

//   final String imgPath;
//   final String name;
//   final double? nameFontSize;
//   final Widget? dataWidget;
//   final bool? isEdit;

//   @override
//   Widget build(BuildContext context) {
//     return CustomContainerBorderWidget(
//       //!--
//       child: Row(
//         children: [
//           CustomCicrleAvatarWidget(
//             imgPath: imgPath,
//             isExtendedImage: true,
//           ),
//           10.pw,
//           Expanded(
//             flex: 3,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomText(
//                   text: name,
//                   fontColor: AppColors.PURPLE_COLOR,
//                   fontSize: nameFontSize ?? 18.sp,
//                   fontFamily: AppFonts.KOROLEV_MEDIUM,
//                 ),
//                 dataWidget ?? const SizedBox.shrink()
//               ],
//             ),
//           ),
//           (isEdit ?? false)
//               ? GestureDetector(
//                   onTap: () {
//                     Get.to(() => CreateEditProfileScreen(
//                           isFromEdit: true,
//                         ));
//                   },
//                   child: Image.asset(
//                     AssetPaths.EDIT_ICON,
//                     color: AppColors.BLACK_COLOR,
//                     height: 18.0,
//                   ),
//                 )
//               : const SizedBox.shrink(),
//         ],
//       ),
//     );
//   }

//   // void editProfileOptions({
//   //   required BuildContext context,
//   // }) {
//   //   bool isUser = Get.find<RoleController>().fromUser.value;
//   //   AppBottomSheet().showCustomBottomSheetWithHeight(
//   //     context: context,
//   //     bottomSheetHeight: isUser ? 150.h : 180.h,
//   //     sheetBody: Column(children: [
//   //       SuffixTitlePreffixRow(
//   //         image: AssetPaths.editIcon,
//   //         title: 'Edit About',
//   //         onTapFunction: () {
//   //           AppNavigation.navigatorPop(context);
//   //           Get.to(() => CreateEditProfileScreen(isFromEdit: true));
//   //         },
//   //       ),
//   //       10.ph,
//   //       SuffixTitlePreffixRow(
//   //         image: AssetPaths.multiPickImageIcon,
//   //         title: 'Edit Research Work',
//   //         onTapFunction: () {
//   //           AppNavigation.navigatorPop(context);
//   //           Get.to(() => AddDocumentsScreen(
//   //                 isFromEdit: true,
//   //                 documentType: AppStrings.ADD_RESEARCH,
//   //               ));
//   //         },
//   //       ),
//   //       10.ph,
//   //       !isUser
//   //           ? Column(
//   //               children: [
//   //                 SuffixTitlePreffixRow(
//   //                   image: AssetPaths.calenderIcon,
//   //                   title: 'Edit Schedule',
//   //                   color: AppColors.GREEN_COLOR,
//   //                   onTapFunction: () {
//   //                     AppNavigation.navigatorPop(context);
//   //                     Get.to(() => ScheduleScreen(
//   //                           isFromEdit: true,
//   //                         ));
//   //                   },
//   //                 ),
//   //                 10.ph,
//   //                 SuffixTitlePreffixRow(
//   //                   image: AssetPaths.achievmentIcon,
//   //                   title: 'Eidt Certificate',
//   //                   onTapFunction: () {
//   //                     AppNavigation.navigatorPop(context);
//   //                     Get.to(() => AddDocumentsScreen(
//   //                           isFromEdit: true,
//   //                           documentType: AppStrings.ADD_CERTIFICATE,
//   //                         ));
//   //                   },
//   //                 ),
//   //               ],
//   //             )
//   //           : SuffixTitlePreffixRow(
//   //               image: AssetPaths.achievmentIcon,
//   //               title: 'Edit My Achievement',
//   //               onTapFunction: () {
//   //                 AppNavigation.navigatorPop(context);
//   //                 Get.to(() => AddDocumentsScreen(
//   //                       isFromEdit: true,
//   //                       documentType: AppStrings.ADD_ACHIEVEMENT,
//   //                     ));
//   //               },
//   //             ),
//   //       8.ph,
//   //     ]),
//   //   );
//   // }
// }

// // //!----
// // class CustomChatInboxListTile extends StatelessWidget {
// //   const CustomChatInboxListTile(
// //       {super.key,
// //       required this.title,
// //       required this.subTitle,
// //       required this.imgPath,
// //       required this.unReadCount,
// //       required this.time});

// //   final String imgPath;
// //   final String title;
// //   final String subTitle;
// //   final String unReadCount;
// //   final String time;

// //   @override
// //   Widget build(BuildContext context) {
// //     log('imgPathimgPath : $imgPath');
// //     return CustomContainerBorderWidget(
// //       oppacityValue: 0.4,
// //       child: Row(
// //         children: [
// //           CustomCicrleAvatarWidget(
// //             imgPath: imgPath,
// //           ),
// //           10.pw,
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Expanded(
// //                       child: CustomText(
// //                         text: title,
// //                         fontSize: 14.sp,
// //                         textAlign: TextAlign.start,
// //                         fontFamily: AppFonts.AVERIA_REGULAR,
// //                         fontColor: AppColors.BLACK_COLOR,
// //                       ),
// //                     ),
// //                     10.pw,
// //                     unReadCount != '0'
// //                         ? CircleAvatar(
// //                             backgroundColor: AppColors.GREEN_COLOR,
// //                             radius: 0.025.sw,
// //                             child: CustomText(
// //                               text: unReadCount.toString(),
// //                               fontColor: AppColors.WHITE_COLOR,
// //                               fontSize: 11.sp,
// //                               textAlign: TextAlign.start,
// //                               fontFamily: AppFonts.AVERIA_REGULAR,
// //                             ),
// //                           )
// //                         : SizedBox.shrink(),
// //                   ],
// //                 ),
// //                 4.ph,
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     CustomText(
// //                       text: subTitle,
// //                       fontSize: 13.sp,
// //                       fontFamily: AppFonts.AVERIA_REGULAR,
// //                       fontColor: AppColors.GREY_COLOR,
// //                     ),
// //                     10.pw,
// //                     CustomText(
// //                       text: '4:30',
// //                       fontColor: AppColors.GREY_COLOR,
// //                       fontSize: 12.sp,
// //                       textAlign: TextAlign.start,
// //                       maxLines: 1,
// //                       fontFamily: AppFonts.AVERIA_REGULAR,
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

// // //!----
// // class CustomBlockListTile extends StatelessWidget {
// //   const CustomBlockListTile(
// //       {super.key,
// //       required this.title,
// //       required this.subTitle,
// //       required this.imgPath,
// //       required this.onTap});

// //   final String imgPath;
// //   final String title;
// //   final String subTitle;
// //   final Function() onTap;

// //   @override
// //   Widget build(BuildContext context) {
// //     return CustomContainerBorderWidget(
// //       oppacityValue: 0.4,
// //       child: Row(
// //         children: [
// //           CustomCicrleAvatarWidget(
// //             imgPath: imgPath,
// //           ),
// //           10.pw,
// //           Expanded(
// //             flex: 3,
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 CustomText(
// //                   text: title,
// //                   fontSize: 14.sp,
// //                   textAlign: TextAlign.start,
// //                   fontFamily: AppFonts.AVERIA_REGULAR,
// //                   fontColor: AppColors.BLACK_COLOR,
// //                 ),
// //                 4.ph,
// //                 CustomText(
// //                   text: subTitle,
// //                   fontSize: 13.sp,
// //                   fontFamily: AppFonts.AVERIA_REGULAR,
// //                   fontColor: AppColors.GREY_COLOR,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           10.pw,
// //           Expanded(
// //             flex: 2,
// //             child: CustomButton(
// //               fontSize: 16.sp,
// //               verticalPadding: 10.0,
// //               title: AppStrings.UNBLOCK,
// //               onTap: onTap,
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
