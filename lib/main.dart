import 'package:artgig/Common/Role_Selection/Controller/role_controller.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Common/Splash/Controller/splash_controller.dart';
import 'Utils/app_constants.dart';
import 'Utils/app_routers.dart';
import 'Utils/app_size.dart';
import 'Utils/app_theme.dart';

//!-------Flutter Version 3.16.3

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final splashPermanentController =
      Get.put(SplashController(), permanent: true);

  final RoleController roleController = Get.put(RoleController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:
            const Size(AppSize.FULL_SCREEN_WIDTH, AppSize.FULL_SCREEN_HEIGHT),
        builder: (context, child) {
          return GetBuilder<SplashController>(
              init: SplashController(),
              builder: (splashController) {
                return GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Art-Gig',
                    navigatorKey: Constants.navigatorKey,
                    scrollBehavior: CustomScrollBehavior(),
                    themeMode: splashController.themeMode,
                    theme: AppThemes.lightTheme,
                    darkTheme: AppThemes.darkTheme,
                    onGenerateRoute: AppRouter.onGenerateRoute,
                    // home: StudioListing()
                    // home: MainMenuScreen()
                    );
              });
        });
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// Switch(
//               value: SplashController.i.isDarkMode,
//               onChanged: (value) {
//                 SplashController.i.toggleTheme(value);
//               },
//             ),

//  pod deintegrate
// pod repo update
// pod install
