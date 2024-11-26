import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/app_validator.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/custom_auth_scaffold.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_padding.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/custom_textfield.dart';
import '../Controller/auth_controller.dart';

class LoginWithPhoneScreen extends StatelessWidget {
  const LoginWithPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
        isLeading: true,
        title: AppStrings.LOGIN_WITH_PHONE,
        child: CustomPadding(
          child: Column(children: [
            // 40.ph,
            _phoneTextField(context: context),
            20.ph,
            _loginButton(context),
          ]),
        ));
  }

  // Widget customPhoneField() {
  //   return SizedBox(
  //     height: 50.h,
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Container(
  //           height: 46.h,
  //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //           decoration: BoxDecoration(
  //               border: Border.all(color: AppColors.TRANSPARENT_COLOR),
  //               borderRadius: BorderRadius.circular(50.r),
  //               color: AppColors.LIGHT_GREY_COLOR),
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(70),
  //                 color: AppColors.LIGHT_GREY_COLOR),
  //             child: Row(
  //               children: [
  //                 Image.asset(
  //                   AssetPaths.USA_FLAG_ICON,
  //                   height: 25.h,
  //                   width: 25.h,
  //                 ),
  //                 5.pw,
  //                 CustomText(
  //                     text: '+1',
  //                     fontSize: 14.sp,
  //                     fontColor: AppColors.MEDIUM_BLACK_COLOR,
  //                     fontFamily: AppFonts.JONES_MEDIUM),
  //               ],
  //             ),
  //           ),
  //         ),
  //         8.pw,
  //         Expanded(
  //           child: CustomTextField(
  //             controller: AuthController.i.phNoEditingController,
  //             keyboardType: TextInputType.number,
  //             hint: AppStrings.PHONE_NUMBER,
  //             divider: false,
  //             prefxicon: AssetPaths.PHONE_ICON,
  //             borderRadius: 50.r,
  //             bgColor: AppColors.LIGHT_GREY_COLOR,
  //             isDense: false,
  //             textCapitalization: TextCapitalization.none,
  //             inputFormatters: [
  //               LengthLimitingTextInputFormatter(Constants.PHONE_MAX_LENGHT),
  //               MaskTextInputFormatter(
  //                   mask: '(+1)###-###-####', filter: {"#": RegExp(r'[0-9]')}),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget _phoneTextField({required BuildContext context}) {
    return CustomTextField(
      controller: AuthController.i.phNoEditingController,
      keyboardType: TextInputType.number,
      hint: AppStrings.PHONE_NUMBER,
      prefxicon: AssetPaths.PHONE_ICON,
      borderRadius: 50.r,
      bgColor: Constants.isDarkTheme(context: context)
          ? AppColors.TRANSPARENT_COLOR
          : AppColors.WHITE_COLOR,
      borderColor: Constants.isDarkTheme(context: context)
          ? AppColors.WHITE_COLOR
          : AppColors.TRANSPARENT_COLOR,
      prefixIconColor: Constants.isDarkTheme(context: context)
          ? AppColors.PINK_COLOR
          : AppColors.ORANGE_COLOR,
      isDense: false,
      verticalPadding: 2.0,
      label: false,
      divider: false,
      textCapitalization: TextCapitalization.none,
      inputFormatters: [
        LengthLimitingTextInputFormatter(Constants.PHONE_MAX_LENGHT),
        MaskTextInputFormatter(
            mask: '(+1)###-###-####', filter: {"#": RegExp(r'[0-9]')}),
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return CustomButton(
      title: AppStrings.NEXT,
      onTap: () {
        bool isPhoneValidate = FieldValidator().validatePhone(
            AuthController.i.phNoEditingController.text, context);
        if (isPhoneValidate) {
          AuthController.i.loginType.value = AppStrings.PHONE_NUMBER;
          // FirebaseAuthBloc().signInWithPhone(
          //   setProgressBar: () =>
          //       AppDialogs.progressAlertDialog(context: context),
          //   cancelProgressBar: () => AppNavigation.navigatorPop(context),
          //   countryCode: 'US',
          //   dialCode: '1',
          //   phoneNumber: Constants()
          //       .phoneMaskFormatter
          //       .unmaskText(AuthController.i.phNoEditingController.text),
          //   context: context,
          // );
        }
      },
    );
  }
}
