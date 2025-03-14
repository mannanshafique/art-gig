import 'dart:developer';

import 'package:artgig/Common/Role_Selection/Controller/role_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/utils.dart';

import '../Widgets/custom_flash_toast_widget.dart';
import '../Widgets/custom_image_preview.dart';
import 'app_strings.dart';

class FieldValidator {
  static Pattern EmailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static RegExp regExp = RegExp(EmailPattern.toString());
  static RegExp PASSWORD_VALIDATION_REGEX = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@}#\]{$&:)[*~^_,(+-.<%;/>]).{8,}$'); //~ ` ! @ % $ < > ( ) ? / \ [ ] { } : ; ' " = + - _ * ^ , .

//------------------ PHONE NUMBER SCREEN VALIDATION ---------------//
  bool validatePhone(String number, context) {
    if (number.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyPhoneNumber);
      return false;
    } else if ((number
                .replaceAll('(', '')
                .replaceAll(')', '')
                .replaceAll('-', ''))
            .length <
        9) {
      FlushBar().showFlushBar(context, AppStrings.invalidPhoneNumber);
      return false;
    } else {
      return true;
    }
  }

//------------------ LOGIN SCREEN VALIDATION ---------------//
  bool validateEmail(String email, context) {
    if (email.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyEmailAddress);
      return false;
    } else if (!regExp.hasMatch(email.trim())) {
      FlushBar().showFlushBar(context, AppStrings.invalidEmailAddress);
      return false;
    } else {
      return true;
    }
  }

  //---------------- CREATE PROFILE SCREEN VALIDATION -----------------//
  bool validateCreateProfile(
      String fullName,
      String emailAddress,
      String location,
      String phoneNumber,
      String dateOfBirth,
      String gender,
      String bio,
      context) {
    if (fullName.isEmpty) {
      FlushBar().showFlushBar(context, "Full name field can't be empty.");
      return false;
    } else if (validateEmail(emailAddress, context) == false) {
      return false;
    } else if (validatePhone(phoneNumber, context) == false) {
      return false;
    } else if (location.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyLocation);
      return false;
    } else if (dateOfBirth.isEmpty) {
      FlushBar().showFlushBar(context, "Date of birth field can't be empty.");
      return false;
    } else if (gender.isEmpty) {
      FlushBar().showFlushBar(context, "Gender field can't be empty.");
      return false;
    } else if (RoleController.i.selectedRole.value == AppStrings.ARTIST &&
        bio.isEmpty) {
      FlushBar().showFlushBar(context, "Gender field can't be empty.");
      return false;
    } else {
      return true;
    }
  }

