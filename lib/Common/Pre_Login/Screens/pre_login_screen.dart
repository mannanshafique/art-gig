import 'dart:io';
import 'package:artgig/Common/Splash/Controller/splash_controller.dart';
import 'package:artgig/Utils/app_constants.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_route_name.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/custom_auth_scaffold.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_padding.dart';
import '../../Auth/Controller/auth_controller.dart';
import '../../Role_Selection/Controller/role_controller.dart';
import '../../TermsPrivacy/routing_argument/content_routing_argument.dart';

class PreLoginScreen extends StatelessWidget {
  PreLoginScreen({
    Key? key,
  }) : super(key: key);

  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
        isLeading: false,
        title: AppStrings.LOGIN,
        child: CustomPadding(
          child: Column(children: [
            if (RoleController.isArtist()) ...[
              _loginWithButton(
                  title: AppStrings.LOGIN_WITH_PHONE,
                  iconPath: AssetPaths.PHONE_ICON,
                  fontColor: AppColors.BLACK_COLOR,
                  bgColor: AppColors.YELLOW_COLOR,
                  context: context,
                  onTap: () {
                    authController.clearAllAuthControllerData();
                    AppNavigation.navigateTo(
                        context, AppRouteName.PHONE_LOGIN_SCREEN_ROUTE);
                  }),
            ],
            if (!RoleController.isArtist()) ...[
              _loginWithButton(
                  title: AppStrings.LOGIN_WITH_EMAIL,
                  iconPath: AssetPaths.EMAIL_ICON,
                  context: context,
                  bgColor: AppColors.PINK_COLOR,
                  onTap: () {
                    authController.clearAllAuthControllerData();
                    AppNavigation.navigateTo(
                        context, AppRouteName.EMAIL_LOGIN_SCREEN_ROUTE);
                  }),
            ],
            //!-----Closed Bcz Client Requirment
            // _loginWithButton(
            //     title: AppStrings.LOGIN_WITH_EMAIL,
            //     iconPath: AssetPaths.EMAIL_ICON,
            //     context: context,
            //     bgColor: AppColors.PINK_COLOR,
            //     onTap: () {
            //       authController.clearAllAuthControllerData();
            //       AppNavigation.navigateTo(
            //           context, AppRouteName.EMAIL_LOGIN_SCREEN_ROUTE);
            //     }),
            // 10.ph,
            // _loginWithButton(
            //     title: AppStrings.LOGIN_WITH_PHONE,
            //     iconPath: AssetPaths.PHONE_ICON,
            //     fontColor: AppColors.BLACK_COLOR,
            //     bgColor: AppColors.YELLOW_COLOR,
            //     context: context,
            //     onTap: () {
            //       authController.clearAllAuthControllerData();

            //       AppNavigation.navigateTo(
            //           context, AppRouteName.PHONE_LOGIN_SCREEN_ROUTE);
            //     }),
            // 10.ph,
            // _loginWithButton(
            //     title: AppStrings.LOGIN_WITH_GOOGLE,
            //     iconPath: AssetPaths.GOOGLE_ICON,
            //     bgColor: AppColors.RED_COLOR,
            //     context: context,
            //     onTap: () {
            //       AppNavigation.navigateToRemovingAll(
            //           context, AppRouteName.MAIN_MENU_SCREEN);
            //       // FirebaseAuthBloc().signInWithGoogle(
            //       //   context: context,
            //       // );
            //     }),
            // 10.ph,
            // if (Platform.isIOS) ...[
            //   _loginWithButton(
            //       title: AppStrings.LOGIN_WITH_APPLE,
            //       iconPath: AssetPaths.APPLE_ICON,
            //       bgColor: AppColors.WHITE_COLOR,
            //       fontColor: AppColors.BLACK_COLOR,
            //       context: context,
            //       onTap: () {
            //         // FirebaseAuthBloc().signInWithApple(
            //         //   context: context,
            //         // );
            //       }),
            //   10.ph,
            // ],

            90.ph,
            _termsAndPrivacyNavigationWidget(context),
            20.ph,
          ]),
        ));
  }

  Widget _loginWithButton(
      {required BuildContext context,
      required String title,
      required String iconPath,
      required Color bgColor,
      Color? fontColor,
      Color? borderColor,
      required Function() onTap}) {
    return CustomButton(
        containerColor: bgColor,
        title: title,
        iconPath: iconPath,
        haveIconOnLeft: true,
        fontColor: fontColor ?? AppColors.WHITE_COLOR,
        fontFamily: AppFonts.JONES_MEDIUM,
        fontSize: 16.sp,
        borderRadius: 50.0,
        verticalPadding: 12.h,
        borderColor: borderColor ?? AppColors.TRANSPARENT_COLOR,
        haveIcon: true,
        onTap: onTap);
  }

  Widget _termsAndPrivacyNavigationWidget(BuildContext context) {
    TextStyle linkStyle = TextStyle(
      color: Constants.primaryTextThemeColor(context: context),
      decoration: TextDecoration.underline,
      fontSize: 15.sp,
      fontFamily: AppFonts.JONES_BOLD,
    );
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            height: 2,
            color: Constants.primaryTextThemeColor(context: context),
          ),
          children: <TextSpan>[
            TextSpan(
                text: AppStrings.BY_SIGN_AGREE,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: AppFonts.JONES_MEDIUM,
                )),
            TextSpan(
                text: AppStrings.TERMS_AND_CONDITION,
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigation.navigateTo(
                        context, AppRouteName.CONTENT_SCREEN_ROUTE,
                        arguments: ContentRoutingArgument(
                            title: AppStrings.TERMS_AND_CONDITION,
                            contentType: AppStrings.termsAndConditionType));
                  }),
            TextSpan(
                text: ' & ',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: AppFonts.JONES_BOLD,
                )),
            TextSpan(
                text: AppStrings.PRIVACY_POLICY,
                style: linkStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigation.navigateTo(
                        context, AppRouteName.CONTENT_SCREEN_ROUTE,
                        arguments: ContentRoutingArgument(
                            title: AppStrings.PRIVACY_POLICY,
                            contentType: AppStrings.privacyPolicyType));
                  }),
          ],
        ),
      ),
    );
  }
}
