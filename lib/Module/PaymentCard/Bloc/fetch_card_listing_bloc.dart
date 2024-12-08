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

// class GetCardListingBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;

//   void getCardListingMethod({
//     required BuildContext context,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();

//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//     };

//     _response = await Network().getRequest(
//       endPoint: NetworkStrings.GET_CARD_LIST_ENDPOINT,
//       queryParameters: {"role": RoleController.i.selectedRole.value},
//       context: context,
//       onFailure: _onFailure,
//       isHeaderRequire: true,
//     );

//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       _responseMethod(
//         context: context,
//       );
//     };
//     _validateResponse();
//   }

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
//     log('Get All Card List ${jsonEncode(_response?.data['cards']['data'])}');
//     try {
//       if (_response != null) {
//         MainController.i.paymentCardList.clear();
//         _response?.data['cards']['data'].forEach((element) {
//           MainController.i.paymentCardList
//               .add(PaymentCardData.fromJson(element));
//         });
//       }
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
