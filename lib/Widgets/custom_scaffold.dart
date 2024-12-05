import 'package:artgig/Utils/app_constants.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key,
      this.bottomNavigationBar,
      this.appBar,
      this.body,
      this.extendedBoy,
      this.resizeToAvoidBottomInset,
      this.bottomNavBarPadding,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.scffoldKey,
      this.drawer,
      this.scffoldBg,
      this.horizontalPadding});
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final double? horizontalPadding;
  final EdgeInsetsGeometry? bottomNavBarPadding;
  final bool? extendedBoy;
  final bool? resizeToAvoidBottomInset;
  final Widget? body;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final GlobalKey<ScaffoldState>? scffoldKey;
  final Color? scffoldBg;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            color: Constants.isDarkTheme(context: context)
                ? AppColors.BLACK_COLOR
                : null,
            image: Constants.isDarkTheme(context: context)
                ? null
                : const DecorationImage(
                    image: AssetImage(AssetPaths.BACKGROUNG_LIGHT_MODE_IMAGES),
                    fit: BoxFit.fill)),
        child: Scaffold(
          drawerScrimColor: AppColors.TRANSPARENT_COLOR,
          key: scffoldKey,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButton: floatingActionButton,
          extendBody: extendedBoy ?? false,
          drawer: drawer,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
          bottomNavigationBar: bottomNavigationBar != null
              ? Padding(
                  padding: bottomNavBarPadding ??
                      EdgeInsets.symmetric(
                        horizontal: 0.04.sw,
                      ),
                  child: bottomNavigationBar)
              : null,
          appBar: appBar,
          backgroundColor: scffoldBg ?? AppColors.TRANSPARENT_COLOR,
          body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding ?? 0.04.sw),
                child: body),
          ),
        ),
      ),
    );
  }
}
