// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:giftify/Utils/asset_paths.dart';
// import 'package:giftify/Utils/date_time_manager.dart';
// import 'package:giftify/Widgets/cs_container_border.dart';
// import 'package:giftify/Widgets/custom_image_widget.dart';
// import '../Module/Post/Model/post_model_1.dart';
// import '../Utils/app_colors.dart';
// import '../Utils/app_fonts.dart';
// import 'custom_text.dart';
// import 'user_avatar_widget.dart';

// class PostContainer extends StatefulWidget {
//   const PostContainer(
//       {super.key,
//       this.onTap,
//       this.postData,
//       // required this.feedData,
//       this.onProfileTap,
//       required this.isPostDetial,
//       required this.isComeFromPostDetails});
//   final Function()? onTap;
//   // final FeedPostModel feedData;
//   final Function()? onProfileTap;
//   final bool isPostDetial;
//   final PostData? postData;
//   final bool isComeFromPostDetails;

//   @override
//   State<PostContainer> createState() => _PostContainerState();
// }

// class _PostContainerState extends State<PostContainer> {
//   @override
//   Widget build(BuildContext context) {
//     // final images = feedData.files?.map((element) {
//     //   return element;
//     // }).toList();
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0),
//       // padding: EdgeInsets.only(bottom: widget.isPostDetial ? 2.0 : 10.0),
//       child: CustomContainerBorderWidget(
//         bgColor: AppColors.LIGHT_GREY_COLOR,
//         oppacityValue: 0.0,
//         // oppacityValue: widget.isPostDetial ? 0.0 : 0.4,
//         // padding: widget.isPostDetial ? EdgeInsets.zero : null,
//         child: GestureDetector(
//           onTap: widget.onTap,
//           child: Container(
//             decoration: const BoxDecoration(
//               color: AppColors.LIGHT_GREY_COLOR,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //!------Post Header
//                 postHeader(
//                   context: context,
//                   //  userData: widget.feedData
//                 ),
//                 8.verticalSpace,
//                 //!---Title
//                 CustomText(
//                   fontSize: 16.sp,
//                   fontColor: AppColors.BLACK_COLOR,
//                   text: widget.postData?.title ?? "",
//                   maxLines: 1,
//                   // maxLines: widget.isPostDetial ? 10 : 2,
//                   fontFamily: AppFonts.MONTSERRAT_MEDIUM,
//                   textAlign: TextAlign.start,
//                 ),
//                 8.verticalSpace,
//                 //! Content Text
//                 CustomText(
//                   fontSize: 13.sp,
//                   fontColor: AppColors.BLACK_COLOR,
//                   text: widget.postData?.description ?? "",
//                   maxLines: widget.isPostDetial ? 10 : 2,
//                   fontFamily: AppFonts.MONTSERRAT_REGULAR,
//                   textAlign: TextAlign.start,
//                 ),
//                 10.verticalSpace,
//                 CustomImageWidget(
//                   imageHeight: 150.h,
//                   imageWidth: MediaQuery.of(context).size.width,
//                   isBorder: false,
//                   borderRadius: BorderRadius.circular(10.0),
//                   shape: BoxShape.rectangle,
//                   imageUrl:
//                       widget.postData?.images?.firstOrNull?.attachment ?? null,
//                   imageAssets: AssetPaths.PROFILE_ICON,
//                 ),
//                 // SizedBox(
//                 //   height: 150.h,
//                 //   width: MediaQuery.of(context).size.width,
//                 //   child: Container(
//                 //       decoration: BoxDecoration(
//                 //           borderRadius: BorderRadius.circular(10.0)),
//                 //       child: ClipRRect(
//                 //         borderRadius: BorderRadius.circular(10.0),
//                 //         child: widget.feedData.image.startsWith('assets')
//                 //             ? Image.asset(
//                 //                 widget.feedData.image,
//                 //                 fit: BoxFit.cover,
//                 //               )
//                 //             : Image.file(
//                 //                 File(
//                 //                   widget.feedData.image,
//                 //                 ),
//                 //                 fit: BoxFit.cover,
//                 //               ),
//                 //       )),
//                 // ),
//                 //!----Image
//                 // images != null
//                 //     ? Row(
//                 //         children: [
//                 //           ...List.generate(
//                 //               (images.length > 2 ? 2 : images.length) ?? 0,
//                 //               (index) => Expanded(
//                 //                     child: SizedBox(
//                 //                         height: 150,
//                 //                         child: images[index].type == 'video'
//                 //                             ? Stack(
//                 //                                 alignment: Alignment.center,
//                 //                                 children: [
//                 //                                   Positioned.fill(
//                 //                                       child: Container(
//                 //                                     color: Colors.amber,
//                 //                                   )),
//                 //                                   Center(
//                 //                                     child: Container(
//                 //                                         decoration:
//                 //                                             const BoxDecoration(
//                 //                                                 color:
//                 //                                                     AppColors
//                 //                                                         .WHITE_COLOR,
//                 //                                                 shape: BoxShape
//                 //                                                     .circle),
//                 //                                         child: const Icon(
//                 //                                           Icons.play_arrow,
//                 //                                           size: 30,
//                 //                                         )),
//                 //                                   ),
//                 //                                 ],
//                 //                               )
//                 //                             : Container(
//                 //                                 color: Colors.pink,
//                 //                                 child: Text('post'),
//                 //                               )),
//                 //                   ))
//                 //         ],
//                 //       )
//                 //     : const SizedBox(),
//                 10.verticalSpace,
//                 _likeAndComments(
//                     // feedPostModel: widget.feedData
//                     ),
//                 5.verticalSpace,
//                 const Divider(
//                   color: AppColors.GREY_COLOR,
//                 ),
//                 5.verticalSpace,
//                 likeCommentTap(
//                   context: context,
//                   // feedPostModel: widget.feedData
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget postHeader({
//     required BuildContext context,
//     //  required FeedPostModel userData
//   }) {
//     return GestureDetector(
//       onTap: widget.onProfileTap,
//       child: Row(
//         children: [
//           //!---Profile Iamge
//           GestureDetector(
//             onTap: () {
//               // Get.to(ProfileScreen(isOwnProfile: false));
//             },
//             child: CustomCicrleAvatarWidget(
//               imgPath: widget.postData?.user?.imageName,
//               radius: 45.h,
//             ),
//           ),
//           const SizedBox(width: 8),

//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //!---User name
//                 CustomText(
//                   text: widget.postData?.user?.firstName ?? "",
//                   fontSize: 14.sp,
//                   fontColor: AppColors.BLACK_COLOR,
//                   fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
//                 ),
//                 const SizedBox(height: 4),
//                 //!---Date
//                 CustomText(
//                   fontSize: 11.sp,
//                   fontColor: AppColors.BLACK_COLOR,
//                   text: DateTimeManager.timeAgoMethod(
//                       createdDate: widget.postData?.createdAt ?? ''),
//                   fontFamily: AppFonts.MONTSERRAT_REGULAR,
//                 ),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               postOptions(
//                 context: context,
//                 // userData: userData
//               );
//             },
//             child: Container(
//               padding: EdgeInsets.only(left: 8.w, top: 5, bottom: 5),
//               color: AppColors.TRANSPARENT_COLOR,
//               child: Image.asset(
//                 AssetPaths.VERTICAL_DOTS_ICON,
//                 color: AppColors.BLACK_COLOR,
//                 scale: 3,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget likeCommentTap({
//     required BuildContext context,
//     // required FeedPostModel feedPostModel
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         GestureDetector(
//           onTap: () {
//             // int index = AppStrings.feedPostsList.indexWhere((element) =>
//             //     element.contentData.toLowerCase() ==
//             //     feedPostModel.contentData.toLowerCase());
//             // if (AppStrings.feedPostsList[index].isLiked) {
//             //   AppStrings.feedPostsList[index].likes--;
//             // } else {
//             //   AppStrings.feedPostsList[index].likes++;
//             // }
//             // AppStrings.feedPostsList[index].isLiked =
//             //     !AppStrings.feedPostsList[index].isLiked;
//             // setState(() {});
//           },
//           child: Row(
//             children: [
//               Image.asset(
//                 AssetPaths.LIKE_ICON,
//                 scale: 3,
//               ),
//               8.horizontalSpace,
//               CustomText(
//                 text: 'Like',
//                 fontSize: 14.sp,
//                 fontColor: AppColors.BLACK_COLOR.withOpacity(0.6),
//                 fontFamily: AppFonts.MONTSERRAT_MEDIUM,
//               ),
//             ],
//           ),
//         ),
//         Container(
//           width: 1,
//           height: 20,
//           decoration: const BoxDecoration(color: AppColors.GREY_COLOR),
//         ),
//         Row(
//           children: [
//             Image.asset(
//               AssetPaths.COMMENT_ICON,
//               scale: 3,
//             ),
//             8.horizontalSpace,
//             CustomText(
//               text: 'Comments',
//               fontSize: 14.sp,
//               fontColor: AppColors.BLACK_COLOR.withOpacity(0.6),
//               fontFamily: AppFonts.MONTSERRAT_MEDIUM,
//             ),
//           ],
//         ),
//         Container(
//           width: 1,
//           height: 20,
//           decoration: const BoxDecoration(color: AppColors.GREY_COLOR),
//         ),
//         Row(
//           children: [
//             Image.asset(
//               AssetPaths.SHARE_ICON,
//               scale: 3,
//             ),
//             8.horizontalSpace,
//             CustomText(
//               text: 'Share',
//               fontSize: 14.sp,
//               fontColor: AppColors.BLACK_COLOR.withOpacity(0.6),
//               fontFamily: AppFonts.MONTSERRAT_MEDIUM,
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Row _likeAndComments(
//       // {required FeedPostModel feedPostModel}
//       ) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Image.asset(
//               AssetPaths.LIKE_FILLED_ICON,
//               scale: 3,
//               color: AppColors.BLACK_COLOR,
//             ),
//             5.horizontalSpace,
//             CustomText(
//               text: '${widget.postData?.totalLike.toString() ?? 0}',
//               fontSize: 14.sp,
//               fontColor: AppColors.BLACK_COLOR.withOpacity(0.6),
//               fontFamily: AppFonts.MONTSERRAT_MEDIUM,
//             ),
//           ],
//         ),
//         Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               CustomText(
//                 text:
//                     '${widget.postData?.totalCommentCount.toString() ?? '0'} Comments,',
//                 fontSize: 14.sp,
//                 fontColor: AppColors.BLACK_COLOR.withOpacity(0.6),
//                 fontFamily: AppFonts.MONTSERRAT_REGULAR,
//               ),
//               5.horizontalSpace,
//               CustomText(
//                 text:
//                     '${widget.postData?.totalCommentCount.toString() ?? '0'} Share',
//                 fontSize: 14.sp,
//                 fontColor: AppColors.BLACK_COLOR.withOpacity(0.6),
//                 fontFamily: AppFonts.MONTSERRAT_REGULAR,
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   void postOptions({
//     required BuildContext context,
//     // required FeedPostModel userData
//   }) {
//     // AppBottomSheet().showCustomBottomSheetWithHeight(
//     //   context: context,
//     //   bottomSheetHeight:
//     //       // userData.isMyPost
//     //       widget.postData?.userId.toString() ==
//     //               AuthController.i.userData?.user?.id.toString()
//     //           ? 130.h
//     //           : 100.h,
//     //   sheetBody: Column(children: [
//     //     // userData.isMyPost
//     //     widget.postData?.userId.toString() ==
//     //             AuthController.i.userData?.user?.id.toString()
//     //         ? Column(
//     //             children: [
//     //               SuffixTitlePreffixRow(
//     //                 image: AssetPaths.editIcon,
//     //                 title: AppStrings.EDIT_POST,
//     //                 subtitle: AppStrings.WANT_TO_EDIT_POST,
//     //                 onTapFunction: () {
//     //                   AppNavigation.navigatorPop(context);

//     //                   Get.to(() => CreateEditPostScreen(
//     //                         isFromEdit: true,
//     //                         postData: widget.postData,
//     //                         // postFeedData: userData,
//     //                       ));
//     //                 },
//     //               ),
//     //               10.ph,
//     //               SuffixTitlePreffixRow(
//     //                 image: AssetPaths.deleteIcon,
//     //                 title: AppStrings.DELETE_POST,
//     //                 subtitle: AppStrings.WANT_TO_DELETE_POST,
//     //                 onTapFunction: () {
//     //                   AppNavigation.navigatorPop(context);
//     //                   AppDialogs().showOptionsDialog(
//     //                       headertitle: AppStrings.DELETE_POST,
//     //                       title:
//     //                           '${tr(AppStrings.ARE_YOU_SURE)} ${tr(AppStrings.DELETE_THIS_POST)}',
//     //                       haveTwoButton: true,
//     //                       b1Text: AppStrings.NO_I_DoNot,
//     //                       b2Text: AppStrings.YES,
//     //                       b2onTap: () {
//     //                         DeletePostBloc().deletePostBlocMethod(
//     //                             context: context,
//     //                             setProgressBar: () {
//     //                               AppDialogs.progressLoader(context: context);
//     //                             },
//     //                             postId: widget.postData?.id.toString(),
//     //                             isComeFromPostDetails:
//     //                                 widget.isComeFromPostDetails);
//     //                         // AppNavigation.navigatorPop(context);
//     //                         // AppStrings.feedPostsList.removeWhere((element) =>
//     //                         //     element.contentData.toLowerCase() ==
//     //                         //     userData.contentData.toLowerCase());
//     //                         setState(() {});
//     //                       },
//     //                       context: context);
//     //                 },
//     //               ),
//     //             ],
//     //           )
//     //         : SuffixTitlePreffixRow(
//     //             image: AssetPaths.reportIcon,
//     //             title: AppStrings.REPORT_POST,
//     //             subtitle: AppStrings.CONCERN_ABOUT_POST,
//     //             onTapFunction: () {
//     //               // AppNavigation.navigatorPop(context);
//     //               AppDialogs()
//     //                   .showReportOptionsDialog(
//     //                       isComeFromPostDetails: widget.isComeFromPostDetails,
//     //                       postId: widget.postData?.id.toString(),
//     //                       context: context,
//     //                       headerTitle: AppStrings.REPORT_POST)
//     //                   .then((value) => AppNavigation.navigatorPop(context));
//     //             },
//     //           ),
//     //   ]),
//     // );
//   }
// }
