// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:your_fastfood/Common/Auth/Controller/auth_controller.dart';
// import 'package:your_fastfood/Common/Splash/Controller/splash_controller.dart';
// import 'package:your_fastfood/Services/network.dart';
// import 'package:your_fastfood/Utils/app_dialogs.dart';
// import 'package:your_fastfood/Utils/app_navigation.dart';
// import 'package:your_fastfood/Utils/app_network_strings.dart';

// class CheckMerchantBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;
//   Future<void> checkMerchantBlocMethod({
//     required BuildContext context,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();
//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//     };
//     _response = await Network().getRequest(
//         endPoint: NetworkStrings.CHECK_MERCHANT_ACCOUNT_ENDPOINT,
//         context: context,
//         onFailure: _onFailure,
//         isHeaderRequire: true);
//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       _responseMethod(context: context);
//     };
//     _validateResponse();
//   }

//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           isToast: false,
//           response: _response,
//           onSuccess: _onSuccess,
//           onFailure: _onFailure);
//     }
//   }

//   void _responseMethod({
//     required BuildContext context,
//   }) async {
//     try {
//       // log(_response!.data.toString());
//       if (_response?.data != null) {
//         if (_response?.data['merchant_account'] == 1) {
//           SplashController.i.currentUser.value?.accountActive = 1;
//           SplashController.i.update();
//         }
//       } else {
//         SplashController.i.currentUser.value?.accountActive = 0;
//         SplashController.i.update();
//         AppDialogs.showToast(message: "Your account has not been verified");
//       }

// //  if (AuthController.i.merchantURL == null) {
// //             SplashController.i.currentUser.value?.accountActive = 1;
// //             SplashController.i.update();
// //             log("MET: ${SplashController.i.currentUser.value?.accountActive}");
// //             // setState(() {});
// //           } else {
// //             SplashController.i.currentUser.value?.accountActive = 0;
// //             SplashController.i.update();
// //             AppDialogs.showToast(message: "Your account has not been verified");
// //           }
//     } catch (error) {
//       print(error);
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
