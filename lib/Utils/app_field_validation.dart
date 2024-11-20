// import 'package:cosmetologist/auth/routing_arguments/add_portfolio_routing_argument.dart';
// import 'package:cosmetologist/main.dart';
// import 'package:cosmetologist/utils/app_constants.dart';
// import 'package:cosmetologist/utils/app_dialogs.dart';
// import 'package:cosmetologist/utils/app_flushbar.dart';
// import 'package:cosmetologist/utils/app_navigation.dart';
// import 'package:cosmetologist/utils/app_route_name.dart';
// import 'package:cosmetologist/utils/asset_paths.dart';
// import 'package:flutter/cupertino.dart';

// import 'app_strings.dart';

// class FieldValidator {
//   static Pattern EmailPattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   static RegExp regExp = RegExp(EmailPattern.toString());
//   static RegExp PASSWORD_VALIDATION_REGEX = RegExp(
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@}#\]{$&:)[*~^_,(+-.<%;/>]).{8,}$'); //~ ` ! @ % $ < > ( ) ? / \ [ ] { } : ; ' " = + - _ * ^ , .

// //------------------ PHONE NUMBER SCREEN VALIDATION ---------------//
//   bool validatePhone(String number, String code, context) {
//     if (number.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyPhoneNumber);
//       return false;
//     } else if (number.length < 6) {
//       FlushBar().showFlushBar(context, AppStrings.invalidPhoneNumber);
//       return false;
//     } else {
//       return true;
//     }
//   }

// //------------------ LOGIN SCREEN VALIDATION ---------------//
//   bool validateLogin(String email, context) {
//     if (email.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyEmailAddress);
//       return false;
//     } else if (!regExp.hasMatch(email.trim())) {
//       FlushBar().showFlushBar(context, AppStrings.invalidEmailAddress);
//       return false;
//     } else {
//       return true;
//       // AppNavigation.navigateReplacement(
//       //     context, AppRouteName.verificationScreenRoute,
//       //     arguments: VerificationArguments(
//       //         isFromPhoneNumber: false, emailAddress: email));
//       // AppDialogs.showToast(message: AppStrings.OTP_SEND_AT_EMAIL);
//     }
//   }

//   //---------------- CREATE PROFILE SCREEN VALIDATION -----------------//
//   bool validateProfile(String firstName, String lastName, String phone,
//       bool? isFromEdit, context) {
//     if (firstName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyFirstName);
//       return false;
//     } else if (lastName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyLastName);
//       return false;
//     } else if (phone.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyPhoneNumber);
//       return false;
//     } else if (phone.length < 6) {
//       FlushBar().showFlushBar(context, AppStrings.invalidPhoneNumber);
//       return false;
//     } else {
//       return true;
//       // if (isFromEdit == true) {
//       //   AppNavigation.navigatorPop(context);
//       //   AppDialogs.showToast(message: AppStrings.profileUpdatedSuccessfully);
//       // } else {
//       //   AppDialogs().showCustomConfirmationDialog(
//       //       description: AppStrings.createdYourProfile,
//       //       context, onTapCross: () {
//       //     AppNavigation.navigateTo(context, AppRouteName.mainMenuScreenRoute,
//       //         arguments: MainMenuRoutingArguments(
//       //           selectedIndex: 0,
//       //         ));
//       //     AppDialogs.showToast(message: AppStrings.loginSuccessfully);
//       //   }, onTapButton: () {
//       //     AppNavigation.navigateTo(context, AppRouteName.mainMenuScreenRoute,
//       //         arguments: MainMenuRoutingArguments(
//       //           selectedIndex: 0,
//       //         ));
//       //     AppDialogs.showToast(message: AppStrings.loginSuccessfully);
//       //   });
//       // }
//     }
//   }

//   //---------------- COSMETOLOGIST CREATE PROFILE SCREEN VALIDATION -----------------//
//   bool validateCosmetologistProfile(
//       String firstName,
//       String lastName,
//       String phone,
//       String exp,
//       String bio,
//       bool? isFromEdit,
//       String address,
//       String contryName,
//       String stateName,
//       String cityName,
//       context) {
//     if (firstName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyFirstName);
//       return false;
//     } else if (lastName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyLastName);
//       return false;
//     } else if (phone.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyPhoneNumber);
//       return false;
//     } else if (phone.length < 6) {
//       FlushBar().showFlushBar(context, AppStrings.invalidPhoneNumber);
//       return false;
//     } else if (exp.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyExperience);
//       return false;
//     } else if (bio.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyBio);
//       return false;
//     } else if (address.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyAddress);
//       return false;
//     } else if (contryName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyCountry);
//       return false;
//     } else if (stateName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyState);
//       return false;
//     } else if (cityName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyCity);
//       return false;
//     } else {
//       return true;
//     }
//   }

