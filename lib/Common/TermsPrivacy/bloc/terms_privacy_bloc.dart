// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:your_fastfood/Services/network.dart';
// import 'package:your_fastfood/Utils/app_network_strings.dart';

// class TermsPrivacyBloc {
//   Response? _response;
//   VoidCallback? _onSuccess;
//   dynamic contentTypeResponse;

//   ////////////////////////// Terms and Condition And Privacy Policy //////////////////////////////////
//   Future contentMethod(
//       {required BuildContext context, required String contentType}) async {
//     _response = await Network().getRequest(
//         context: context,
//         // queryParameters: {"type": contentType},
//         endPoint: NetworkStrings.CONTENT_ENDPOINT + contentType,
//         isToast: false,
//         isHeaderRequire: false);
//     _onSuccess = () {
//       contentTypeResponse = _response?.data;
//     };
//     _validateResponse();

//     return contentTypeResponse;
//   }

//   ////////////////// Validate Response ////////////////////////////////////
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           response: _response, onSuccess: _onSuccess, isToast: false);
//     }
//   }
// }
