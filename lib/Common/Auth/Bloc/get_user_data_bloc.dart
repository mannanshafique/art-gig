// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:your_fastfood/Common/Auth/Controller/auth_controller.dart';
// import 'package:your_fastfood/Common/Splash/Controller/splash_controller.dart';
// import 'package:your_fastfood/Module/Resturant/resturant_controller.dart';
// import 'package:your_fastfood/Services/network.dart';
// import 'package:your_fastfood/Utils/app_dialogs.dart';
// import 'package:your_fastfood/Utils/app_navigation.dart';
// import 'package:your_fastfood/Utils/app_network_strings.dart';

// //!_---hit if user is resturant bcz user all data on splash

// class GetResturantUserDataBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;
//   Future<void> getUserDataBlocMethod(
//       {required BuildContext context,
//       required VoidCallback setProgressBar,
//       required String userId}) async {
//     setProgressBar();
//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//     };
//     _response = await Network().getRequest(
//         endPoint: NetworkStrings.GET_USER_PROFILE_ENDPOINT,
//         queryParameters: {'user_id': userId},
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
//       log(_response?.data['data'].toString() ?? '--');
//       ResturantController.i.totalItems.value = int.parse(
//           (_response?.data?['data']['total_items'] ?? '0').toString());
//       ResturantController.i.reviews.value = double.parse(
//           (_response?.data?['data']['reviews'] ?? '0.0').toString());
//       ResturantController.i.revenue.value = double.parse(
//           (_response?.data?['data']['revenue'] ?? '0.0').toString());
//       ResturantController.i.update();
//     } catch (error) {
//       print(error);
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
