// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:mecca/Services/network.dart';
// import 'package:mecca/Utils/app_navigation.dart';
// import 'package:mecca/Utils/app_network_strings.dart';

// class ResendOtpBloc {
//   FormData? _formData;
//   Response? _response;
//   VoidCallback? _onSuccess, _onFailure;

//   void resendCodeBlocMethod({
//     required BuildContext context,
//     String? userId,
//     final Function()? resendCallBack,
//     required VoidCallback setProgressBar,
//   }) async {
//     setProgressBar();
//     Map<String, dynamic>? _formDataMap = {
//       "id": userId,
//     };
//     _onFailure = () {
//       AppNavigation.navigatorPop(context);
//     };

//     _response = await Network().postRequestRawData(
//         endPoint: NetworkStrings.RESEND_OTP_ENDPOINT,
//         body: _formDataMap,
//         context: context,
//         onFailure: _onFailure,
//         isHeaderRequire: false);

//     _onSuccess = () {
//       resendCallBack?.call();
//       AppNavigation.navigatorPop(context);
//     };

//     _validateResponse();
//   }

//   /// Validate Response
//   void _validateResponse() {
//     if (_response != null) {
//       Network().validateResponse(
//           isToast: true,
//           response: _response,
//           onSuccess: _onSuccess,
//           onFailure: _onFailure);
//     }
//   }
// }
