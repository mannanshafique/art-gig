// // ignore_for_file: use_build_context_synchronously

// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mecca/Common/PaymentCard/Model/payment_card_model.dart';
// import 'package:mecca/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:mecca/Module/MainMenu/main_controller.dart';
// import 'package:mecca/Services/network.dart';
// import 'package:mecca/Services/stripe_service.dart';
// import 'package:mecca/Utils/app_dialogs.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_network_strings.dart';

// //!-------Use On Both Post Comment + Comments Reply
// class AddNewCardBloc {
//   Map<String, dynamic>? _formDataMap;
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;

//   void addNewCardBlocMethod({
//     required BuildContext context,
//     String? cardNumber,
//     int? expMonth,
//     int? expYear,
//     String? cvc,
//     required VoidCallback setProgressBar,
//   }) async {
//     //!----Set Progress Bar
//     setProgressBar();

//     final cardToken = await StripeService.stripeToken(
//       cardNumber: cardNumber,
//       expMonth: expMonth,
//       expYear: expYear,
//       cvc: cvc,
//     );
//     if (cardToken != null) {
//       _onFailure = () {
//         AppNavigation.navigatorPop(context);
//       };

//       // Form Data --Strip Card Id
//       _formDataMap = {
//         "cardTokenId": cardToken,
//         "role": RoleController.i.selectedRole.value
//       };

//       _onFailure = () {
//         AppNavigation.navigatorPop(context);
//       };

//       _response = await Network().postRequestRawData(
//           endPoint: NetworkStrings.ADD_NEW_CARD_ENDPOINT,
//           body: _formDataMap,
//           context: context,
//           onFailure: _onFailure,
//           isHeaderRequire: true);

//       _onSuccess = () {
//         AppNavigation.navigatorPop(context);
//         _responseMethod(
//           context: context,
//         );
//       };
//       _validateResponse();
//     } else {
//       AppNavigation.navigatorPop(context);
//     }
//   }

//   ///----------------------------------- Validate Response -----------------------------------
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           response: _response,
//           onSuccess: _onSuccess,
//           onFailure: _onFailure,
//           isToast: true);
//     }
//   }

//   void _responseMethod({
//     required BuildContext context,
//   }) async {
//     log('Add New Card ${jsonEncode(_response?.data)}');
//     try {
//       if (_response != null) {
//         MainController.i.paymentCardList
//             .add(PaymentCardData.fromJson(_response?.data['data']));
//         AppNavigation.navigatorPop(context);
//       }
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
