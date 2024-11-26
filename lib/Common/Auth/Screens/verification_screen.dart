// ignore_for_file: must_be_immutable

import 'package:artgig/Utils/extensions.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/custom_auth_scaffold.dart';
import '../../../Widgets/custom_keyboard_action_widget.dart';
import '../../../Widgets/custom_padding.dart';
import '../../../Widgets/custom_text.dart';
import 'Setup_Profile/create_edit_profile_screen.dart';

class Otp extends StatefulWidget {
  Otp(
      {super.key,
      this.phoneVerificationId,
      this.phoneNumber,
      this.countryCode,
      this.userId,
      this.dialCode});
  final String? phoneNumber;
  final String? countryCode;
  final String? dialCode;
  String? phoneVerificationId;
  String? userId;

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  // FirebaseAuthBloc? _socialAuthBloc = FirebaseAuthBloc();
  final _pinCtrl = TextEditingController();
  final CountDownController _countDownController = CountDownController();
  final pincodeFocusNode = FocusNode();
  final int _duration = 60;
  bool isTimerCompleted = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
        isLeading: true,
        title: AppStrings.ENTER_AUTH_CODE,
        bottomNavigationWidget: _didnotReceiveCodeWidget(),
        showLogo: true,
        child: CustomPadding(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomText(
                text: AppStrings.PLZ_VERIFY_YOUR_ACCOUNT,
                fontSize: 14.sp,
                maxLines: 3,
                lineSpacing: 1.3,
                letterSpacing: 1.0,
                fontColor: Theme.of(context).textTheme.bodySmall?.color,
                fontFamily: AppFonts.JONES_REGULAR,
              ),
            ),
            10.ph,
            //!----Pin Code Field
            CustomKeyboardActionWidget(
              keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
              focusNode: pincodeFocusNode,
              child: PinCodeFields(
                focusNode: pincodeFocusNode,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                length: 6,
                controller: _pinCtrl,
                fieldBorderStyle: FieldBorderStyle.square,
                responsive: false,
                fieldHeight: 0.14.sw,
                fieldWidth: 0.12.sw,
                borderWidth: .9,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // autofocus: true,
                activeBorderColor: AppColors.BLACK_COLOR,
                borderColor: AppColors.LIGHT_GREY_COLOR,
                activeBackgroundColor: AppColors.WHITE_COLOR,
                borderRadius: BorderRadius.circular(50.r),
                keyboardType: TextInputType.number,
                autoHideKeyboard: false,
                fieldBackgroundColor: AppColors.LIGHT_GREY_COLOR,
                textStyle: TextStyle(
                    fontSize: 16.sp, fontFamily: AppFonts.JONES_MEDIUM),
                onComplete: (output) {
                  Get.to(() => CreateEditProfileScreen(isFromEdit: false));
                  // if (AuthController.i.loginType.value ==
                  //     AppStrings.PHONE_NUMBER) {
                  //   FirebaseAuthBloc().verifyPhoneCode(
                  //     context: context,
                  //     verificationId: widget.phoneVerificationId ?? '',
                  //     verificationCode: _pinCtrl.text,
                  //     countryCode: widget.countryCode,
                  //     phoneNo: widget.phoneNumber,
                  //   );
                  // } else {
                  //   VerifyOtpBloc().verifyOtpBlocMethod(
                  //       context: context,
                  //       userId: widget.userId,
                  //       otpCode: _pinCtrl.text,
                  //       setProgressBar: () {
                  //         AppDialogs.progressAlertDialog(context: context);
                  //       });
                  // }
                },
              ),
            ),
            30.ph,
            //!-----Counter
            CircleAvatar(
              backgroundColor: AppColors.LIGHT_GREY_COLOR,
              radius: 0.16.sw,
              child: CircularCountDownTimer(
                controller: _countDownController,
                duration: _duration,
                initialDuration: 0,
                isReverse: true,
                isReverseAnimation: true,
                textFormat: CountdownTextFormat.MM_SS,
                width: 0.46.sw,
                height: 0.46.sw,
                fillColor: AppColors.BLACK_COLOR,
                ringColor: AppColors.WHITE_COLOR,
                strokeWidth: 3,
                textStyle: TextStyle(
                  color: AppColors.BLACK_COLOR,
                  fontSize: 15.sp,
                  fontFamily: AppFonts.JONES_MEDIUM,
                ),
                onComplete: () {
                  setState(() {
                    isTimerCompleted = true;
                  });
                },
                onChange: ((value) {}),
              ),
            ),
          ]),
        ));
  }

  Widget _didnotReceiveCodeWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: AppStrings.DONT_RECEIVED_CODE,
            fontColor: AppColors.BLACK_COLOR,
            fontSize: 14.sp,
            fontFamily: AppFonts.JONES_REGULAR,
          ),
          GestureDetector(
            onTap: () {
              Constants.unFocusKeyboardMethod(context: context);
              if (isTimerCompleted) {
                _pinCtrl.clear();
                // resendOTPCode();
                _countDownController.restart();
                setState(() {
                  isTimerCompleted = false;
                });
              }
            },
            child: CustomText(
              text: AppStrings.RESEND,
              fontColor: isTimerCompleted
                  ? AppColors.BLACK_COLOR
                  : AppColors.LIGHT_GREY_COLOR,
              fontSize: 14.sp,
              underlined: true,
              fontFamily: AppFonts.JONES_BOLD,
            ),
          )
        ],
      ),
    );
  }

  void resendOTPCode() {
    // if (AuthController.i.loginType.value == AppStrings.PHONE_NUMBER) {
    //   FirebaseAuthBloc().resendPhoneCode(
    //     dialCode: '1',
    //     countryCode: 'US',
    //     phoneNumber: widget.phoneNumber ?? '',
    //     setProgressBar: () => AppDialogs.progressAlertDialog(context: context),
    //     cancelProgressBar: () => AppNavigation.navigatorPop(context),
    //     context: context,
    //     getVerificationId: (String? value) {
    //       setState(() {
    //         widget.phoneVerificationId = value;
    //       });
    //       _countDownController.restart();

    //       AppDialogs.showToast(message: AppStrings.OTP_RESEND_TOAST);
    //     },
    //   );
    // } else {
    //   ResendOtpBloc().resendCodeBlocMethod(
    //       context: context,
    //       userId: widget.userId,
    //       resendCallBack: () {
    //         _countDownController.restart();
    //       },
    //       setProgressBar: () {
    //         AppDialogs.progressAlertDialog(context: context);
    //       });
    // }
  }
}
