// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomYearPickerDialog extends StatefulWidget {
//   final DateTime selectedDate;
//   final Function(DateTime)? onChanged;
//   CustomYearPickerDialog({required this.selectedDate, required this.onChanged});

//   @override
//   _CustomAppExitDialogState createState() => _CustomAppExitDialogState();
// }

// class _CustomAppExitDialogState extends State<CustomYearPickerDialog> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//       elevation: 5,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             height: 10.h,
//           ),
//           CustomText(
//             text: 'Select Year',
//             fontSize: 16,
//             fontColor: AppColors.BLACK_COLOR,
//             fontFamily: AppFonts.UNBOUNDED_LIGHT,
//           ),
//           SizedBox(
//             height: 1.5.h,
//           ),
//           SizedBox(
//             height: 200.h,
//             width: 200.w,
//             child: Theme(
//               data: ThemeData(),
//               child: YearPicker(
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime(2040),
//                   initialDate: widget.selectedDate,
//                   selectedDate: widget.selectedDate,
//                   onChanged: (v) {
//                     AppNavigation.navigatorPop(context);
//                     widget.onChanged!(v);
//                   }),
//             ),
//           ),
//           SizedBox(height: 5.w),
//         ],
//       ),
//     );
//   }
// }
