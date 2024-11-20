// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';
// import 'package:your_fastfood/Module/User/user_controller.dart';
// import 'package:your_fastfood/Utils/app_colors.dart';
// import 'package:your_fastfood/Utils/app_constants.dart';
// import 'package:your_fastfood/Utils/app_fonts.dart';
// import 'package:your_fastfood/Utils/app_navigation.dart';
// import 'package:your_fastfood/Utils/app_route_name.dart';
// import 'package:your_fastfood/Utils/app_routers.dart';
// import 'package:your_fastfood/Utils/app_strings.dart';
// import 'package:your_fastfood/Utils/asset_paths.dart';
// import 'package:your_fastfood/Utils/extensions.dart';
// import 'package:your_fastfood/Widgets/custom_button.dart';
// import 'package:your_fastfood/Widgets/custom_keyboard_action_widget.dart';
// import 'package:your_fastfood/Widgets/custom_text.dart';
// import 'package:your_fastfood/Widgets/custom_textfield.dart';

// Future<void> checkoutBottomSheet(BuildContext context,
//     {required String totalCost, required Function() onPlaceOrder}) {
//   final rowFocusNode = FocusNode();
//   final seatFocusNode = FocusNode();
//   return showModalBottomSheet<void>(
//     isScrollControlled: true,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.vertical(
//         top: Radius.circular(0.08.sw),
//       ),
//     ),
//     backgroundColor: AppColors.LIGHT_YELLOW_COLOR,
//     context: context,
//     builder: (context) => SizedBox(
//       height: Get.height * 0.6,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 10.0,
//                 width: 100,
//                 color: AppColors.YELLOW_COLOR,
//               )
//             ],
//           ),
//           30.ph,
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: CustomText(
//               text: AppStrings.CHECKOUT,
//               fontColor: AppColors.MEDIUM_BLACK_COLOR,
//               fontSize: 16.sp,
//               textAlign: TextAlign.start,
//               fontFamily: AppFonts.UNBOUNDED_REGULAR,
//             ),
//           ),
//           10.ph,
//           UserController.i.paymentCardList.isEmpty
//               ? containerData(
//                   leadingText: AppStrings.SELECT_PAYMENT_METHOD,
//                   onTap: () {
//                     AppNavigation.navigatorPop(context);
//                     AppNavigation.navigateTo(
//                         context, AppRouteName.PAYMENT_METHODS_SCREEN_ROUTE);
//                   },
//                   trailingWidget: const Icon(
//                     Icons.arrow_forward_ios_outlined,
//                     size: 20.0,
//                     color: AppColors.YELLOW_COLOR,
//                   ))
//               : containerData(
//                   leadingText: AppStrings.PAYMENT,
//                   onTap: () {
//                     AppNavigation.navigatorPop(context);
//                     UserController.i.cardSelectedValue.value = 0;
//                     AppNavigation.navigateTo(
//                         context, AppRouteName.PAYMENT_METHODS_SCREEN_ROUTE);
//                   },
//                   trailingWidget: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Image.asset(
//                           UserController.i.paymentCardList.first.brand == 'Visa'
//                               ? AssetPaths.VISACARD_ICON
//                               : AssetPaths.MASTERCARD_ICON,
//                           height:
//                               UserController.i.paymentCardList.first.brand ==
//                                       'Visa'
//                                   ? 12.5
//                                   : 24.0),
//                       5.pw,
//                       CustomText(
//                         text:
//                             '*** ${UserController.i.paymentCardList.first.last4}',
//                         fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                         fontSize: 14.sp,
//                         textAlign: TextAlign.start,
//                         fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                       ),
//                       5.pw,
//                       const Icon(
//                         Icons.arrow_forward_ios_outlined,
//                         size: 20.0,
//                         color: AppColors.YELLOW_COLOR,
//                       )
//                     ],
//                   )),
//           deliveryData(
//               rowFocusNode: rowFocusNode, seatFocusNode: seatFocusNode),
//           containerData(
//             leadingText: AppStrings.TOTAL_COST,
//             onTap: () {},
//             trailingWidget: CustomText(
//               text: '\$$totalCost',
//               fontColor: AppColors.MEDIUM_BLACK_COLOR,
//               fontSize: 12.sp,
//               textAlign: TextAlign.start,
//               fontFamily: AppFonts.UNBOUNDED_REGULAR,
//             ),
//           ),
//           const Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//             child: CustomButton(
//                 title: AppStrings.PLACE_ORDER,
//                 fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                 onTap: onPlaceOrder),
//           ),
//           20.ph
//         ],
//       ),
//     ),
//   );
// }

// Widget containerData(
//     {required String leadingText,
//     required Widget trailingWidget,
//     required Function() onTap}) {
//   return Column(
//     children: [
//       GestureDetector(
//         onTap: onTap,
//         child: Container(
//           color: AppColors.WHITE_COLOR.withOpacity(0.4),
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               CustomText(
//                 text: leadingText,
//                 fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                 fontSize: 12.sp,
//                 textAlign: TextAlign.start,
//                 fontFamily: AppFonts.UNBOUNDED_REGULAR,
//               ),
//               trailingWidget
//             ],
//           ),
//         ),
//       ),
//       Divider(
//         color: AppColors.GREY_COLOR.withOpacity(0.4),
//         height: 3,
//         thickness: 2,
//       ),
//     ],
//   );
// }

// Widget deliveryData({
//   required FocusNode rowFocusNode,
//   required FocusNode seatFocusNode,
// }) {
//   return Column(
//     children: [
//       Container(
//           color: AppColors.WHITE_COLOR.withOpacity(0.4),
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     text: AppStrings.DELIVERY_TYPE,
//                     fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                     fontSize: 12.sp,
//                     textAlign: TextAlign.start,
//                     fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                   ),
//                   CustomText(
//                     text: 'Dine In',
//                     fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                     fontSize: 12.sp,
//                     textAlign: TextAlign.start,
//                     fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                   ),
//                 ],
//               ),
//               10.ph,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     text: '${AppStrings.ROW} :',
//                     fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                     fontSize: 12.sp,
//                     textAlign: TextAlign.start,
//                     fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                   ),
//                   SizedBox(
//                     height: 40.0,
//                     width: 50.0,
//                     child: CustomKeyboardActionWidget(
//                       keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
//                       focusNode: rowFocusNode,
//                       child: CustomTextField(
//                         focusNode: rowFocusNode,
//                         controller: UserController.i.rowTextController,
//                         keyboardType: TextInputType.number,
//                         readOnly: false,
//                         borderRadius: 5.0,
//                         verticalPadding: 0.0,
//                         hint: '',
//                         fontsize: 12.0,
//                         isDense: false,
//                         textCapitalization: TextCapitalization.none,
//                         label: false,
//                         inputFormatters: [LengthLimitingTextInputFormatter(5)],
//                       ),
//                     ),
//                   ),
//                   CustomText(
//                     text: "${AppStrings.SEAT_NO} :",
//                     fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                     fontSize: 12.sp,
//                     textAlign: TextAlign.start,
//                     fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                   ),
//                   SizedBox(
//                     height: 40.0,
//                     width: 50.0,
//                     child: CustomKeyboardActionWidget(
//                       keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
//                       focusNode: seatFocusNode,
//                       child: CustomTextField(
//                         focusNode: seatFocusNode,
//                         controller: UserController.i.seatNoTextController,
//                         keyboardType: TextInputType.number,
//                         readOnly: false,
//                         borderRadius: 5.0,
//                         verticalPadding: 0.0,
//                         hint: '',
//                         fontsize: 12.0,
//                         isDense: false,
//                         textCapitalization: TextCapitalization.none,
//                         label: false,
//                         inputFormatters: [LengthLimitingTextInputFormatter(5)],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           )),
//       Divider(
//         color: AppColors.GREY_COLOR.withOpacity(0.4),
//         height: 3,
//         thickness: 2,
//       ),
//     ],
//   );
// }
