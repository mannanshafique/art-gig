// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' as GetX;
// import 'package:your_fastfood/Services/network.dart';
// import 'package:your_fastfood/Services/shared_prefernces.dart';
// import 'package:your_fastfood/Utils/app_dialogs.dart';
// import 'package:your_fastfood/Utils/app_navigation.dart';
// import 'package:your_fastfood/Utils/app_network_strings.dart';
// import 'package:your_fastfood/Utils/app_route_name.dart';

// class DeleteAccountBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;

//   void deleteAccountBlocMethod({
//     required BuildContext context,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();

//     _onFailure = () {
//       log((_response?.data).toString());
//       AppNavigation.navigatorPop(context);
//     };

//     _response = await Network().getRequest(
//         endPoint: NetworkStrings.DELETE_ENDPOINT,
//         context: context,
//         onFailure: _onFailure,
//         isToast: false,
//         isHeaderRequire: true);

//     _onSuccess = () {
//       _deleteResponseMethod(context: context);
//     };

//     _validateResponse();
//   }

//   ////////////////// Validate Response ////////////////////////////////////
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           response: _response, onSuccess: _onSuccess, onFailure: _onFailure);
//     }
//   }

//   void _deleteResponseMethod({required BuildContext context}) {
//     try {
//       AppNavigation.navigatorPop(context);
//       AppNavigation.navigateToRemovingAll(
//           context, AppRouteName.ROLE_SELECTION_SCREEN_ROUTE);
//       SharedPreference().clear();
//       // SocketService.instance!.dispose();
//       GetX.Get.deleteAll();
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
