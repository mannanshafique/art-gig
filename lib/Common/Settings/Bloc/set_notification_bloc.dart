// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:your_fastfood/Common/Splash/Controller/splash_controller.dart';
// import 'package:your_fastfood/Services/network.dart';
// import 'package:your_fastfood/Utils/app_dialogs.dart';
// import 'package:your_fastfood/Utils/app_navigation.dart';
// import 'package:your_fastfood/Utils/app_network_strings.dart';
// import 'package:your_fastfood/Utils/app_strings.dart';

// class SetNotificationBloc {
//   FormData? _formData;
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;

//   void setNotificationBlocMethod({
//     required BuildContext context,
//     int? isNotificationOn,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();
//     _formData = FormData.fromMap({
//       "notification": isNotificationOn,
//     });
//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//       log(_response?.data);
//     };

//     _response = await Network().postRequest(
//         endPoint: NetworkStrings.NOTIFICATION_TOGGLE_ENDPOINT,
//         formData: _formData,
//         context: context,
//         onFailure: _onFailure,
//         isHeaderRequire: true);

//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       _responseMethod(context: context);
//     };

//     _validateResponse();
//   }

//   /// Validate Response
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           isToast: false,
//           response: _response,
//           onSuccess: _onSuccess,
//           onFailure: _onFailure);
//     }
//   }

//   void _responseMethod({required BuildContext context}) {
//     try {
//       if (_response != null) {
//         log((_response?.data['data']['notification'] ?? 0).toString());
//         SplashController.i.currentUser.value?.notification =
//             _response?.data['data']['notification'];
//         SplashController.i.currentUser.refresh();
//         if (_response?.data['data']['notification'] == 1) {
//           AppDialogs.showToast(message: AppStrings.NOTIFICATION_ON);
//         } else {
//           AppDialogs.showToast(message: AppStrings.NOTIFICATION_OFF);
//         }
//       }
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
