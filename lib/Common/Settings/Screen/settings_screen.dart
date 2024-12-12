import 'package:artgig/Common/Settings/Screen/support_help.dart';
import 'package:artgig/Module/PaymentCard/Screen/payment_method_screen.dart';
import 'package:artgig/Utils/app_constants.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_dialogs.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_route_name.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/cs_switch_button.dart';
import '../../../Widgets/custom_button.dart';
import '../../Splash/Controller/splash_controller.dart';
import '../../TermsPrivacy/routing_argument/content_routing_argument.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isNotificationOn = true;

  var selectedItem = '';

  List<Widget> settingDataList = [
    SettingWidget(
        title: AppStrings.PRIVACY_POLICY,
        onTap: () {
          AppNavigation.navigateTo(Constants.navigatorKey.currentContext!,
              AppRouteName.CONTENT_SCREEN_ROUTE,
              arguments: ContentRoutingArgument(
                  title: AppStrings.PRIVACY_POLICY,
                  contentType: AppStrings.privacyPolicyType));
        }),
    SettingWidget(
        title: AppStrings.ABOUT_US,
        onTap: () {
          AppNavigation.navigateTo(Constants.navigatorKey.currentContext!,
              AppRouteName.CONTENT_SCREEN_ROUTE,
              arguments: ContentRoutingArgument(
                  title: AppStrings.ABOUT_US,
                  contentType: AppStrings.privacyPolicyType));
        }),
    SettingWidget(
        title: AppStrings.TERMS_AND_CONDITION,
        onTap: () {
          AppNavigation.navigateTo(Constants.navigatorKey.currentContext!,
              AppRouteName.CONTENT_SCREEN_ROUTE,
              arguments: ContentRoutingArgument(
                  title: AppStrings.TERMS_AND_CONDITION,
                  contentType: AppStrings.termsAndConditionType));
        }),
    SettingWidget(
        title: AppStrings.paymentDetails,
        onTap: () {
          Get.to(() => PaymentMethodsScreen(
                isFromOrderPage: false,
              ));
        }),
    SettingWidget(
        title: AppStrings.SUPPORT_HELP,
        onTap: () {
          Get.to(() => SupportHelpScreen());
        }),
    SettingWidget(
        title: AppStrings.DELETE_ACCOUNT,
        onTap: () {
          AppDialogs().showOptionsDialog(
              headertitle: AppStrings.DELETE,
              title:
                  '${AppStrings.ARE_YOU_SURE} \n${AppStrings.DELETE_ACCOUNT.toLowerCase()}?',
              haveTwoButton: true,
              b1Text: AppStrings.YES,
              b2Text: AppStrings.NO,
              imagePath: AssetPaths.DELETE_ICON,
              b1onTap: () {
                AppNavigation.navigateToRemovingAll(
                    Constants.navigatorKey.currentContext,
                    AppRouteName.ROLE_SELECTION_SCREEN_ROUTE);
              },
              b2onTap: () {
                AppNavigation.navigatorPop(
                    Constants.navigatorKey.currentContext!);
              },
              context: Constants.navigatorKey.currentContext);
        }),
    SettingWidget(
        title: AppStrings.LOGOUT,
        onTap: () {
          AppDialogs().showOptionsDialog(
              headertitle: AppStrings.LOGOUT,
              title: '${AppStrings.ARE_YOU_SURE} \n logout?',
              haveTwoButton: true,
              b1Text: AppStrings.CANCEL,
              b2Text: AppStrings.LOGOUT,
              imagePath: AssetPaths.LOGOUT_ICON,
              b1onTap: () {
                AppNavigation.navigatorPop(
                    Constants.navigatorKey.currentContext!);
              },
              b2onTap: () {
                AppNavigation.navigateToRemovingAll(
                    Constants.navigatorKey.currentContext!,
                    AppRouteName.ROLE_SELECTION_SCREEN_ROUTE);
              },
              context: Constants.navigatorKey.currentContext);
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 8.0),
          decoration: BoxDecoration(
              color: AppColors.LIGHT_GREY_COLOR,
              borderRadius: BorderRadius.circular(50.r)),
          child: CustomSwitchButtonWidget(
            isSwitch: _isNotificationOn,
            // (SplashController.i.currentUser.value?.notification ==
            //         0)
            //     ? false
            //     : true,
            onToggle: (value) {
              // SetNotificationBloc().setNotificationBlocMethod(
              //     context: context,
              //     isNotificationOn: value == true ? 1 : 0,
              //     setProgressBar: () {
              //       AppDialogs.progressAlertDialog(context: context);
              //     });
              setState(() {
                _isNotificationOn = !_isNotificationOn;
                _isNotificationOn
                    ? AppDialogs.showToast(message: AppStrings.NOTIFICATION_ON)
                    : AppDialogs.showToast(
                        message: AppStrings.NOTIFICATION_OFF);
              });
            },
            title: AppStrings.NOTIFICATIONS,
            activeColor: AppColors.BLACK_COLOR,
            fontColor: AppColors.BLACK_COLOR,
            fontSize: 15.sp,
            fontFamily: AppFonts.JONES_BOLD,
          ),
        ),
        8.ph,
        //!----Dark Theme
        Container(
          padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 8.0),
          decoration: BoxDecoration(
              color: AppColors.LIGHT_GREY_COLOR,
              borderRadius: BorderRadius.circular(50.r)),
          child: CustomSwitchButtonWidget(
            isSwitch: Constants.isDarkTheme(context: context),
            // (SplashController.i.currentUser.value?.notification ==
            //         0)
            //     ? false
            //     : true,
            onToggle: (value) {
              SplashController.i.toggleTheme(value);
            },
            title: 'Dark Theme',
            activeColor: AppColors.BLACK_COLOR,
            fontColor: AppColors.BLACK_COLOR,
            fontSize: 15.sp,
            fontFamily: AppFonts.JONES_BOLD,
          ),
        ),
        8.ph,
        Expanded(
            child: ListView.builder(
          itemCount: settingDataList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: settingDataList[index],
            );
          },
        )),
        10.ph,
      ],
    );
  }

  Widget settingWidget(
      {required String title, required void Function() onTap, bool? isIcon}) {
    return CustomButton(
      title: title,
      haveIcon: isIcon ?? true,
      iconPath: AssetPaths.FORWARD_ARROW_ICON,
      containerColor: Constants.isDarkTheme(context: context)
          ? AppColors.BLACK_COLOR
          : AppColors.PINK_COLOR,
      borderColor: Constants.isDarkTheme(context: context)
          ? AppColors.WHITE_COLOR
          : AppColors.TRANSPARENT_COLOR,
      onTap: onTap,
    );
  }
}

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: title,
      haveIcon: true,
      iconPath: AssetPaths.FORWARD_ARROW_ICON,
      containerColor: Constants.isDarkTheme(context: context)
          ? AppColors.BLACK_COLOR
          : AppColors.PINK_COLOR,
      borderColor: Constants.isDarkTheme(context: context)
          ? AppColors.WHITE_COLOR
          : AppColors.TRANSPARENT_COLOR,
      onTap: onTap,
    );
  }
}
