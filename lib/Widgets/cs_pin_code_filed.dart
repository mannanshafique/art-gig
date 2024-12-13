// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// import '../Utils/app_colors.dart';
// import '../Utils/app_fonts.dart';

// class CustomPinCodeField extends StatelessWidget {
//   void Function(String) onChanged;
//   void Function(String)? onCompleted;
//   final TextEditingController? controller;
//   FocusNode? focusNode;
//   CustomPinCodeField(
//       {Key? key,
//       required this.onChanged,
//       this.controller,
//       this.onCompleted,
//       this.focusNode})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PinCodeTextField(
//       focusNode: focusNode,
//       appContext: context,
//       pastedTextStyle: const TextStyle(
//         color: AppColors.BLACK_COLOR,
//       ),
//       autoDisposeControllers: false,
//       autoFocus: true,
//       length: 6,
//       obscureText: false,
//       obscuringCharacter: '*',
//       animationType: AnimationType.fade,
//       autoUnfocus: false,
//       pinTheme: PinTheme(
//           shape: PinCodeFieldShape.box,
//           activeColor: AppColors.WHITE_COLOR,
//           inactiveFillColor: AppColors.WHITE_COLOR,
//           inactiveColor: AppColors.WHITE_COLOR,
//           selectedFillColor: AppColors.WHITE_COLOR,
//           selectedColor: AppColors.WHITE_COLOR,
//           activeFillColor: AppColors.WHITE_COLOR,
//           fieldHeight: 38.h,
//           fieldWidth: 45.w,
//           borderRadius: BorderRadius.all(Radius.circular(10.r))),
//       enablePinAutofill: true,
//       cursorColor: AppColors.BLACK_COLOR,
//       animationDuration: const Duration(milliseconds: 300),
//       textStyle: TextStyle(
//           fontSize: 18.sp,
//           height: 1.8,
//           color: AppColors.BLACK_COLOR,
//           fontFamily: AppFonts.JONES_LIGHT),
//       enableActiveFill: true,
//       controller: controller,
//       keyboardType: TextInputType.number,
//       onCompleted: onCompleted,
//       onChanged: onChanged,
//       inputFormatters: [
//         FilteringTextInputFormatter.digitsOnly,
//       ],
//       beforeTextPaste: (text) {
//         // Check if the pasted text contains only numeric characters
//         return RegExp(r'^[0-9]+$').hasMatch(text ?? '');
//       },
//     );
//   }
// }