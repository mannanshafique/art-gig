import 'dart:ui';

import 'package:artgig/Utils/app_strings.dart';
import 'package:artgig/Widgets/Dialog/cs_delete_account_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Module/PaymentCard/Screen/add_new_card_screen.dart';
import '../Widgets/Dialog/cs_event_type_choose_dialog.dart';
import '../Widgets/Dialog/cs_options_dialog.dart';
import '../Widgets/Dialog/cs_report_dialog.dart';
import '../Widgets/Dialog/cs_sucessfull_dialog.dart';
import '../Widgets/Dialog/image_picker_dialog.dart';
import 'app_colors.dart';

class AppDialogs {
  static void showToast({String? message}) {
    Fluttertoast.showToast(
      msg: message ?? "",
      textColor: AppColors.WHITE_COLOR,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  // Future showCreateDialog(
  //   context,
  // ) {
  //   return showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       barrierColor: AppColors.BLACK_COLOR.withOpacity(0.7),
  //       builder: (context) {
  //         return CustomCreateDialog(
  //           headerTitle: 'Create',
  //         );
  //       });
  // }

  Future showSucessDialog(
    context,
    String title,
  ) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        barrierColor: AppColors.BLACK_COLOR.withOpacity(0.7),
        builder: (context) {
          return CustomSucessfullDialog(
            headerTitle: 'Successfully',
            title: title,
          );
        });
  }

  Future showAddNewCardDialog(context, {required Function() onTap}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: AddNewCardScreen());
        });
  }

  Future showEventTypeDialog(context, {required Function() onTap}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: CustomEventTypeDialog(
                headerTitle: 'What Type Of Event',
                onTap: onTap,
              ));
        });
  }

  Future showDeleteAccountDialog(context, {required Function() onTap}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: CustomDeleteAccountDialog(
                headerTitle: 'Delete account',
                onTapCancel: onTap,
              ));
        });
  }

  Future showOptionsDialog({
    context,
    required String title,
    required String headertitle,
    String? b1Text,
    String? b2Text,
    Function()? b1onTap,
    Function()? b2onTap,
    String? imagePath,
    required bool haveTwoButton,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: CustomOptionsAlertDialogue(
              b1Text: b1Text,
              b2Text: b2Text,
              headertitle: headertitle,
              title: title,
              b1onTap: b1onTap,
              b2onTap: b2onTap,
              imagePath: imagePath,
              haveTwoButton: haveTwoButton,
            ),
          );
        });
  }

  Future showReportOptionsDialog({
    context,
    required String headerTitle,
  }) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: CustomReportDialog(
              headerTitle: headerTitle,
            ),
          );
        });
  }

  Future showImagePickerDialog(
      {context,
      required Function(String) pickedImagePathCallback,
      required bool isMultiPicked}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return ImagePickerDialog(
            pickedImagePathCallback: pickedImagePathCallback,
            isMultiPicked: isMultiPicked,
          );
        });
  }

  static void progressAlertDialog({required BuildContext context}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: const Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.WHITE_COLOR,
                color: AppColors.YELLOW_COLOR,
              ),
            ),
          );
        });
  }
}
