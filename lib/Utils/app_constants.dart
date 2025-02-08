// ignore_for_file: unnecessary_brace_in_string_interps, constant_identifier_names

import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_maps_webservice/places.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:place_picker/place_picker.dart';

import '../Widgets/cs_timepicker_widget.dart';
import '../Widgets/custom_text.dart';
import 'app_colors.dart';
import 'app_strings.dart';

class Constants {
  static const EMAIL_MAX_LENGTH = 35;
  static const NAME_MAX_LENGHT = 30;
  static const PHONE_MAX_LENGHT = 16;
  static const BIO_MAX_LENGHT = 50;
  static const EXPERIENCE_MAX_LENGHT = 2;
  static const COST_MAX_LENGHT = 3;
  static const DESCRIPTION_MAX_LENGTH = 275;

  static const cvcLength = 3;
  static const accountNumberLenght = 16;
  static const colorPaletteMaxLength = 500;
  static const subjectMatterMaxLines = 6;
  static const int hourlyRateLimit = 6;
  static const int withDrawAmountLenght = 6;
  static int MERCHANT_VERIFYING_DURATION_IN_SECONDS = 20;

  static String? GLOBAL_ROUTE = null;

  final BS_HEIGHT_ONE = 0.265.sw;
  ////// only for string data type
  // static String convertDateFormat(String inputDate) {
  //   DateTime date = DateTime.parse(inputDate);
  //   String formattedDate = DateFormat('dd-MMM-yyyy').format(date);
  //   return formattedDate;
  // }

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static MaskTextInputFormatter MASK_TEXT_FORMATTER_CARD_NO =
      MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  //
  static MaskTextInputFormatter MASK_TEXT_FORMATTER_AMOUNT =
      MaskTextInputFormatter(
    mask: '#####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  var phoneMaskFormatter = MaskTextInputFormatter(
      mask: '(+1)###-###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  static String truncateText(String text, int maxLength) {
    if (text.length > maxLength) {
      return "${text.substring(0, maxLength)}...";
    }
    return text;
  }

  static void unFocusKeyboardMethod({required BuildContext context}) {
    FocusScope.of(context).unfocus();
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(RegExp(r'(/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  // static Future<String> getDirectoryPath() async {
  //   return (await getApplicationDocumentsDirectory()).path;
  // }

  static bool isDarkTheme({required BuildContext context}) {
    return Theme.of(context).brightness == Brightness.dark ? true : false;
  }

  static Color themeButton({required BuildContext context}) {
    return Constants.isDarkTheme(context: context)
        ? AppColors.WHITE_COLOR
        : AppColors.PINK_COLOR;
  }

  static Color primaryTitleTextThemeColor({required BuildContext context}) {
    return Theme.of(context).textTheme.bodyLarge?.color ??
        AppColors.BLACK_COLOR;
  }

  static Color primaryTextThemeColor({required BuildContext context}) {
    return Theme.of(context).textTheme.bodyMedium?.color ??
        AppColors.BLACK_COLOR;
  }

  static Color secondaryTextThemeColor({required BuildContext context}) {
    return Theme.of(context).textTheme.bodySmall?.color ?? AppColors.GREY_COLOR;
  }

  static Future<String?> writeFile(
      {required String directoryPath,
      required String fileName,
      required Uint8List fileBytes}) async {
    File file = await File('${directoryPath}/${fileName}').create();
    file.writeAsBytesSync(fileBytes);

    return file.path;
  }

  static String getApiTimesTamp() {
    return DateTime.now().microsecondsSinceEpoch.toString();
  }

//!-----Captital First Letter
  String capitalize(String input) {
    return input.isNotEmpty
        ? "${input[0].toUpperCase()}${input.substring(1)}"
        : input;
  }

//!------Location
  static const String googleApiKey = "AIzaSyBmaS0B0qwokES4a_CiFNVkVJGkimXkNsk";
  static Future<Map<String, dynamic>> findStreetAreaMethod(
      {required BuildContext context, String? prediction}) async {
    Map<String, dynamic>? addressDetail = {
      "address": null,
      "city": null,
      "state": null
    };
    try {
      List? addressInArray = prediction?.split(",");
      print("Address in array:$addressInArray");
      String address = "";
      if (addressInArray != null) {
        if (addressInArray.length == 1) {
          addressDetail["address"] = addressInArray[0];
        } else {
          for (int i = 0; i < addressInArray.length - 2; i++) {
            address = address + addressInArray[i];
          }
          print("Check the address:$addressDetail");
          addressDetail["address"] = address;
          addressDetail["state"] =
              (addressInArray[addressInArray.length - 1] ?? "");
          addressDetail["city"] =
              (addressInArray[addressInArray.length - 2] ?? "");
        }
      }
    } catch (e) {
      print("error:$e");
    }
    return addressDetail;
  }

  Future<LocationResult> showPlacePicker(context) async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PlacePicker(
              googleApiKey,
            )));
    return result;
  }

  // Future<void> findLatLongFromAddress(String address,
  //     {required Function(double?, double?) onResult}) async {
  //   try {
  //     List<Geo.Location> locations = await Geo.locationFromAddress(address);
  //     if (locations.isNotEmpty) {
  //       Geo.Location firstResult = locations.first;
  //       double latitude = firstResult.latitude;
  //       double longitude = firstResult.longitude;
  //       onResult(latitude, longitude);
  //     } else {
  //       onResult(null, null);
  //     }
  //   } catch (e) {
  //     onResult(null, null);
  //   }
  // }

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