//   //---------------- CREATE PROFILE SCREEN FROM PHONE VALIDATION -----------------//
//   bool validatePhoneProfile(
//       String firstName, String lastName, bool? isFromEdit, context) {
//     if (firstName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyFirstName);
//       return false;
//     } else if (lastName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyLastName);
//       return false;
//     } else {
//       return true;
//       // if (isFromEdit == true) {
//       //   AppNavigation.navigatorPop(context);
//       //   AppDialogs.showToast(message: AppStrings.profileUpdatedSuccessfully);
//       // } else {
//       //   AppDialogs().showCustomConfirmationDialog(
//       //       description: AppStrings.createdYourProfile,
//       //       context, onTapCross: () {
//       //     AppNavigation.navigateTo(context, AppRouteName.mainMenuScreenRoute,
//       //         arguments: MainMenuRoutingArguments(
//       //           selectedIndex: 0,
//       //         ));
//       //     AppDialogs.showToast(message: AppStrings.loginSuccessfully);
//       //   }, onTapButton: () {
//       //     AppNavigation.navigateTo(context, AppRouteName.mainMenuScreenRoute,
//       //         arguments: MainMenuRoutingArguments(
//       //           selectedIndex: 0,
//       //         ));
//       //     AppDialogs.showToast(message: AppStrings.loginSuccessfully);
//       //   });
//       // }
//     }
//   }

//   bool validateCostPhoneProfile(String firstName, String lastName, String bio,
//       String exp, bool? isFromEdit, context) {
//     if (firstName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyFirstName);
//       return false;
//     } else if (lastName.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyLastName);
//       return false;
//     } else if (bio.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyExperience);
//       return false;
//     } else if (exp.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyBio);
//       return false;
//     } else {
//       return true;
//     }
//   }

//   //------------------ PAYMENT SCREEN VALIDATION ---------------//
//   bool validateCard(String name, String num, String date, String cvv, context) {
//     if (name.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyAccountHolder);
//       return false;
//     } else if (num.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyAccountNumber);
//       return false;
//     } else if (num.length < 16) {
//       FlushBar().showFlushBar(context, AppStrings.lengthCard);
//       return false;
//     } else if (date.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyExpDate);
//       return false;
//     } else if (cvv.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyCvv);
//       return false;
//     } else if (cvv.length < 3) {
//       FlushBar().showFlushBar(context, AppStrings.lengthCvv);
//       return false;
//     } else {
//       return true;
//     }
//   }

//   //------------------ CANCEL BOOKING SCREEN VALIDATION ---------------//
//   static void validateCancelBooking(String reason, context) {
//     if (reason.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyReason);
//     } else {
//       FocusScope.of(context).unfocus();
//     }
//   }

//   //------------------ REVIEW RATING SCREEN VALIDATION ---------------//
//   bool validateRating(String reason, context) {
//     if (reason.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyReview);
//       return false;
//     } else {
//       return true;
//     }
//   }

//   //------------------ REPORT SCREEN VALIDATION ---------------//
//   static void validateReport(String reason, context) {
//     if (reason.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyReason);
//     } else {
//       FocusScope.of(context).unfocus();
//       AppNavigation.navigatorPop(Constants.navigatorKey.currentContext!);
//       AppDialogs().showCustomConfirmationDialog(context,
//           description: AppStrings.reportSubmitted, onTapCross: () {
//         AppNavigation.navigatorPop(Constants.navigatorKey.currentContext!);
//         AppNavigation.navigatorPop(Constants.navigatorKey.currentContext!);
//       }, onTapButton: () {
//         AppNavigation.navigatorPop(Constants.navigatorKey.currentContext!);
//         AppNavigation.navigatorPop(Constants.navigatorKey.currentContext!);
//       });
//     }
//   }

