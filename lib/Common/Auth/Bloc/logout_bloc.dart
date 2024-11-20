// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart' as GetX;
// import 'package:mecca/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:mecca/Services/network.dart';
// import 'package:mecca/Services/shared_prefernces.dart';
// import 'package:mecca/Utils/app_dialogs.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_network_strings.dart';
// import 'package:mecca/Utils/app_route_name.dart';
// import 'package:mecca/Utils/app_strings.dart';

// class LogoutBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;

//   void logoutBlocMethod({
//     required BuildContext context,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();

//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//     };

//     _response = await Network().postRequestRawData(
//         endPoint: NetworkStrings.LOGOUT_ENDPOINT,
//         body: {
//           "role": RoleController.i.selectedRole.value,
//         },
//         context: context,
//         onFailure: _onFailure,
//         isToast: false,
//         isHeaderRequire: true);

//     _onSuccess = () {
//       _logoutResponseMethod(context: context);
//     };

//     _validateResponse();
//   }

//   ////////////////// Validate Response ////////////////////////////////////
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           isToast: false,
//           response: _response,
//           onSuccess: _onSuccess,
//           onFailure: _onFailure);
//     }
//   }

//   void _logoutResponseMethod({required BuildContext context}) {
//     try {
//       AppNavigation.navigatorPop(context);
//       AppNavigation.navigateToRemovingAll(
//           context, AppRouteName.ROLE_SELECTION_SCREEN_ROUTE);
//       SharedPreference().clear();
//       GetX.Get.deleteAll();
//       AppDialogs.showToast(message: AppStrings.LOGOUT_SUCESS_TOAST);
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
