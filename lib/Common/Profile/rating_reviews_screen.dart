import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_dialogs.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_rating_builder_widget.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/custom_textfield.dart';
import '../../../Widgets/user_avatar_widget.dart';
import '../../Utils/app_constants.dart';
import '../../Widgets/cs_container_border.dart';
import '../Splash/Controller/splash_controller.dart';

class RatingReviewsScreen extends StatefulWidget {
  const RatingReviewsScreen({super.key});

  @override
  State<RatingReviewsScreen> createState() => _RatingReviewsScreenState();
}

class _RatingReviewsScreenState extends State<RatingReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: customAppBar(
            context: context,
            isLeadingBack: true,
            title: AppStrings.RATING_REVIEWS),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
              text: '4.8',
              textAlign: TextAlign.start,
              fontColor: Constants.primaryTitleTextThemeColor(context: context),
              fontSize: 40.sp,
              fontFamily: AppFonts.JONES_BOLD,
            ),
            CustomRatingBarWidget(
                rating: double.parse('4.2'),
                itemSize: 14.h,
                fillIconColor: AppColors.ORANGE_COLOR,
                isIgnoreGesture: true,
                onRatingUpdate: (value) {}),
            5.ph,
            CustomText(
              text: '52 Reviews',
              textAlign: TextAlign.start,
              fontColor: Constants.primaryTextThemeColor(context: context),
              fontSize: 16.sp,
              fontFamily: AppFonts.JONES_REGULAR,
            ),
            20.ph,
            CustomContainerBorderWidget(
              padding: EdgeInsets.zero,
              bgColor: Constants.isDarkTheme(context: context)
                  ? AppColors.TRANSPARENT_COLOR
                  : AppColors.WHITE_COLOR,
              borderColor: Constants.isDarkTheme(context: context)
                  ? AppColors.WHITE_COLOR
                  : AppColors.TRANSPARENT_COLOR,
              borderRadius: 10.r,
              oppacityValue:
                  Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
              child: CustomTextField(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                borderRadius: 12,
                bgColor: AppColors.TRANSPARENT_COLOR,
                hint: AppStrings.WRITE_YOUR_REVIEW,
                labelColor: AppColors.BLACK_COLOR,
                label: false,
                textCapitalization: TextCapitalization.none,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(
                      Constants.DESCRIPTION_MAX_LENGTH)
                ],
              ),
            ),
            20.ph,
            Expanded(
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(
                  parent: ClampingScrollPhysics(),
                ),
                itemBuilder: (context, index) {
                  return _ratingListCardWidget(currentIndex: index);
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(
                      color: AppColors.GREY_COLOR,
                    ),
                  );
                },
                itemCount: 3,
                shrinkWrap: true,
              ),
            ),
          ],
        ));
  }

  Widget _ratingListCardWidget({
    required int currentIndex,
  }) {
    return Column(
      children: [
        Row(
          children: [
            CustomCicrleAvatarWidget(
              circularColor: AppColors.BLACK_COLOR,
              imgPath: AssetPaths.TEMP_EVENT_IMAGES,
              // imgPath:
              //     notificationData[index].user?.profileImage ??
              //         '',
              radius: 35.h,
              isExtendedImage: false,
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'John Smith',
                  fontColor: Constants.primaryTextThemeColor(context: context),
                  fontSize: 16.sp,
                  fontFamily: AppFonts.JONES_BOLD,
                ),
                2.ph,
                CustomRatingBarWidget(
                    rating: double.parse('4.2'),
                    itemSize: 14.h,
                    fillIconColor: AppColors.ORANGE_COLOR,
                    isIgnoreGesture: true,
                    onRatingUpdate: (value) {}),
              ],
            ),
            // const Spacer(),
            // currentIndex == 0
            //     ? GestureDetector(
            //         onTap: () {
            //           showModalBottomSheetForEditAndDelete();
            //         },
            //         child: const Icon(Icons.more_vert),
            //       )
            //     : const SizedBox.shrink()
          ],
        ),
        6.verticalSpace,
        Row(
          children: [
            Expanded(
              child: CustomText(
                text: AppStrings.loremIpsum,
                fontColor: Constants.primaryTextThemeColor(context: context),
                fontSize: 14.sp,
                maxLines: 2,
                lineSpacing: 1.2,
                fontFamily: AppFonts.JONES_REGULAR,
              ),
            )
          ],
        )
      ],
    );
  }

  showModalBottomSheetForEditAndDelete() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (_) {
        return Container(
          decoration: const BoxDecoration(
              // color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10))),
          child: SafeArea(
            child: Wrap(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Center(
                    child: Container(
                      width: 120, // Adjust width here
                      height: 6, // Adjust height here
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                //Edit Review
                GestureDetector(
                  onTap: () {
                    AppNavigation.navigateCloseDialog(context);
                    // showModalBottomSheetForAddReview();
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.edit,
                          color: AppColors.GREEN_COLOR,
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        CustomText(
                          text: 'Edit Review',
                          fontColor: AppColors.BLACK_COLOR,
                          fontSize: 16.sp,
                          fontFamily: AppFonts.JONES_MEDIUM,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: AppColors.GREEN_COLOR,
                    height: 1,
                  ),
                ),
                //Delete Review
                GestureDetector(
                  onTap: () {
                    AppNavigation.navigateCloseDialog(context);

                    AppDialogs().showOptionsDialog(
                        headertitle: AppStrings.DELETE_REVIEW,
                        title:
                            '${AppStrings.ARE_YOU_SURE} \n delete your review ?',
                        haveTwoButton: true,
                        b1Text: AppStrings.CANCEL,
                        b2Text: AppStrings.DELETE,
                        // imagePath: AssetPaths.logout,
                        b1onTap: () {
                          AppNavigation.navigatorPop(context);
                        },
                        b2onTap: () {
                          AppDialogs.showToast(
                            message:
                                "Your review has been deleted, Successfully",
                          );
                          AppNavigation.navigateCloseDialog(context);
                        },
                        context: context);
                  },
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15.0,
                        ),
                        const Icon(
                          Icons.delete,
                          color: AppColors.GREEN_COLOR,
                        ),
                        const SizedBox(width: 15.0),
                        CustomText(
                          text: 'Delete Review',
                          fontColor: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: AppFonts.JONES_MEDIUM,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class RatingAndReviewScreen extends StatefulWidget {
//   const RatingAndReviewScreen({super.key});

//   @override
//   State<RatingAndReviewScreen> createState() => _RatingAndReviewScreenState();
// }

// class _RatingAndReviewScreenState extends State<RatingAndReviewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CommonScaffold(
//       title: "Rating & Reviews",
//       titleColor: AppColors.kPrimaryColor,
//       leading: AssetPaths.BACK_ARROW_ICON,
//       onclickLead: () {
//         AppNavigation.navigatorPop(context);
//       },
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CustomText(
//                   text: "4.8",
//                   fontsize: 36,
//                   fontWeight: FontWeight.w400,
//                   isLeftAlign: false,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CustomRatingWidget(
//                       initialRating: 4.8,
//                       size: 20,
//                       viewOnly: true,
//                     ),
//                   ],
//                 ),
//                 5.verticalSpace,
//                 CustomText(
//                   text: "52 Reviews",
//                   fontsize: 18,
//                   fontWeight: FontWeight.w100,
//                   isLeftAlign: false,
//                 ),
//                 Divider(
//                   color: AppColors.kPrimaryColor,
//                   indent: 80,
//                   endIndent: 80,
//                 ),
//                 10.verticalSpace,
//                 TextFormField(
//                   cursorColor: AppColors.kPrimaryColor,
//                   onTap: () {
//                     showModalBottomSheetForAddReview();
//                   },
//                   readOnly: true,
//                   keyboardType: TextInputType.text,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w200,
//                   ),
//                   maxLines: 1,
//                   controller: TextEditingController(),
//                   decoration: InputDecoration(
//                     errorStyle: const TextStyle(
//                       color: AppColors.redColor,
//                       height: 1,
//                       fontSize: 14,
//                       fontFamily: AppFonts.fontFamily,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     contentPadding: EdgeInsets.all(16.r),
//                     filled: true,
//                     fillColor: AppColors.LIGHT_GREY_COLOR,
//                     prefixIconConstraints: const BoxConstraints(
//                       minWidth: 10,
//                       minHeight: 10,
//                     ),
//                     suffixIconConstraints: const BoxConstraints(
//                       minWidth: 10,
//                       minHeight: 10,
//                     ),
//                     hintText: "Write your review...",
//                     hintStyle: TextStyle(
//                       fontFamily: AppFonts.fontFamily,
//                       color: AppColors.kPrimaryColor,
//                       fontSize: 14.sp,
//                     ),
//                     prefixIcon: Padding(
//                       padding: const EdgeInsets.only(
//                           left: 12, right: 12, top: 10, bottom: 12),
//                       child: CircleAvatar(
//                         radius: 20,
//                         child: Image.asset(
//                           AssetPaths.USER_ICON_1,
//                         ),
//                       ),
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: AppColors.whiteColor,
//                         width: 1.0,
//                         style: BorderStyle.solid,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: AppColors.whiteColor,
//                         width: 1.0,
//                         style: BorderStyle.solid,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: AppColors.whiteColor,
//                         width: 1.0,
//                         style: BorderStyle.solid,
//                       ),
//                     ),
//                   ),
//                 ),
//                 20.verticalSpace,
//                 Expanded(
//                   child: ListView.separated(
//                     physics: const AlwaysScrollableScrollPhysics(
//                       parent: ClampingScrollPhysics(),
//                     ),
//                     itemBuilder: (context, index) {
//                       return _ratingListCardWidget(currentIndex: index);
//                     },
//                     separatorBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10.0),
//                         child: Divider(
//                           color: AppColors.kPrimaryColor,
//                         ),
//                       );
//                     },
//                     itemCount: 10,
//                     shrinkWrap: true,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   showModalBottomSheetForAddReview() {
//     return showModalBottomSheet(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(10),
//         ),
//       ),
//       isScrollControlled: true,
//       context: context,
//       builder: (_) {
//         return GestureDetector(
//           onTap: () {
//             // Constants.unFocusKeyboardMethod(context: context);
//             Constants.unFocusKeyboardMethod(context: _);
//           },
//           child: Padding(
//             padding: EdgeInsets.only(
//                 bottom: MediaQuery.of(context).viewInsets.bottom),
//             child: Container(
//               decoration: const BoxDecoration(
//                   // color: AppColors.whiteColor,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(10),
//                       topLeft: Radius.circular(10))),
//               child: SafeArea(
//                 child: Wrap(
//                   children: <Widget>[
//                     GiveFeedbackScreen(
//                       onPressed: (rating, review) {
//                         Constants.unFocusKeyboardMethod(context: context);
//                         AppDialogs.showToast(
//                             message: "Review Submitted, Successfully!");
//                         AppNavigation.navigateCloseDialog(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

// }