//   //------------------ FILE DISPUTE SCREEN VALIDATION ---------------//
//   static void validateDispute(String reason, context) {
//     if (reason.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyReason);
//     } else {
//       FocusScope.of(context).unfocus();
//       AppNavigation.navigatorPop(Constants.navigatorKey.currentContext!);
//       AppDialogs().showCustomConfirmationDialog(context,
//           description: AppStrings.successfullyDisputedFile, onTapCross: () {
//         AppNavigation.navigatorPop(Constants.navigatorKey.currentContext!);
//       }, onTapButton: () {
//         AppNavigation.navigatorPop(Constants.navigatorKey.currentContext!);
//       });
//     }
//   }

//   //------------------  WORK EDUCATION SCREEN VALIDATION ---------------//
//   bool validateWorkEducation({
//     required List<Map<String, dynamic>> degree,
//     required List<String> experience,
//     required BuildContext context,
//   }) {
//     bool isDegreeEmpty = degree.any((item) => item['degree_name'].text.isEmpty);
//     bool isInstituteEmpty =
//         degree.any((item) => item['institution_name'].text.isEmpty);
//     bool isExperienceEmpty = experience.any((item) => item.isEmpty);

//     if (isDegreeEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyDegreeName);
//       return false;
//     } else if (isInstituteEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyInstituteName);
//       return false;
//     } else if (isExperienceEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyExperienceName);
//       return false;
//     } else {
//       FocusScope.of(context).unfocus();
//       AppNavigation.navigateTo(context, AppRouteName.addPortfolioScreenRoute,
//           arguments: addPortfolioRoutingArguments(fromEdit: false));
//       return true;
//     }
//   }

//   //------------------  SERVICE SCREEN VALIDATION ---------------//
//   bool validateService(
//       {required String name,
//       required String price,
//       required String image,
//       bool? fromEdit,
//       required BuildContext context}) {
//     if (image == "null") {
//       FlushBar().showFlushBar(context, AppStrings.emptyServiceImage);
//       return false;
//     } else if (name.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyServiceName);
//       return false;
//     } else if (price.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyPrice);
//       return false;
//     } else {
//       return true;
//       // FocusScope.of(context).unfocus();
//       // fromEdit == true
//       //     ? AppDialogs.showToast(message: AppStrings.serviceEditedSuccessfully)
//       //     : AppDialogs.showToast(message: AppStrings.serviceAddedSuccessfully);
//       // AppNavigation.navigatorPop(context);
//     }
//   }

//   //------------------ ADD YOUR SERVICE SCREEN VALIDATION ---------------//
//   static void validateYourService(
//       {required String image,
//       required TextEditingController name,
//       required TextEditingController price,
//       required VoidCallback onNextPressed,
//       required BuildContext context}) {
//     if (image.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyServiceImage);
//     } else if (name.text.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyServiceName);
//     } else if (price.text.isEmpty) {
//       FlushBar().showFlushBar(context, AppStrings.emptyPrice);
//     } else {
//       FocusScope.of(context).unfocus();
//       String isName = name.text;
//       AppStrings.serviceOfferList['serviceOfferData'].add({
//         "image": AssetPaths.temp2,
//         "name": isName,
//         "price": 80,
//       });
//       name.clear();
//       price.clear();
//       onNextPressed();
//       AppNavigation.navigateTo(context, AppRouteName.yourServiceScreenRoute);
//     }
//   }

//   //------------------ VALIDATE APPOINTMENT SCREEN VALIDATION ---------------//
//   bool validateAppointment(String endDate, String hours, String mins,
//       int serviceLength, bool isReminder,int selectedTimeLength ,context) {
//   //? if Reminder True then
//     if (isReminder) {
//       if (endDate.isEmpty) {
//         FlushBar().showFlushBar(context, AppStrings.emptyEndDate);
//         return false;
//       } else if (hours.isEmpty) {
//         FlushBar().showFlushBar(context, AppStrings.emptyhours);
//         return false;
//       } else if (mins.isEmpty) {
//         FlushBar().showFlushBar(context, AppStrings.emptymins);
//         return false;
//       } else {
//         return true;
//       }
//     } 
//     //? If No reminder
//     else {
//       if (serviceLength == 0) {
//         FlushBar().showFlushBar(context, AppStrings.addService);
//         return false;
//       } else if(serviceLength != selectedTimeLength){
//         FlushBar().showFlushBar(context, AppStrings.selectSlot);
//         return false;
//       }
//       else {
//         return true;
//       }
//     }
//   }
// }
