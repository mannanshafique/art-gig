// // ignore_for_file: use_build_context_synchronously

// import 'dart:developer';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mecca/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:mecca/Services/firebase_messaging_service.dart';
// import 'package:mecca/Services/network.dart';
// import 'package:mecca/Utils/app_dialogs.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_network_strings.dart';
// import 'package:mecca/Utils/app_route_name.dart';
// import 'package:mecca/Utils/app_routing_arguments.dart';
// import 'package:mecca/Utils/app_strings.dart';

// class LoginWithEmailBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;
//   String? deviceToken;

//   void loginBlocMethod({
//     required BuildContext context,
//     String? userEmail,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();
//     deviceToken = await FirebaseMessagingService().getToken();
//     Map<String, dynamic>? _formDataMap = {
//       "email": userEmail,
//       "role": RoleController.i.selectedRole.value,
//       "device_type": Platform.isIOS ? AppStrings.IOS : AppStrings.ANDROID,
//       "device_token": deviceToken ?? ''
//     };
//     log('ekjghfbeio' +
//         {
//           "email": userEmail,
//           "role": RoleController.i.selectedRole.value,
//           "device_type": Platform.isIOS ? AppStrings.IOS : AppStrings.ANDROID,
//           "device_token": deviceToken ?? ''
//         }.toString());
//     _onFailure = () {
//       print('--------------On Failure');
//       AppNavigation.navigatorPop(context); // StopLoader
//     };

//     _response = await Network().postRequestRawData(
//         context: context,
//         body: _formDataMap,
//         endPoint: NetworkStrings.LOGIN_ENDPOINT,
//         onFailure: _onFailure,
//         isHeaderRequire: false);

//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       _responseMethod(context: context);
//     };
//     _validateResponse();
//   }

//   //-------------------------- Validate Response --------------------------
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//         isToast: false,
//         response: _response,
//         onSuccess: _onSuccess,
//         onFailure: _onFailure,
//       );
//     }
//   }

//   void _responseMethod({required BuildContext context}) {
//     try {
//       if (_response != null) {
//         AppDialogs.showToast(message: AppStrings.OTP_SEND_AT_EMAIL);
//         log(_response!.data['data'].toString());
        // AppNavigation.navigateReplacement(
        //     context, AppRouteName.VERIFICATION_SCREEN_ROUTE,
        //     arguments: OtpVerificationArguments(
        //         userId: _response!.data['data']['_id'].toString()));
//       }
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
