import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/app_constants.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_route_name.dart';

class SplashController extends GetxController {
  static SplashController get i => Get.find();
  // final RoleController roleController =
  //     Get.put(RoleController(), permanent: true);
  // Rxn<UserDataModel> currentUser = Rxn(null);
  @override
  void onInit() async {
    // initShared();
    splashTimer();
    // await TimeZoneService().localTimeZone;
    super.onInit();
  }

  void splashTimer() {
    Timer(
      const Duration(seconds: 3),
      () {
        // loadCurrentUserFromSharedPreference(context: Get.context!);
        // _validateUser();
        AppNavigation.navigateTo(
            Get.context!, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
      },
    );
  }

  // Future<void> initShared() async {
  //   await SharedPreference().sharedPreference;
  // }

  // Future<void> loadCurrentUserFromSharedPreference(
  //     {required BuildContext context}) async {
  //   final userJson = SharedPreference().getUser();
  //   //!--Check if user is not null
  //   try {
  //     if (userJson != null) {
  //       log('User Data $userJson');
  //       //!--Decode the saved user response
  //       final jsonResponse = jsonDecode(userJson);
  //       //!--Now replace the saved user response with the OTPUserResponseModel
  //       final UserDataModel? _currentUser =
  //           UserDataModel.fromJson(jsonResponse);
  //       //!--Check the current User is not null
  //       currentUser.value = _currentUser;

  //       roleController.setRole(comingRole: currentUser.value?.role);

  //       //!-- Check if User Profile Completed

  //       if (_currentUser?.isProfileCompleted.toString() == '1') {
  //         // SocketService.instance!.commonConnectSocket();
  //         log('Inside that');
  //         AppNavigation.navigateToRemovingAll(
  //           context,
  //           AppRouteName.MAIN_MENU_SCREEN_ROUTE,
  //         );
  //       } else {
  //         print('User Profile Not Completed');
  //         AppNavigation.navigateToRemovingAll(
  //             context, AppRouteName.ROLE_SELECTION_SCREEN_ROUTE);
  //       }
  //     } else {
  //       AppNavigation.navigateToRemovingAll(
  //           context, AppRouteName.ROLE_SELECTION_SCREEN_ROUTE);
  //     }
  //   } catch (e) {
  //     print(e);
  //     print("Catch Error");
  //     AppNavigation.navigateToRemovingAll(
  //         context, AppRouteName.ROLE_SELECTION_SCREEN_ROUTE);
  //   }
  // }

  // void _validateUser() async {
  //   NotificationNavigationClass _notificationNavigationClass =
  //       NotificationNavigationClass();
  //   try {
  //     await SharedPreference().sharedPreference;
  //     await FirebaseMessagingService().initializeNotificationSettings();

  //     _setNotifications();
  //   } catch (error) {
  //     _notificationNavigationClass.clearAppDataMethod(context: Get.context!);
  //   }
  // }

  // void _setNotifications() async {
  //   FirebaseMessagingService().foregroundNotification();
  //   FirebaseMessagingService().backgroundTapNotification();
  // }

  //!----Theme

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    update();
  }
}
