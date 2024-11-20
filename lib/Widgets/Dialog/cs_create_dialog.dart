// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../Utils/app_navigation.dart';
// import '../../Utils/app_strings.dart';

// class CustomCreateDialog extends StatefulWidget {
//   CustomCreateDialog({Key? key, required this.headerTitle}) : super(key: key);

//   final String headerTitle;

//   @override
//   State<CustomCreateDialog> createState() => _CustomCreateDialogState();
// }

// class _CustomCreateDialogState extends State<CustomCreateDialog> {
//   List<CreateModel> createDataList = [
//     CreateModel(
//         title: AppStrings.POST,
//         onTap: () {
//           AppNavigation.navigateReplacement(
//               Constants.navigatorKey.currentContext!,
//               AppRouteName.CREATE_EDIT_POST_SCREEN_ROUTE);
//         }),
//     CreateModel(
//         title: AppStrings.ASSIGNMENT,
//         onTap: () {
//           AppNavigation.navigateReplacement(
//               Constants.navigatorKey.currentContext!,
//               AppRouteName.CREATE_EDIT_ASSIGNMENT_SCREEN_ROUTE);
//         }),
//     CreateModel(
//         title: AppStrings.QUIZ,
//         onTap: () {
//           AppNavigation.navigateReplacement(
//               Constants.navigatorKey.currentContext!,
//               AppRouteName.CREATE_EDIT_QUIZ_SCREEN_ROUTE);
//         }),
//     CreateModel(
//         title: AppStrings.BLOG,
//         onTap: () {
//           AppNavigation.navigateReplacement(
//               Constants.navigatorKey.currentContext!,
//               AppRouteName.CREATE_EDIT_BLOG_SCREEN_ROUTE);
//         }),
//     CreateModel(
//         title: AppStrings.WEBINAR,
//         onTap: () {
//           AppNavigation.navigateReplacement(
//               Constants.navigatorKey.currentContext!,
//               AppRouteName.CREATE_EDIT_WEBINAR_SCREEN_ROUTE);
//         }),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return CustomAlertDialog(
//       headerText: widget.headerTitle,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               8.ph,
//               for (var createData in createDataList) ...[
//                 _customButton(context,
//                     title: createData.title, ontap: createData.onTap)
//               ],
//               10.ph,
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _customButton(BuildContext context,
//       {required String title, required Function() ontap}) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: CustomButton(
//           fontSize: 14.sp,
//           containerColor: AppColors.PURPLE_COLOR,
//           fontColor: AppColors.AMBER_COLOR,
//           title: title,
//           onTap: ontap),
//     );
//   }
// }

// class CreateModel {
//   String title;
//   Function() onTap;

//   CreateModel({
//     required this.title,
//     required this.onTap,
//   });
// }
