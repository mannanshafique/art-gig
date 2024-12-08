// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mecca/Common/Role_Selection/Controller/role_controller.dart';
// import 'package:mecca/Module/MainMenu/main_controller.dart';
// import 'package:mecca/Services/network.dart';
// import 'package:mecca/Utils/app_dialogs.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_network_strings.dart';

// //!-------Use On Both Post Likes + Comments Like
// class DeleteCardBloc {
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;

//   void deleteCardMethod({
//     required BuildContext context,
//     required String? cardId,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();

//     Map<String, dynamic>? _queryMap = {
//       "role": RoleController.i.selectedRole.value
//     };

//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//     };

//     _response = await Network().deleteRequest(
//       endPoint: '${NetworkStrings.DELETE_CARD_ENDPOINT}/$cardId',
//       queryParameters: _queryMap,
//       context: context,
//       onFailure: _onFailure,
//       isHeaderRequire: true,
//     );

//     _onSuccess = () {
//       AppNavigation.navigatorPop(context);
//       _responseMethod(context: context, cardId: cardId);
//     };
//     _validateResponse();
//   }

//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//         isToast: true,
//         response: _response,
//         onSuccess: _onSuccess,
//         onFailure: _onFailure,
//       );
//     }
//   }

//   void _responseMethod(
//       {required BuildContext context, required String? cardId}) {
//     try {
//       if (_response != null) {
//         MainController.i.paymentCardList
//             .removeWhere((element) => element.id.toString() == cardId);
//       }
//     } catch (error) {
//       AppDialogs.showToast(message: NetworkStrings.SOMETHING_WENT_WRONG);
//     }
//   }
// }
