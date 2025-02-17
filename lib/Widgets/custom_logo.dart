import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/asset_paths.dart';

class CustomLogo extends StatelessWidget {
  final void Function()? onTap;
  final double? height, width;
  const CustomLogo({Key? key, this.onTap, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Image.asset(AssetPaths.LOGO1_ICON,
            height: height ?? 180.w, width: width ?? 220.w));
  }
}
