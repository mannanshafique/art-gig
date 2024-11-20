// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:your_fastfood/Utils/app_fonts.dart';
// import 'package:your_fastfood/Utils/app_strings.dart';
// import 'package:your_fastfood/Widgets/custom_text.dart';

// import '../Utils/app_colors.dart';

// class CustomDropdown<T> extends StatefulWidget {
//   final List<T> options;
//   final String Function(T) displayText;
//   final void Function(T?) onChanged;
//   final T? value;
//   final String? hintText;
//   final double? borderRadius;
//   final Color? borderColor;

//   CustomDropdown({
//     required this.options,
//     required this.displayText,
//     required this.onChanged,
//     required this.value,
//     this.borderRadius,
//     this.borderColor,
//     this.hintText,
//   });

//   @override
//   _CustomDropdownState<T> createState() => _CustomDropdownState<T>();
// }

// class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
//   late T? _selectedValue;

//   @override
//   void initState() {
//     super.initState();
//     _selectedValue = widget.value;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 1.sw,
//       height: 0.07.sh,
//       decoration: BoxDecoration(
//         color: AppColors.WHITE_COLOR,
//         border: Border.all(color: widget.borderColor ?? AppColors.GREY_COLOR),
//         borderRadius: BorderRadius.circular(widget.borderRadius ?? 70.0),
//       ),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.02.sw),
//         child: DropdownButton<T>(
//           value: _selectedValue,
//           isExpanded: true,
//           underline: const SizedBox(),
//           icon: const Icon(
//             Icons.keyboard_arrow_down_outlined,
//             color: AppColors.YELLOW_COLOR,
//           ),
//           hint: CustomText(
//             text: widget.hintText,
//             fontColor: AppColors.GREY_COLOR.withOpacity(0.8),
//             fontSize: 14.sp,
//             fontFamily: AppFonts.UNBOUNDED_REGULAR,
//             textAlign: TextAlign.center,
//           ),
//           items: widget.options.map((option) {
//             return DropdownMenuItem<T>(
//               value: option,
//               child: CustomText(
//                 text: widget.displayText(option),
//                 fontColor: AppColors.MEDIUM_BLACK_COLOR,
//                 fontSize: 14.sp,
//                 fontFamily: AppFonts.UNBOUNDED_REGULAR,
//               ),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             setState(() {
//               _selectedValue = newValue;
//             });
//             widget.onChanged(newValue);
//           },
//         ),
//       ),
//     );
//   }
// }




// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// // import 'package:your_fastfood/Utils/app_fonts.dart';
// // import 'package:your_fastfood/Utils/app_strings.dart';
// // import 'package:your_fastfood/Widgets/custom_text.dart';

// // import '../Utils/app_colors.dart';

// // class CustomDropdown<T> extends StatelessWidget {
// //   final List<T> options;
// //   final String Function(T) displayText;
// //   final void Function(T?) onChanged;
// //   final Rx<T?> value;

// //   CustomDropdown({
// //     required this.options,
// //     required this.displayText,
// //     required this.onChanged,
// //     required this.value,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 1.sw,
// //       height: 0.07.sh,
// //       decoration: BoxDecoration(
// //         color: AppColors.WHITE_COLOR,
// //         border: Border.all(),
// //         borderRadius: BorderRadius.circular(10.sp),
// //       ),
// //       child: Padding(
// //           padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.02.sw),
// //           child: Obx(() => DropdownButton<T>(
// //                 value: value?.value,
// //                 isExpanded: true,
// //                 underline: SizedBox(),
// //                 hint: CustomText(
// //                   text: AppStrings.CATEGORIES,
// //                   fontColor: AppColors.MEDIUM_BLACK_COLOR,
// //                   fontSize: 16.sp,
// //                   weight: AppFonts.UNBOUNDED_REGULAR,
// //                   lineSpacing: 1.2,
// //                   textAlign: TextAlign.center,
// //                 ),
// //                 items: options.map((option) {
// //                   return DropdownMenuItem<T>(
// //                     value: option,
// //                     child: Text(displayText(option)),
// //                   );
// //                 }).toList(),
// //                 onChanged: onChanged,
// //               ))),
// //     );
// //   }
// // }
