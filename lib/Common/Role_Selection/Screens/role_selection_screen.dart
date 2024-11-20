// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:mecca/Common/Auth/Screens/Setup_Profile/schedule_screen.dart';
// import 'package:mecca/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:mecca/Module/MainMenu/main_menu_screen.dart';
// import 'package:mecca/Module/Parent/Home/Screen/parent_home.dart';
// import 'package:mecca/Module/Student/Store/Screen/store_screen.dart';
// import 'package:mecca/Utils/app_colors.dart';
// import 'package:mecca/Utils/app_fonts.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_route_name.dart';
// import 'package:mecca/Utils/app_strings.dart';
// import 'package:mecca/Utils/asset_paths.dart';
// import 'package:mecca/Utils/extensions.dart';
// import 'package:mecca/Widgets/custom_auth_scaffold.dart';
// import 'package:mecca/Widgets/custom_bottom_height_space.dart';
// import 'package:mecca/Widgets/custom_button.dart';
// import 'package:mecca/Widgets/custom_padding.dart';

// class RoleSelectionScreen extends StatelessWidget {
//   RoleSelectionScreen({Key? key}) : super(key: key);

//   final RoleController roleController = Get.find<RoleController>();

//   @override
//   Widget build(BuildContext context) {
//     return CustomAuthScaffold(
//         appBarTitle: AppStrings.ROLE_SELECTION,
//         child: CustomPadding(
//           child: Column(children: [
//             _roleSelectionCustomButton(context,
//                 title: AppStrings.LOGIN_AS_STUDENT,
//                 iconPath: AssetPaths.STUDENT_ICON, onTap: () {
//               roleController.setRole(comingRole: AppStrings.STUDENT);
//               AppNavigation.navigateTo(
//                   context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
//               // Get.to(() => StoreScreen());
//             }),
//             10.ph,
//             _roleSelectionCustomButton(context,
//                 title: AppStrings.LOGIN_AS_PARENTS,
//                 iconPath: AssetPaths.PARENT_ICON, onTap: () {
//               roleController.setRole(comingRole: AppStrings.PARENT);
//               AppNavigation.navigateTo(
//                   context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
//             }),
//             10.ph,
//             _roleSelectionCustomButton(context,
//                 title: AppStrings.LOGIN_AS_COUNSELOR,
//                 iconPath: AssetPaths.CONSULTANT_ICON, onTap: () {
//               roleController.setRole(comingRole: AppStrings.CONSELOR);
//               AppNavigation.navigateTo(
//                   context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
//             }),
//             const BottomHeightSpace()
//           ]),
//         ));
//   }

//   Widget _roleSelectionCustomButton(
//     BuildContext context, {
//     required String title,
//     required String iconPath,
//     required Function() onTap,
//   }) {
//     return CustomButton(
//         borderRadius: 12.0,
//         title: title,
//         fontFamily: AppFonts.KOROLEV_MEDIUM,
//         fontSize: 16.sp,
//         haveIconOnLeft: true,
//         iconPath: iconPath,
//         containerColor: AppColors.PURPLE_COLOR,
//         fontColor: AppColors.AMBER_COLOR,
//         haveIcon: true,
//         onTap: onTap);
//   }
// }
