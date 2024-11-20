// import 'package:cosmetologist/services/timezone_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeAgo;

import 'app_dialogs.dart';
import 'app_strings.dart';

class DateTimeManager {
  static const String _dateTimeFormat = "yyyy-MM-dd hh:mm aa";
  static const String _dateTimeFormat2 = "MMMM dd | hh:mm aa";

  static const String _dateTimeFormat24 = "yyyy-MM-dd HH:mm:ss";
  static const String _dateTimeFormat24_2 = "yyyy-MM-ddTHH:mm:ssZ";

  //static const String _dateFormat="yyyy-MM-dd";
  static const String _dateFormat = "dd-MM-yyyy";
  static const String _timeFormat = "hh:mm aa";

  static DateTime _parseDateTime24(String date, {bool isutc = false}) {
    DateTime dateTime = DateFormat(_dateTimeFormat24).parse(
      date,
      isutc,
    );
    return isutc ? dateTime.toLocal() : dateTime;
  }

  static String getFormattedDateTime(String date) {
    return DateFormat(_dateTimeFormat).format(_parseDateTime24(date));
  }

  static String getFormattedDateTime2(String date) {
    return DateFormat(_dateTimeFormat2).format(_parseDateTime24(date));
  }

  static String getFormattedDate(String date, {bool isutc = false}) {
    return DateFormat(_dateFormat).format(_parseDateTime24(date, isutc: isutc));
  }

  static String getFormattedTime(String? date, {bool isutc = false}) {
    return DateFormat(_timeFormat).format(
        _parseDateTime24(date ?? DateTime.now().toString(), isutc: isutc));
  }

  //!------New Foe EST

  static DateTime parseDateTime(
      {required String parseFormat,
      required String inputDateTime,
      bool utc = false}) {
    return DateFormat(parseFormat).parse(inputDateTime, utc);
  }

  static String formatDateTime(
      {required String parseFormat, required DateTime inputDateTime}) {
    return DateFormat(parseFormat).format(inputDateTime);
  }

  static DateTime? convert12To24HourFormatMethod({String? createdDate}) {
    if (createdDate != null && createdDate.isNotEmpty) {
      return parseDateTime(
          parseFormat: "yyyy-MM-dd HH:mm:ss",
          inputDateTime: formatDateTime(
              parseFormat: "yyyy-MM-dd HH:mm:ss",
              inputDateTime: parseDateTime(
                  parseFormat: "yyyy-MM-dd hh:mm a",
                  inputDateTime: createdDate)));
    }
    return null;
  }

  static DateTime? convertChatHourFormatMethod({String? createdDate}) {
    if (createdDate != null && createdDate.isNotEmpty) {
      return parseDateTime(
          parseFormat: "yyyy-MM-dd HH:mm:ss",
          inputDateTime: formatDateTime(
              parseFormat: "yyyy-MM-dd HH:mm:ss",
              inputDateTime: parseDateTime(
                  parseFormat: "yyyy-MM-dd HH:mm:ss",
                  inputDateTime: createdDate)));
    }
    return null;
  }

  // static String? getLocal12HourTimezoneData({String? dateTime, required String parseFormate,bool? isChat}) {
  //   //print(Constants.convert12To24HourFormatMethod(createdDate: dateTime));
  //   DateTime? _localDateTime = TimeZoneService().convertDateToLocalTimezone(
  //       serverInputDateTime: isChat != null  ?  convertChatHourFormatMethod(createdDate: dateTime) :
  //           convert12To24HourFormatMethod(createdDate: dateTime));

  //   if (_localDateTime != null) {
  //     print("Local Date Time:${_localDateTime}");
  //     String? convert12HourDateTime = formatDateTime(
  //         parseFormat: parseFormate, inputDateTime: _localDateTime);

  //     return convert12HourDateTime;
  //   }

  //   return null;
  // }

  static String? timeAgoMethod(
      {required String createdDate, bool? isUtc = false}) {
    DateTime createdDateTime = parseDateTime(
            parseFormat: createdDate.contains("T")
                ? _dateTimeFormat24_2
                : _dateTimeFormat24,
            inputDateTime: createdDate,
            utc: isUtc!)
        .toLocal();
    String timeAgoTime = timeAgo.format(
      createdDateTime,
      // locale: "en_short" Shows In 3d/2d
    );

    if (timeAgoTime.contains("~")) {
      timeAgoTime = timeAgoTime.toString().split("~")[1];
    } else {
      timeAgoTime = timeAgoTime;
    }
    return timeAgoTime;
  }

  static String formatDateInTodayYesterday(
    DateTime date,
  ) {
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(Duration(days: 1));
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}/${date.year}';
      // You can customize the date format as needed
    }
  }

  static String formatTimeOfDayTo12Hour(TimeOfDay time) {
    final hour = time.hour;
    final minute = time.minute;

    final period = hour >= 12 ? 'PM' : 'AM';
    final formattedHour = hour == 0
        ? 12
        : hour > 12
            ? hour - 12
            : hour;
    final formattedMinute = minute.toString().padLeft(2, '0');

    return '$formattedHour:$formattedMinute $period';
  }

  static bool checkStartEndTime({
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  }) {
    final now = DateTime.now();

    // Convert TimeOfDay to DateTime (using the current date)
    DateTime startDateTime = DateTime(now.year, now.month, now.day,
        startTime?.hour ?? 0, startTime?.minute ?? 0);
    DateTime endDateTime = DateTime(
        now.year, now.month, now.day, endTime?.hour ?? 0, endTime?.minute ?? 0);

    // Check if start time is equal to end time
    if (startDateTime == endDateTime) {
      AppDialogs.showToast(message: AppStrings.StartEndTimeSame);
      return false;
    }
    // Check if start time is after end time
    else if (startDateTime.isAfter(endDateTime)) {
      AppDialogs.showToast(message: AppStrings.StartGreaterEndTime);
      return false;
    } else {
      return true;
    }
  }
}
