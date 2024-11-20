import 'package:flutter/material.dart';

class AppNavigation {
  static void navigateToRemovingAll(context, String routeName,
      {Object? arguments}) async {
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static void navigateTo(BuildContext context, String routeName,
      {Object? arguments}) async {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static Future<dynamic> navigateAndReturn(
      BuildContext context, String routeName,
      {Object? arguments}) async {
    await Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateReplacement(BuildContext context, String routeName,
      {Object? arguments}) async {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void navigatorPop(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigateCloseDialog(BuildContext context) async {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static void navigatorPopUnitl(BuildContext context, String routeName) {
    Navigator.popUntil(context, (route) {
      return route.settings.name == routeName;
    });
  }
}
