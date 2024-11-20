import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_dialogs.dart';
import '../Utils/asset_paths.dart';
import 'extended_image_widget.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    this.selectedImgPath,
    this.setImage,
    this.isViewOnly,
    this.radius,
    this.borderColor,
    super.key,
  });
  final String? selectedImgPath;
  final Function(String)? setImage;
  final bool? isViewOnly;
  final double? radius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius ?? 0.15.sh,
      width: radius ?? 0.15.sh,
      decoration: BoxDecoration(
          color: AppColors.WHITE_COLOR,
          border:
              Border.all(color: borderColor ?? AppColors.WHITE_COLOR, width: 3),
          shape: BoxShape.circle),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipOval(
            child: CustomExtendedImageWidget(
              imagePlaceholder: AssetPaths.PROFILE_ICON,
              imagePath: selectedImgPath,
              imageType: selectedImgPath!.startsWith('uploads')
                  ? MediaPathType.NETWORK.name
                  : MediaPathType.FILE.name,
              fit: selectedImgPath == '' ? BoxFit.contain : BoxFit.cover,
            ),
          ),
          isViewOnly == true
              ? const SizedBox.shrink()
              : GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    AppDialogs().showImagePickerDialog(
                        isMultiPicked: false,
                        context: context,
                        pickedImagePathCallback: setImage ?? (value) {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.BLACK_COLOR.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Image.asset(
                      AssetPaths.CAMERA_ICON,
                      scale: 4,
                      color: AppColors.WHITE_COLOR,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class CustomCicrleAvatarWidget extends StatelessWidget {
  const CustomCicrleAvatarWidget(
      {this.imgPath, this.radius, this.isExtendedImage, this.circularColor});
  final String? imgPath;
  final double? radius;
  final Color? circularColor;
  final bool? isExtendedImage;

  @override
  Widget build(BuildContext context) {
    // log(NetworkStrings.NETWORK_IMAGE_BASE_URL + (imgPath ?? ''));
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: circularColor ?? AppColors.BLACK_COLOR,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      height: radius ?? 48.h,
      width: radius ?? 48.h,
      padding: EdgeInsets.all(2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isExtendedImage == true
            ? CustomExtendedImageWidget(
                imagePlaceholder: AssetPaths.PROFILE_ICON,
                imagePath: (imgPath ?? ''),
                imageType: MediaPathType.NETWORK.name,
                fit: BoxFit.cover,
              )
            : Image.asset(
                imgPath ?? '',
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
