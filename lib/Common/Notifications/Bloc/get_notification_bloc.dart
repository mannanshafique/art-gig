// import 'dart:developer';
// import 'dart:ffi';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:your_fastfood/Common/Notifications/Model/notification_model.dart';
// import 'package:your_fastfood/Services/network.dart';
// import 'package:your_fastfood/Utils/app_dialogs.dart';
// import 'package:your_fastfood/Utils/app_navigation.dart';
// import 'package:your_fastfood/Utils/app_network_strings.dart';

// class GetNotificationBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;

//   void getNotificationBlocMethod({
//     required BuildContext context,
//     required VoidCallback setProgressBar,
//     required Function(List<NotificationData>) notificationData,
//   }) async {
//     setProgressBar();

//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//     };

//     _response = await Network().getRequest(
//         endPoint: NetworkStrings.GET_NOTIFICATIONS_ENDPOINT,
//         context: context,
//         onFailure: _onFailure,
//         isHeaderRequire: true);

//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       _responseMethod(context: context, notificationData: notificationData);
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

//   void _responseMethod(
//       {required BuildContext context,
//       required Function(List<NotificationData>) notificationData}) {
//     try {
//       if (_response != null) {
//         List<NotificationData> notiData = [];
//         _response?.data['data'].forEach((element) {
//           notiData.add(NotificationData.fromJson(element));
//         });
//         notificationData.call(notiData);
//       }
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
