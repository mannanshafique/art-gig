// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' as GetX;
// import 'package:mecca/Common/Auth/Controller/auth_controller.dart';
// import 'package:mecca/Common/Auth/Model/user_model.dart';
// import 'package:mecca/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:mecca/Common/Splash/Controller/splash_controller.dart';
// import 'package:mecca/Services/firebase_messaging_service.dart';
// import 'package:mecca/Services/network.dart';
// import 'package:mecca/Services/shared_prefernces.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_network_strings.dart';
// import 'package:mecca/Utils/app_route_name.dart';
// import 'package:mecca/Utils/app_routing_arguments.dart';
// import 'package:mecca/Utils/app_strings.dart';

// class SocialLoginBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;
//   UserDataModel? _socialLoginResponse;
//   String? deviceToken;

//   void socialLoginBlocMethod({
//     required BuildContext context,
//     String? firstName,
//     String? lastName,
//     String? userEmail,
//     required String? socialType,
//     String? phoneNo,
//     String? countryCode,
//     String? dialCode,
//     required String userSocialToken,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();
//     deviceToken = await FirebaseMessagingService().getToken();
//     //Form Data
//     Map<String, dynamic>? formDataMap = {
//       "phone": phoneNo,
//       "countryCode": countryCode,
//       "ISOCode": dialCode,
//       "email": userEmail,
//       "socialToken": userSocialToken,
//       "socialType": socialType,
//       "deviceToken": deviceToken,
//       "deviceType": Platform.isIOS ? AppStrings.IOS : AppStrings.ANDROID,
//       "role": RoleController.i.selectedRole.value,
//     };
//     log("Social login data is " +
//         {
//           "phoneNo": phoneNo,
//           "countryCode": countryCode,
//           "dialCode": dialCode,
//           "email": userEmail,
//           "socialToken": userSocialToken,
//           "socialType": socialType,
//           "devicetoken": deviceToken,
//           "devicetype": Platform.isIOS ? AppStrings.IOS : AppStrings.ANDROID,
//           "role": RoleController.i.selectedRole.value,
//         }.toString());

//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//     };

//     _response = await Network().postRequestRawData(
//         endPoint: NetworkStrings.SOCIAL_LOGIN_ENDPOINT,
//         body: formDataMap,
//         context: context,
//         onFailure: _onFailure,
//         isHeaderRequire: false);

//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       // if (socialType == AppStrings.PHONE_NUMBER) {
//       //   AppDialogs.showToast(message: AppStrings.OTP_VERIFIED_SUCESS_TOAST);
//       // }
//       _socialLoginResponseMethod(
//           context: context,
//           socialType: socialType!,
//           countryCode: countryCode,
//           firstName: firstName,
//           lastName: lastName,
//           phoneNo: phoneNo,
//           userEmail: userEmail);
//     };
//     _validateResponse();
//   }

//   ///------------------ Validate Response
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           response: _response,
//           onSuccess: _onSuccess,
//           onFailure: _onFailure,
//           isToast: false);
//     }
//   }

//   void _socialLoginResponseMethod({
//     required BuildContext context,
//     required String socialType,
//     String? firstName,
//     String? lastName,
//     String? userEmail,
//     String? phoneNo,
//     String? countryCode,
//     String? dialCode,
//   }) {
//     // try {
//     log('COuntryCode : $countryCode --');
//     final AuthController authController = GetX.Get.find<AuthController>();
//     authController.firstNameEditingController.text = firstName ?? '';
//     authController.lastNameEditingController.text = lastName ?? '';
//     authController.emailEditingController.text = userEmail ?? '';
//     authController.phNoEditingController.text =
//         authController.loginType.value == AppStrings.PHONE_NUMBER
//             ? '(+1)$phoneNo'
//             : '';
//     _socialLoginResponse = UserDataModel.fromJson(_response?.data['data']);
//     log('---Set Response--${jsonEncode(_socialLoginResponse)}');
//     if (_socialLoginResponse != null) {
//       print('-----Inside _socialLoginResponseMethod');
//       SharedPreference().setUser(user: jsonEncode(_socialLoginResponse));
//       SharedPreference()
//           .setBearerToken(token: _socialLoginResponse?.token ?? '');

//       SplashController.i.currentUser.value = _socialLoginResponse;
// //!-------Check Is User Profile Complete Or Not
//       if (_socialLoginResponse?.isProfileCompleted.toString() == "0") {
//         print('------------Profile Not Completed');
//         AppNavigation.navigateReplacement(
//             context, AppRouteName.CREATE_EDIT_PROFILE_SCREEN_ROUTE,
//             arguments: CreateEditProfileArguments(isFromEdit: false));
//       } else if (_socialLoginResponse?.isProfileCompleted.toString() == "1") {
//         print('------------Profile Completed');
//         AppNavigation.navigateTo(context, AppRouteName.MAIN_MENU_SCREEN_ROUTE);
//       }
//     }
//     // } catch (error) {
//     //   print(error);
//     //   AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     // }
//   }
// }