  // static String getStatusinText(Status status) {
  //   switch (status) {
  //     case Status.PENDING:
  //       return AppStrings.PENDING;
  //     case Status.CANCELLED:
  //       return AppStrings.CANCELLED;
  //     case Status.COMPLETED:
  //       return AppStrings.COMPLETED;
  //     default:
  //       return '';
  //   }
  // }

  // static StatusTextWithColor getOrderStatusinText(String orderStatus) {
  //   switch (orderStatus) {
  //     case OrderStatus.PENDING:
  //       return StatusTextWithColor(Colors.lightBlue, AppStrings.PENDING);
  //     case OrderStatus.CANCELED:
  //       return StatusTextWithColor(Colors.red, AppStrings.CANCELLED);
  //     case OrderStatus.IN_PROGRESS:
  //       return StatusTextWithColor(Colors.orange, AppStrings.IN_PROGRESS);
  //     case OrderStatus.READY_FOR_PICK_UP:
  //       return StatusTextWithColor(Colors.yellow, AppStrings.READY_FOR_PICK_UP);
  //     case OrderStatus.ON_THE_WAY:
  //       return StatusTextWithColor(Colors.green, AppStrings.ON_THE_WAY);
  //     case OrderStatus.DELIVERED:
  //       return StatusTextWithColor(Colors.lightGreen, AppStrings.DELIVERED);
  //     default:
  //       return StatusTextWithColor(Colors.lightGreen, '');
  //   }
  // }

  final double fullScreenSize = Get.height;

  static String formatedDateFunction(
      {required String createdAt, String? format}) {
    return DateFormat(format ?? 'MMM d, yyyy    h:mm a')
        .format(DateTime.parse(createdAt));
  }

  static String localtoUtc({String? time}) {
    if (time == AppStrings.closed) {
      return AppStrings.closed;
    } else {
      DateTime localTime = DateFormat('hh:mm a').parse(time ?? "00");
      DateTime utcTime = localTime.toUtc();
      return utcTime.toString().substring(11, 16);
    }
  }

  static void hourPicker(
      {required BuildContext context,
      int? selectedHour,
      required ValueChanged<String> onChanged}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: CustomText(
              text: AppStrings.selectHour,
              fontColor: AppColors.PINK_COLOR,
              fontSize: 16.sp,
            ),
            content: CustomTimePickerWidget(
              selectedMin: selectedHour,
              onChanged: onChanged,
              list: AppStrings.hourList,
            ));
      },
    );
  }

  static void minPicker(
      {required BuildContext context,
      int? selectedMin,
      required ValueChanged<String> onChanged}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: CustomText(
              text: AppStrings.selectMin,
              fontColor: AppColors.PINK_COLOR,
              fontSize: 16.sp,
            ),
            content: CustomTimePickerWidget(
              selectedMin: selectedMin,
              onChanged: onChanged,
              list: AppStrings.minsList,
            ));
      },
    );
  }

  static String getFullName({
    required String firstName,
    required String lastName,
  }) {
    return '$firstName $lastName'.capitalizeFirst ?? '-';
  }

  Future<String> datePicker(
    BuildContext context, {
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.PINK_COLOR, // Header background color
              onPrimary: AppColors.WHITE_COLOR, // Header text color
              surface:
                  AppColors.WHITE_COLOR, // Background color of the calendar
              onSurface: AppColors.BLACK_COLOR, // Text color of the calendar
            ),
            dialogBackgroundColor:
                AppColors.WHITE_COLOR, // Background color of the dialog
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
    if (picked != null) {
      return '${picked.month}-${picked.day}-${picked.year}';
    } else {
      return '';
    }
  }

  static String formatTimeOfDay(TimeOfDay time) {
    final hour =
        time.hour > 12 ? time.hour - 12 : (time.hour == 0 ? 12 : time.hour);
    final minute = time.minute.toString().padLeft(2, '0'); // Add leading zero
    final period = time.hour >= 12 ? "PM" : "AM";

    return "$hour:$minute $period";
  }

  static Future<void> showSelectTimePicker(
      {required BuildContext context,
      final ValueChanged<TimeOfDay?>? getSelectedTime}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.PINK_COLOR, // header background color
                //onPrimary: Colors.black, // header text color
                //onSurface: Colors.green, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.BLACK_COLOR, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });
    if (pickedTime != null) {
      getSelectedTime!(pickedTime);
    }
  }

  static String utcToLocal(String utctime) {
    try {
      // Check if the time string contains AM/PM indicator
      bool hasAMPM = utctime.contains('AM') || utctime.contains('PM');

      // Define the parsing format based on whether AM/PM indicator is present
      String parsingFormat = hasAMPM ? 'hh:mm a' : 'HH:mm';

      // Parse the time string
      DateTime localTime = DateFormat(parsingFormat).parse(utctime, true);

      // Convert to local time
      DateTime dateLocal = localTime.toLocal();

      // Format the local time
      return DateFormat('hh:mm a').format(dateLocal);
    } catch (e) {
      print('Error parsing time: $e');
      return '';
    }
  }
}
