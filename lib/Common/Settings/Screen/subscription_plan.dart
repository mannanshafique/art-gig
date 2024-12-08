// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:giftify/Utils/app_colors.dart';
// import 'package:giftify/Utils/app_fonts.dart';
// import 'package:giftify/Utils/app_strings.dart';
// import 'package:giftify/Utils/extensions.dart';
// import 'package:giftify/Widgets/cs_appbar.dart';
// import 'package:giftify/Widgets/custom_scaffold.dart';
// import '../../../Widgets/cs_bottom_navg_button.dart';
// import '../../../Widgets/custom_text.dart';

// class SubscriptionPlansScreen extends StatelessWidget {
//   SubscriptionPlansScreen({super.key});

//   List<SubscriptionPlanData> subscriptionPlans = [
//     SubscriptionPlanData(
//       planName: "Basic Package",
//       planPrice: "\$9.99/ Weekly",
//       planDetail: [
//         "Access to basic features.",
//         "Limited cloud storage (5GB).",
//         "Email support available.",
//         "Ads supported version.",
//       ],
//     ),
//     SubscriptionPlanData(
//       planName: "Standard Package",
//       planPrice: "\$19.99/ Monthly",
//       planDetail: [
//         "Access to all essential features.",
//         "Increased cloud storage (50GB).",
//         "Priority email support.",
//         "No advertisements.",
//         "Access to exclusive content.",
//       ],
//     ),
//     SubscriptionPlanData(
//       planName: "Premium Package",
//       planPrice: "\$49.99/ Monthly",
//       planDetail: [
//         "Access to all features.",
//         "Unlimited cloud storage.",
//         "24/7 dedicated customer support.",
//         "No advertisements.",
//         "Early access to new features.",
//         "Customizable account options.",
//       ],
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//         appBar: customAppBar(
//             context: context,
//             isLeadingBack: true,
//             title: AppStrings.SUBSCRIPTION_PLAN),
//             bottomNavigationBar: CustomBottomNavigationWidget(
//         buttonTitle: AppStrings.BUY_NOW,
//         onTap: () {
         
//         },
//       ),
//         body: SizedBox(
//           height: Get.height * 0.5,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: subscriptionPlans.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) {
//               return Container(
//                 width: Get.width * 0.8,
//                 margin: const EdgeInsets.only(right: 20.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20.r),
//                   border: Border.all(color: AppColors.BLACK_COLOR),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: Get.width * 0.8,
//                       padding: const EdgeInsets.all(15.0),
//                       decoration: BoxDecoration(
//                           color: AppColors.BLACK_COLOR,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(19.r),
//                             topRight: Radius.circular(19.r),
//                           )),
//                       child: Column(
//                         children: [
//                           CustomText(
//                             text: subscriptionPlans[index].planName,
//                             fontColor: Colors.white,
//                             fontSize: 16.sp,
//                             fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
//                           ),
//                           6.ph,
//                           CustomText(
//                             text: subscriptionPlans[index].planPrice,
//                             fontColor: AppColors.WHITE_COLOR,
//                             fontSize: 20.sp,
//                             fontFamily: AppFonts.MONTSERRAT_BOLD,
//                           ),
//                         ],
//                       ),
//                     ),
//                     10.ph,
//                     for (String subscriptionDetail
//                         in subscriptionPlans[0].planDetail ?? []) ...[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Icon(Icons.check,
//                                     size: 16.sp, color: Colors.black),
//                                 SizedBox(width: 8.w),
//                                 CustomText(
//                                   text: subscriptionDetail,
//                                   fontColor: AppColors.BLACK_COLOR,
//                                   fontSize: 14.sp,
//                                 ),
//                               ],
//                             ),
//                             const Divider()
//                           ],
//                         ),
//                       ),
//                     ]
//                   ],
//                 ),
//               );
//             },
//           ),
//         )
//         // Column(
//         //   children: [
//         //     // Subscription Card
//         //     Expanded(
//         //       child: Center(
//         //         child: Container(
//         //           width: double.infinity,
//         //           padding: EdgeInsets.all(16.w),
//         //           decoration: BoxDecoration(
//         //             color: Colors.white,
//         //             borderRadius: BorderRadius.circular(16.r),
//         //             border: Border.all(color: Colors.black, width: 1),
//         //             boxShadow: [
//         //               BoxShadow(
//         //                 color: Colors.black.withOpacity(0.1),
//         //                 blurRadius: 5.r,
//         //                 offset: const Offset(0, 2),
//         //               ),
//         //             ],
//         //           ),
//         //           child: Column(
//         //             crossAxisAlignment: CrossAxisAlignment.center,
//         //             children: [
//         //               // Plan Name and Price
//         //               Container(
//         //                 width: double.infinity,
//         //                 padding: EdgeInsets.symmetric(vertical: 8.h),
//         //                 decoration: BoxDecoration(
//         //                   color: Colors.black,
//         //                   borderRadius: BorderRadius.circular(12.r),
//         //                 ),
//         //                 child: Column(
//         //                   children: [
//         //                     const CustomText(
//         //                       text: "Basic Package",
//         //                       fontColor: Colors.white,
//         //                       fontSize: 16,
//         //                       weight: FontWeight.bold,
//         //                     ),
//         //                     SizedBox(height: 4.h),
//         //                     const CustomText(
//         //                       text: "\$9.99/ Weekly",
//         //                       fontColor: Colors.white,
//         //                       fontSize: 14,
//         //                       weight: FontWeight.w500,
//         //                     ),
//         //                   ],
//         //                 ),
//         //               ),
//         //               SizedBox(height: 16.h),
//         //               // Features List
//         //               Expanded(
//         //                 child: ListView(
//         //                   children: List.generate(
//         //                     4,
//         //                     (index) => Padding(
//         //                       padding: EdgeInsets.symmetric(vertical: 8.h),
//         // child: Row(
//         //   crossAxisAlignment: CrossAxisAlignment.start,
//         //   children: [
//         //     Icon(Icons.check,
//         //         size: 16.sp, color: Colors.black),
//         //     SizedBox(width: 8.w),
//         //     Expanded(
//         //       child: CustomText(
//         //         text:
//         //             "Lorem ipsum dolor sit amet do elit consectetur Sit scelerisque.",
//         //         fontColor: Colors.black,
//         //         fontSize: 14,
//         //       ),
//         //     ),
//         //   ],
//         // ),
//         //                     ),
//         //                   ),
//         //                 ),
//         //               ),
//         //             ],
//         //           ),
//         //         ),
//         //       ),
//         //     ),
//         //   ],
//         // ),
//         );
//   }
// }

// class SubscriptionPlanData {
//   String? planName;
//   String? planPrice;
//   List<String>? planDetail;

//   SubscriptionPlanData({
//     this.planName,
//     this.planPrice,
//     this.planDetail,
//   });
// }
