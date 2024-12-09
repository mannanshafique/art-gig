import 'package:artgig/Common/Auth/Screens/Setup_Profile/create_edit_profile_screen.dart';
import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Common/Auth/Screens/Setup_Profile/pre_login_test.dart';
import 'Common/Chat/Screen/chat_screen.dart';
import 'Common/Notifications/Screens/notification_screen.dart';
import 'Common/Pre_Login/Screens/pre_login_screen.dart';
import 'Common/Splash/Controller/splash_controller.dart';
import 'Common/Splash/Screens/splash_screen.dart';
import 'Module/Event/Model/event_model.dart';
import 'Module/Event/Screen/event_details_screen.dart';
import 'Module/Event/Screen/event_listing.dart';
import 'Module/Event/Screen/host_profile.dart';
import 'Module/MainMenu/Screen/main_menu_screen.dart';
import 'Module/Shop/Screen/product_listing.dart';
import 'Utils/app_colors.dart';
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
                    // onGenerateRoute: AppRouter.onGenerateRoute,
                    home: ProductListScreen()
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

// class MyApp extends StatelessWidget {
//   final ValueNotifier<ThemeMode> _themeNotifier =
//       ValueNotifier(ThemeMode.light);

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<ThemeMode>(
//       valueListenable: _themeNotifier,
//       builder: (context, currentTheme, child) {
//         return MaterialApp(
//           title: 'Login Screen',
//           theme: ThemeData(
//             brightness: Brightness.light,
//             primaryColor: Colors.pink,
//             inputDecorationTheme: InputDecorationTheme(
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           darkTheme: ThemeData(
//             brightness: Brightness.dark,
//             primaryColor: Colors.pink,
//             inputDecorationTheme: InputDecorationTheme(
//               filled: true,
//               fillColor: Colors.black54,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           themeMode: currentTheme,
//           home: LoginScreen(toggleTheme: () {
//             _themeNotifier.value = _themeNotifier.value == ThemeMode.light
//                 ? ThemeMode.dark
//                 : ThemeMode.light;
//           }),
//         );
//       },
//     );
//   }
// }

// class LoginScreen extends StatelessWidget {
//   final VoidCallback toggleTheme;

//   const LoginScreen({required this.toggleTheme});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'assets/background_${Theme.of(context).brightness == Brightness.dark ? "dark" : "light"}.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Image.asset(
//               //   'assets/logo.png',
//               //   height: 120,
//               // ),
//               SizedBox(height: 20),
//               Text(
//                 'Login',
//                 style: TextStyle(
//                   fontSize: 24,
//                   color: Theme.of(context).textTheme.bodyLarge?.color,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20),
//               TextField(
//                 decoration: InputDecoration(
//                   prefixIcon:
//                       Icon(Icons.email, color: Theme.of(context).primaryColor),
//                   hintText: 'jane.william@gmail.com',
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Theme.of(context).primaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Center(
//                     child: Text(
//                       'Next',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               Spacer(),
//               Text(
//                 'By signing up you agree to our\nTerms & Conditions & Privacy Policy',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Theme.of(context).textTheme.bodySmall?.color,
//                 ),
//               ),
//               SizedBox(height: 10),
//               IconButton(
//                 icon: Icon(Icons.light_mode),
//                 onPressed: toggleTheme,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CreateProfileScreen extends StatelessWidget {
//   final VoidCallback toggleTheme;

//   const CreateProfileScreen({super.key, required this.toggleTheme});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon:
//               Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
//           onPressed: () {},
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'assets/background_${Theme.of(context).brightness == Brightness.dark ? "dark" : "light"}.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             children: [
//               SizedBox(height: 20),
//               IconButton(
//                 icon: Icon(Icons.light_mode),
//                 onPressed: toggleTheme,
//               ),
//               Text(
//                 'Create Profile',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).textTheme.bodyText1?.color,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage:
//                         AssetImage('assets/profile_placeholder.png'),
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Theme.of(context).primaryColor,
//                     radius: 18,
//                     child:
//                         Icon(Icons.camera_alt, color: Colors.white, size: 18),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Expanded(
//                 child: ListView(
//                   children: [
//                     _buildTextField(context, hint: 'Full Name'),
//                     SizedBox(height: 10),
//                     _buildTextField(context, hint: 'Email'),
//                     SizedBox(height: 10),
//                     _buildTextField(context, hint: 'Phone Number'),
//                     SizedBox(height: 10),
//                     _buildTextField(context, hint: 'Location'),
//                     SizedBox(height: 10),
//                     _buildTextField(context, hint: 'Date Of Birth'),
//                     SizedBox(height: 10),
//                     _buildTextField(context, hint: 'Gender'),
//                     SizedBox(height: 10),
//                     _buildTextField(context, hint: 'Hourly Rate'),
//                     SizedBox(height: 10),
//                     _buildTextField(context, hint: 'Write Your Bio...'),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Theme.of(context).primaryColor,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: Center(
//                           child: Text(
//                             'Next',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(BuildContext context, {required String hint}) {
//     return TextField(
//       decoration: InputDecoration(
//         hintText: hint,
//         hintStyle: TextStyle(color: Theme.of(context).hintColor),
//         filled: true,
//         fillColor: Theme.of(context).brightness == Brightness.dark
//             ? Colors.black54
//             : Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
// }
