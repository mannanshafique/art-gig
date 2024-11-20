// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:your_shadow/Utils/app_colors.dart';
// import 'package:your_shadow/Utils/app_fonts.dart';
// import 'package:your_shadow/Utils/asset_paths.dart';
// import 'package:your_shadow/Widgets/cs_container_border.dart';

// class CustomCalender extends StatefulWidget {
//   const CustomCalender({super.key, required this.onDaySelected});
//   final Function(DateTime) onDaySelected;
//   @override
//   State<CustomCalender> createState() => _CustomCalenderState();
// }

// class _CustomCalenderState extends State<CustomCalender> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   @override
//   Widget build(BuildContext context) {
//     return CustomContainerBorderWidget(
//       oppacityValue: 0.4,
//       child: TableCalendar(
//         rowHeight: 32.h,
//         firstDay: DateTime.now(),
//         currentDay: DateTime.now(),
//         lastDay: DateTime.utc(2030, 12, 31),
//         focusedDay: _focusedDay,
//         enabledDayPredicate: (day) {
//           final now = DateTime.now();
//           return !day.isBefore(DateTime(now.year, now.month, now.day));
//         },
//         calendarFormat: CalendarFormat.month,
//         daysOfWeekStyle: DaysOfWeekStyle(
//           weekendStyle: TextStyle(
//               color: Colors.grey.withOpacity(0.5),
//               fontSize: 14.sp,
//               fontFamily: AppFonts.AVERIA_REGULAR),
//           weekdayStyle:
//               TextStyle(fontSize: 14.sp, fontFamily: AppFonts.AVERIA_REGULAR),
//         ),
//         calendarStyle: CalendarStyle(
//             isTodayHighlighted: true,
//             selectedDecoration: const BoxDecoration(
//                 shape: BoxShape.circle, color: AppColors.GREEN_COLOR),
//             weekendTextStyle:
//                 TextStyle(fontSize: 16.sp, fontFamily: AppFonts.AVERIA_REGULAR),
//             disabledTextStyle: TextStyle(
//                 fontSize: 16.sp,
//                 color: AppColors.GREY_COLOR,
//                 fontFamily: AppFonts.AVERIA_REGULAR),
//             outsideTextStyle: TextStyle(
//                 color: Colors.grey.withOpacity(0.5),
//                 fontSize: 16.sp,
//                 fontFamily: AppFonts.AVERIA_REGULAR),
//             holidayTextStyle:
//                 TextStyle(fontSize: 16.sp, fontFamily: AppFonts.AVERIA_REGULAR),
//             defaultTextStyle: TextStyle(
//                 fontSize: 16.sp, fontFamily: AppFonts.AVERIA_REGULAR)),
//         headerStyle: HeaderStyle(
//             headerPadding: const EdgeInsets.only(bottom: 10),
//             headerMargin: EdgeInsets.zero,
//             titleCentered: true,
//             titleTextStyle:
//                 TextStyle(fontSize: 18.sp, fontFamily: AppFonts.AVERIA_REGULAR),
//             formatButtonVisible: false,
//             rightChevronIcon: Transform(
//               transform: Matrix4.identity()
//                 ..scale(-1.0, 1.0, 1.0), // Flip horizontally
//               alignment: Alignment.center,
//               child: Image.asset(
//                 AssetPaths.arrowBackIcon,
//                 height: 16.h,
//                 width: 16.h,
//               ),
//             ),
//             leftChevronIcon: Image.asset(
//               AssetPaths.arrowBackIcon,
//               height: 16.h,
//               width: 16.h,
//             )),
//         onDaySelected: (selectedDay, focusedDay) {
//           log('onDaySelected');
//           setState(() {
//             _selectedDay = selectedDay;
//             _focusedDay = focusedDay; // update `_focusedDay` here as well
//             widget.onDaySelected(selectedDay);
//           });
//         },
//         selectedDayPredicate: (day) {
//           // Use `selectedDayPredicate` to determine which day is currently selected.
//           // If this returns true, then `day` will be highlighted.
//           return isSameDay(_selectedDay, day);
//         },
//       ),
//     );
//   }
// }