//------------------ REPORT SCREEN VALIDATION ---------------//
  bool validateReport(String reason, context) {
    if (reason.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyReason);
      return false;
    } else {
      return true;
    }
  }

  bool creditCardValidate(
      {required String cardNumber,
      // required String expMonth,
      required String expYear,
      required String cvv,
      required BuildContext context}) {
    if (cardNumber.isEmpty) {
      FlushBar().showFlushBar(context, "Card number field can't be empty.");
      return false;
    } else if (cardNumber.length.isLowerThan(16)) {
      FlushBar().showFlushBar(context, "Card number must be 16 digits.");
      return false;
    }
    //  else if (expMonth.isEmpty) {
    //   FlushBar().showFlushBar(context, "Expiry month field can't be empty.");
    //   return false;
    // }
    else if (expYear.isEmpty) {
      FlushBar().showFlushBar(context, "Expiry year field can't be empty.");
      return false;
    } else if (cvv.isEmpty) {
      FlushBar().showFlushBar(context, "Cvv field can't be empty.");
      return false;
    } else if (cvv.length.isLowerThan(3)) {
      FlushBar().showFlushBar(context, "CVV must be 3 digits.");
      return false;
    } else {
      return true;
    }
  }

  bool validatePortfolio(
      String portfolioTitle, String perHour, String howLong, context) {
    if (portfolioTitle.isEmpty) {
      FlushBar().showFlushBar(context, "${AppStrings.PORTFOLIO_TITLE} field can't be empty.");
      return false;
    } else if (perHour.isEmpty) {
      FlushBar()
          .showFlushBar(context, "${AppStrings.PER_HOUR} field can't be empty.");
      return false;
    } else if (howLong.isEmpty) {
      FlushBar().showFlushBar(context, "${AppStrings.HOW_LONG} field can't be empty.");
      return false;
    } else {
      return true;
    }
  }

  bool validateAssignment(String title, String desp, List<ImageModel> imagePath,
      String date, int startTime, int endTime, context) {
    if (title.isEmpty) {
      FlushBar().showFlushBar(context, "Title can't be empty.");
      return false;
    } else if (desp.isEmpty) {
      FlushBar().showFlushBar(context, "Description can't be empty.");
      return false;
    } else if (imagePath.isEmpty) {
      FlushBar().showFlushBar(context, "Document can't be empty.");
      return false;
    } else if (date.isEmpty) {
      FlushBar().showFlushBar(context, "Date can't be empty.");
      return false;
    } else if (startTime == 0) {
      FlushBar().showFlushBar(context, "Start Time can't be empty.");
      return false;
    } else if (endTime == 0) {
      FlushBar().showFlushBar(context, "End Time can't be empty.");
      return false;
    } else {
      return true;
    }
  }

  bool validateQuiz(String question, String option1, String option2,
      String option3, context) {
    if (question.isEmpty) {
      FlushBar().showFlushBar(context, "Question can't be empty.");
      return false;
    } else if (option1.isEmpty) {
      FlushBar().showFlushBar(context, "Option 1 can't be empty.");
      return false;
    } else if (option2.isEmpty) {
      FlushBar().showFlushBar(context, "Option 2 can't be empty.");
      return false;
    } else if (option3.isEmpty) {
      FlushBar().showFlushBar(context, "Option 3 can't be empty.");
      return false;
    } else {
      return true;
    }
  }

  //------------------ Create/Edit Post SCREEN VALIDATION ---------------//
  bool validateCreateEditPost(String title, String description, context) {
    if (title.isEmpty) {
      FlushBar().showFlushBar(context, 'Title is Required');
      return false;
    } else if (description.isEmpty) {
      FlushBar().showFlushBar(context, 'Description is Required');
      return false;
    } else {
      return true;
    }
  }

  //------------------ Account Validation SCREEN VALIDATION ---------------//
  bool validateAccountDetail(
      {required String accountHolderName,
      required String accountType,
      required String accountNumber,
      required String routingNumber,
      required String bankName,
      required BuildContext context}) {
    if (accountHolderName.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyAccountHolderName);
      return false;
    } else if (accountType.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyAccountType);
      return false;
    } else if (accountNumber.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyAccountNumber);
      return false;
    } else if (routingNumber.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyRoutingNumber);
      return false;
    } else if (bankName.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyBankName);
      return false;
    } else {
      return true;
    }
  }

  //------------------ PAYMENT SCREEN VALIDATION ---------------//
  bool createMenuValidate(
      {required String menuName,
      required String cost,
      required String estimatedTime,
      required String description,
      // required String offerName,
      // required String discount,
      // required String validityDate,
      required BuildContext context}) {
    if (menuName.isEmpty) {
      FlushBar().showFlushBar(context, "Menu Name field can't be empty.");
      return false;
    } else if (cost.isEmpty) {
      FlushBar().showFlushBar(context, "Cost field can't be empty.");
      return false;
    } else if (estimatedTime.isEmpty) {
      FlushBar().showFlushBar(context, "Estimated time field can't be empty.");
      return false;
    } else if (description.isEmpty) {
      FlushBar().showFlushBar(context, "Description field can't be empty.");
      return false;
    } else {
      return true;
    }
  }

  bool validateCancel(String reason, context) {
    if (reason.isEmpty) {
      FlushBar().showFlushBar(context, AppStrings.emptyReason);
      return false;
    } else {
      return true;
    }
  }
}
