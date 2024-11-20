// import 'dart:developer';

// import 'package:extended_image/extended_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:your_fastfood/Common/Auth/Model/user_model.dart';
// import 'package:your_fastfood/Module/Resturant/Home/Model/res_menu_model.dart';
// import 'package:your_fastfood/Module/Resturant/Resturant_Menu/Bloc/get_categories_bloc.dart';
// import 'package:your_fastfood/Module/Resturant/Resturant_Menu/Model/categories_model.dart';
// import 'package:your_fastfood/Module/Resturant/Resturant_Menu/Model/menu_model.dart';
// import 'package:your_fastfood/Module/Resturant/resturant_controller.dart';
// import 'package:your_fastfood/Module/User/user_controller.dart';
// import 'package:your_fastfood/Utils/app_colors.dart';
// import 'package:your_fastfood/Utils/app_dialogs.dart';
// import 'package:your_fastfood/Utils/app_fonts.dart';
// import 'package:your_fastfood/Utils/app_navigation.dart';
// import 'package:your_fastfood/Utils/app_route_name.dart';
// import 'package:your_fastfood/Utils/app_strings.dart';
// import 'package:your_fastfood/Utils/asset_paths.dart';
// import 'package:your_fastfood/Utils/extensions.dart';
// import 'package:your_fastfood/Widgets/cs_drop_down_widget.dart';
// import 'package:your_fastfood/Widgets/custom_button.dart';
// import 'package:your_fastfood/Widgets/custom_text.dart';

// Future<void> filterBottomSheet(
//     BuildContext context,
//     final Function(List<MenuData>) menuDataCallback,
//     final Function(List<UserData>) resturantDataCallback) {
//   double _sliderValue = 10;
//   String? categoriesName;

//   return showModalBottomSheet<void>(
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(0.08.sw),
//         ),
//       ),
//       backgroundColor: AppColors.LIGHT_YELLOW_COLOR,
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (BuildContext context,
//             StateSetter setState /*You can rename this!*/) {
//           return SizedBox(
//             height: Get.height * 0.6,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 10.0,
//                       width: 100,
//                       color: AppColors.YELLOW_COLOR,
//                     )
//                   ],
//                 ),
//                 30.ph,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomText(
//                         text: AppStrings.FILTER,
//                         fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                         fontSize: 16.sp,
//                         textAlign: TextAlign.start,
//                         fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                       ),
//                       10.ph,
//                       CustomText(
//                         text: AppStrings.PRICE,
//                         fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                         fontSize: 16.sp,
//                         textAlign: TextAlign.start,
//                         fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                       ),
//                       10.ph,
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Column(
//                     children: [
//                       SliderTheme(
//                         data: SliderThemeData(
//                             overlayShape: SliderComponentShape.noOverlay),
//                         child: Slider(
//                           value: _sliderValue,
//                           min: 2,
//                           max: 550,
//                           divisions: 100,
//                           label: _sliderValue.round().toString(),
//                           activeColor: AppColors.YELLOW_COLOR,
//                           onChanged: (value) {
//                             _sliderValue = value;
//                             setState(() {});
//                           },
//                         ),
//                       ),
//                       5.ph,
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 11.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CustomText(
//                               text: '${AppStrings.LOW_PRICE} - \$2',
//                               fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                               fontSize: 14.sp,
//                               textAlign: TextAlign.start,
//                               fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                             ),
//                             CustomText(
//                               text: '${AppStrings.HIGH_PRICE} - \$550',
//                               fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                               fontSize: 14.sp,
//                               textAlign: TextAlign.start,
//                               fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                             ),
//                           ],
//                         ),
//                       ),
//                       20.ph,
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                         child: GetBuilder<ResturantController>(
//                             builder: (resturantBuilderController) {
//                           return CustomDropdown<CategoriesData>(
//                             options: resturantBuilderController
//                                 .categoriesDataList.value,
//                             displayText: (option) => option.title ?? '',
//                             hintText: AppStrings.CATEGORIES,
//                             onChanged: (newValue) {
//                               categoriesName = newValue?.title ?? '';
//                             },
//                             value: null, // Set the initial value here
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                 ),
//                 10.ph,
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//                   child: CustomButton(
//                     title: AppStrings.SEARCH,
//                     fontFamily: AppFonts.UNBOUNDED_REGULAR,
//                     onTap: () {
//                       List<MenuData> menuData = [];
//                       // List<UserData> resturantData = [];
//                       for (MenuData v
//                           in UserController.i.popularItemsList.value) {
//                         log('message');
//                         String price = v.cost ?? '';
//                         String categ = v.category?.title ?? '';
//                         if (double.parse(price).lessThan(_sliderValue) &&
//                             categ.toLowerCase().contains(
//                                 (categoriesName ?? '').toLowerCase())) {
//                           log('Menu $price');
//                           menuData.add(v);
//                         }
//                       }
//                       menuDataCallback.call(menuData);
//                       AppNavigation.navigatorPop(context);
//                     },
//                   ),
//                 ),
//                 20.ph
//               ],
//             ),
//           );
//         });
//       });
// }
