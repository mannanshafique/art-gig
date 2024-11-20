// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mecca/Common/Auth/Model/user_model.dart';
// import 'package:mecca/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:mecca/Common/Splash/Controller/splash_controller.dart';
// import 'package:mecca/Services/network.dart';
// import 'package:mecca/Services/shared_prefernces.dart';
// import 'package:mecca/Utils/app_dialogs.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_network_strings.dart';
// import 'package:mecca/Utils/app_route_name.dart';
// import 'package:mecca/Utils/app_strings.dart';

// class UserCompleteProfileBloc {
//   FormData? _formData;
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;
//   UserDataModel? _userProfileResponse;

//   void userprofileBlocMethod({
//     required BuildContext context,
//     String? userId,
//     String? firstName,
//     String? lastName,
//     String? profileImage,
//     String? phoneNumber,
//     String? countryCode,
//     String? isoCode,
//     String? email,
//     String? dateOfBirth,
//     String? address,
//     String? city,
//     String? state,
//     String? zip,
//     String? gender,
//     String? gradeLevel,
//     String? institueName,
//     String? designation,
//     String? gpaValue,
//     List<String>? careerInterests,
//     required bool isEditProfile,
//     required VoidCallback setProgressBar,
//   }) async {
//     //!----Set Progress Bar
//     setProgressBar();

//     // Form Data
//     Map<String, dynamic>? _formDataMap = {
//       "firstName": firstName,
//       "lastName": lastName,
//       "phone": phoneNumber,
//       if (profileImage != null &&
//           profileImage != '' &&
//           !profileImage.startsWith('uploads'))
//         "profileImage":
//             await MultipartFile.fromFile(profileImage, filename: profileImage),
//       "address": address,
//       "countryCode": countryCode,
//       "ISOCode": isoCode,
//       "dob": dateOfBirth,
//       "city": city,
//       "state": state,
//       "zip": zip,
//       "gender": gender,
//       "gradeLevel": gradeLevel,
//       "InstituteName": institueName,
//       "currentWeightedGPA": gpaValue,
//       "careerInterest": careerInterests,
// // language: english
//       "designation": designation,
//       "role": RoleController.i.selectedRole.value
//     };

//     _formData = FormData.fromMap(_formDataMap);

//     log(_formDataMap.toString());

//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//       log(_response?.data.toString() ?? '');
//     };

//     _response = await Network().postRequest(
//         endPoint: NetworkStrings.COMPLETE_PROFILE_ENDPOINT,
//         formData: _formData,
//         context: context,
//         onFailure: _onFailure,
//         isHeaderRequire: true);

//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       _profileResponseMethod(context: context, isEditProfile: isEditProfile);
//     };
//     _validateResponse();
//   }

//   ///----------------------------------- Validate Response -----------------------------------
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           response: _response,
//           onSuccess: _onSuccess,
//           onFailure: _onFailure,
//           isToast: false);
//     }
//   }

//   void _profileResponseMethod(
//       {required BuildContext context, required bool isEditProfile}) async {
//     log('complete Profile ${jsonEncode(_response?.data)}');
//     try {
//       _userProfileResponse =
//           UserDataModel.fromJson(await _response?.data['data']);

//       if (_userProfileResponse != null) {
//         SharedPreference().setUser(user: jsonEncode(_userProfileResponse));
//         SharedPreference()
//             .setBearerToken(token: _userProfileResponse?.token ?? '');
//         SplashController.i.currentUser.value = _userProfileResponse;

//         if (!isEditProfile) {
//           //!_--
//           if (RoleController.i.selectedRole.value == AppStrings.CONSELOR) {
//             AppNavigation.navigateTo(
//                 context, AppRouteName.SCHEDULE_SCREEN_ROUTE);
//           } else if (RoleController.i.selectedRole.value ==
//               AppStrings.STUDENT) {
//             AppNavigation.navigateToRemovingAll(
//                 context, AppRouteName.MAIN_MENU_SCREEN_ROUTE);
//           } else {
//             AppNavigation.navigateToRemovingAll(
//                 context, AppRouteName.PARENT_AGREEMENT_SCREEN_ROUTE);
//           }

//           // ParentAgreementScreen
//         } else {
//           //! Coming From Edit Screen
//           AppNavigation.navigatorPop(context);
//         }
//       }
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
