import 'dart:developer';

import 'package:flutter/cupertino.dart';

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
      String firstName,
      String lastName,
      String emailAddress,
      String location,
      String phoneNumber,
      String dateOfBirth,
      String gender,
      String designation,
      context) {
    if (firstName.isEmpty) {
      FlushBar().showFlushBar(context, "First name field can't be empty.");
      return false;
    } else if (lastName.isEmpty) {
      FlushBar().showFlushBar(context, "Last name field can't be empty.");
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
    } else if (designation.isEmpty) {
      FlushBar().showFlushBar(context, "Designation field can't be empty.");
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


  bool validateEducationDataProfile(
      String gradeLevel, String institueName, String cgpaData, context) {
    if (gradeLevel.isEmpty) {
      FlushBar().showFlushBar(context, "Grade level field can't be empty.");
      return false;
    } else if (institueName.isEmpty) {
      FlushBar()
          .showFlushBar(context, "Institution name field can't be empty.");
      return false;
    } else if (cgpaData.isEmpty) {
      FlushBar().showFlushBar(context, "GPA/Percentage field can't be empty.");
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
