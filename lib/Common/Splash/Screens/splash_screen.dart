import 'package:artgig/Utils/extensions.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/custom_logo.dart';
import '../../../Widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: 1.sw,
            height: 1.sh,
            decoration: const BoxDecoration(color: AppColors.WHITE_COLOR),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                        Theme.of(context).brightness == Brightness.dark
                            ? AssetPaths.BACKGROUNG_DARK_SPLASH_IMAGE
                            : AssetPaths.BACKGROUNG_LIGHT_SPLASH_IMAGE),
                    fit: BoxFit.fill,
                  )),
                ),
                Align(alignment: Alignment.center, child: _centerLogo()),
              ],
            )),
      ),
    );
  }

  Widget _centerLogo() {
    return Entry.scale(
      curve: Curves.easeIn,
      duration: const Duration(seconds: 2),
      child: _appLogo(),
    );
  }

  Widget _appLogo() {
    return CustomLogo(
      height: 210.w,
      width: 280.w,
      onTap: () {},
    );
  }
}
