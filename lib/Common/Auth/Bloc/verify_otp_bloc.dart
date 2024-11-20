// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mecca/Common/Auth/Model/user_model.dart';
// import 'package:mecca/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:mecca/Common/Splash/Controller/splash_controller.dart';
// import 'package:mecca/Services/network.dart';
// import 'package:mecca/Services/shared_prefernces.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_network_strings.dart';
// import 'package:mecca/Utils/app_route_name.dart';
// import 'package:mecca/Utils/app_routing_arguments.dart';
// import 'package:get/get.dart' as GetX;
// import 'package:mecca/Utils/app_strings.dart';

// class VerifyOtpBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;
//   UserDataModel? _userDataFromResponse;

//   void verifyOtpBlocMethod({
//     required BuildContext context,
//     String? userId,
//     String? otpCode,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();

//     _onFailure = () {
//       FocusScope.of(context).requestFocus(FocusNode());
//       AppNavigation.navigatorPop(context);
//     };

//     Map<String, dynamic> _formData = {"otp": otpCode, "id": userId};

//     log({"otp": otpCode, "user_id": userId}.toString());

//     _response = await Network().postRequestRawData(
//         context: context,
//         body: _formData,
//         endPoint: NetworkStrings.OTP_VERIFICATION_ENDPOINT,
//         onFailure: _onFailure,
//         isHeaderRequire: false);

//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       _verifyOtpResponseMethod(
//         context: context,
//       );
//     };
//     _validateResponse();
//   }

//   /// Validate Response
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           response: _response,
//           isToast: false,
//           onSuccess: _onSuccess,
//           onFailure: _onFailure);
//     }
//   }

//   void _verifyOtpResponseMethod({
//     required BuildContext context,
//   }) {
//     // FocusScope.of(context).requestFocus(FocusNode());
//     // try {
//     _userDataFromResponse = UserDataModel.fromJson(_response?.data['data']);
//     print('-----${jsonEncode(_userDataFromResponse)}');
//     if (_userDataFromResponse != null) {
//       print('-----Inside _verificationCodeResponse');
//       SharedPreference()
//           .setBearerToken(token: _userDataFromResponse?.token ?? '');
//       // log('----Brear TOken ${SharedPreference().getBearerToken()!}');
//       SharedPreference().setUser(user: jsonEncode(_userDataFromResponse));
//       // log('--Model: ${SharedPreference().getUser()!}');
//       GetX.Get.isRegistered<SplashController>()
//           ? GetX.Get.find<SplashController>().currentUser.value =
//               _userDataFromResponse
//           : GetX.Get.put(SplashController()).currentUser.value =
//               _userDataFromResponse;

//       if (_userDataFromResponse?.isProfileCompleted.toString() == "0") {
//         print('------------Profile Not Completed');
//         AppNavigation.navigateReplacement(
//             context, AppRouteName.CREATE_EDIT_PROFILE_SCREEN_ROUTE,
//             arguments: CreateEditProfileArguments(isFromEdit: false));
//       } else {
//         if (RoleController.i.selectedRole.value == AppStrings.CONSELOR &&
//             _userDataFromResponse?.isScheduleCompleted.toString() == "0") {
//           AppNavigation.navigateReplacement(
//             context,
//             AppRouteName.SCHEDULE_SCREEN_ROUTE,
//           );
//         } else {
//           log('------------Profile Completed');
//           AppNavigation.navigateTo(
//             context,
//             AppRouteName.MAIN_MENU_SCREEN_ROUTE,
//           );
//         }
//       }
//     }
//     // } catch (error) {
//     //   print("OTP ERROR");
//     //   print(error);
//     //   AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     // }
//   }
// }
