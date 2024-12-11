import 'package:artgig/Module/MainMenu/Screen/main_menu_screen.dart';
import 'package:flutter/material.dart';

import '../Common/Auth/Screens/Setup_Profile/create_edit_profile_screen.dart';
import '../Common/Auth/Screens/login_with_email_screen.dart';
import '../Common/Auth/Screens/login_with_phone_screen.dart';
import '../Common/Auth/Screens/verification_screen.dart';
import '../Common/Pre_Login/Screens/pre_login_screen.dart';
import '../Common/Role_Selection/Screens/role_selection_screen.dart';
import '../Common/Splash/Screens/splash_screen.dart';
import '../Common/TermsPrivacy/routing_argument/content_routing_argument.dart';
import '../Common/TermsPrivacy/screens/content_screen.dart';
import 'app_route_name.dart';
import 'app_routing_arguments.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) {
          switch (routeSettings.name) {
            case AppRouteName.SPLASH_SCREEN_ROUTE:
              return const SplashScreen();
            case AppRouteName.ROLE_SELECTION_SCREEN_ROUTE:
              return RoleSelectionScreen();
            case AppRouteName.PRE_LOGIN_SCREEN_ROUTE:
              return PreLoginScreen();
            case AppRouteName.CONTENT_SCREEN_ROUTE:
              ContentRoutingArgument? contentRoutingArgument =
                  routeSettings.arguments as ContentRoutingArgument?;
              return ContentScreen(
                contentType: contentRoutingArgument?.contentType ?? "",
                title: contentRoutingArgument?.title ?? "",
              );
            case AppRouteName.EMAIL_LOGIN_SCREEN_ROUTE:
              return const LoginWithEmailScreen();
            case AppRouteName.PHONE_LOGIN_SCREEN_ROUTE:
              return const LoginWithPhoneScreen();
            case AppRouteName.VERIFICATION_SCREEN_ROUTE:
              OtpVerificationArguments? otpRoutingArgument =
                  routeSettings.arguments as OtpVerificationArguments?;
              return Otp(
                userId: otpRoutingArgument?.userId ?? '0',
                phoneNumber: otpRoutingArgument?.phoneNumber ?? '0',
                phoneVerificationId:
                    otpRoutingArgument?.phoneVerificationId ?? '0',
              );
            case AppRouteName.CREATE_EDIT_PROFILE_SCREEN_ROUTE:
              CreateEditProfileArguments? createEditProfileArguments =
                  routeSettings.arguments as CreateEditProfileArguments?;
              return CreateEditProfileScreen(
                isFromEdit: createEditProfileArguments?.isFromEdit ?? false,
              );
            case AppRouteName.MAIN_MENU_SCREEN:
              return  MainMenuScreen();
           

            default:
              return Container();
          }
        });
  }
}
