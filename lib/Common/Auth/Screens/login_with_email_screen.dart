import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_route_name.dart';
import '../../../Utils/app_routing_arguments.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/app_validator.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/custom_auth_scaffold.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_padding.dart';
import '../../../Widgets/custom_textfield.dart';
import '../Controller/auth_controller.dart';

class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
        isLeading: true,
        title: AppStrings.LOGIN_WITH_EMAIL,
        child: CustomPadding(
          child: Column(children: [
            _emailTextField(),
            20.ph,
            _loginButton(context),
          ]),
        ));
  }

  Widget _emailTextField() {
    return CustomTextField(
      controller: AuthController.i.emailEditingController,
      keyboardType: TextInputType.emailAddress,
      prefxicon: AssetPaths.EMAIL_ICON,
      hint: AppStrings.EMAIL_ADDRESS,
      borderRadius: 50.r,
      bgColor: AppColors.LIGHT_GREY_COLOR,
      prefixIconColor: AppColors.BLACK_COLOR,
      isDense: false,
      verticalPadding: 0.0,
      label: true,
      divider: false,
      textCapitalization: TextCapitalization.none,
      inputFormatters: [
        LengthLimitingTextInputFormatter(Constants.EMAIL_MAX_LENGTH)
      ],
    );
  }

  Widget _loginButton(BuildContext context) {
    return CustomButton(
      title: AppStrings.CONTINUE,
      containerColor: AppColors.BLACK_COLOR,
      onTap: () {
        Constants.unFocusKeyboardMethod(context: context);
        bool isValidate = FieldValidator().validateEmail(
            AuthController.i.emailEditingController.text, context);
        if (isValidate) {
          AuthController.i.loginType.value = AppStrings.EMAIL_ADDRESS;
          AppNavigation.navigateReplacement(
              context, AppRouteName.VERIFICATION_SCREEN_ROUTE,
              arguments: OtpVerificationArguments(userId: ''));
          // LoginWithEmailBloc().loginBlocMethod(
          //     userEmail: AuthController.i.emailEditingController.text,
          //     context: context,
          //     setProgressBar: () {
          //       AppDialogs.progressAlertDialog(context: context);
          //     });
        }
      },
    );
  }
}
