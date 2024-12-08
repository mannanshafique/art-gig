// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mecca/Common/PaymentCard/Model/payment_card_model.dart';
// import 'package:mecca/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:mecca/Module/MainMenu/main_controller.dart';
// import 'package:mecca/Services/network.dart';
// import 'package:mecca/Utils/app_dialogs.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_network_strings.dart';

// //!-------Use On Both Post Comment + Comments Reply
// class SetDefaultCardBloc {
//   Map<String, dynamic>? _formDataMap;
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;

//   void setDefaultCardBlocMethod({
//     required BuildContext context,
//     String? cardId,
//     required VoidCallback setProgressBar,
//   }) async {
//     //!----Set Progress Bar
//     setProgressBar();

//     // Form Data --Strip Card Id
//     _formDataMap = {
//       "cardId": cardId,
//       "role": RoleController.i.selectedRole.value
//     };

//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//     };

//     _response = await Network().postRequestRawData(
//         endPoint: NetworkStrings.SET_DEFAULT_CARD_ENDPOINT,
//         body: _formDataMap,
//         context: context,
//         onFailure: _onFailure,
//         isHeaderRequire: true);

//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       _responseMethod(context: context, cardId: cardId ?? '');
//     };
//     _validateResponse();
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

//   void _responseMethod(
//       {required BuildContext context, required String cardId}) async {
//     log('Set Default Card ${jsonEncode(_response?.data)}');
//     try {
//       if (_response != null) {
//         setCardDeafult(cardId: cardId);
//       }
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }

//   void setCardDeafult({required String cardId}) {
//     // Find the index of the value
//     int currentIndex = MainController.i.paymentCardList
//         .indexWhere((element) => element.id == cardId);

//     if (currentIndex == -1) {
//       // Value not found in the list
//       return;
//     }

//     // Remove the value from its current index
//     PaymentCardData removedValue =
//         MainController.i.paymentCardList.removeAt(currentIndex);

//     // Insert the value at the new index
//     MainController.i.paymentCardList.insert(0, removedValue);
//     MainController.i.cardSelectedValue.value = 0;
//   }
// }
