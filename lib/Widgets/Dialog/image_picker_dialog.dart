
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_dialogs.dart';
import '../../Utils/app_fonts.dart';
import '../../Utils/app_strings.dart';
import '../../Utils/permission_manager.dart';
import '../custom_alert_dialog.dart';
import '../custom_button.dart';

class ImagePickerDialog extends StatelessWidget {
  ImagePickerDialog(
      {super.key,
      required this.pickedImagePathCallback,
      required this.isMultiPicked});

  final Function(String) pickedImagePathCallback;
  final bool isMultiPicked;

  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      headerText: AppStrings.SELECT_MEDIA,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            20.ph,
            CustomButton(
              containerColor: AppColors.PINK_COLOR,
              title: AppStrings.CAMERA,
              // fontFamily: AppFonts.AVERIA_REGULAR,
              fontFamily: AppFonts.MONTSERRAT_MEDIUM,
              fontSize: 14.sp,
              haveIcon: false,
              onTap: () async {
                final permission =
                    await PermissionManager().requestCameraPermission();

                if (permission == PermissionState.granted) {
                  Navigator.pop(context);
                  final pickedImageFile =
                      await picker.pickImage(source: ImageSource.camera);

                  if (pickedImageFile != null) {
                    pickedImagePathCallback(pickedImageFile.path);
                  }
                }
              },
            ),
            Padding(padding: EdgeInsets.only(top: 0.04.sw)),
            CustomButton(
              containerColor: AppColors.PINK_COLOR,
              title: AppStrings.GALLERY,
              fontFamily: AppFonts.MONTSERRAT_MEDIUM,
              fontSize: 14.sp,
              haveIcon: false,
              onTap: () async {
                // final permission = await PermissionManager()
                //     .requestPhotoAndStoragePermission();

                // log(permission.toString());
                // if (permission == PermissionState.granted) {

                // }
                Navigator.pop(context);
                if (isMultiPicked) {
                  List<XFile>? pickedMultimediaFile =
                      await ImagePicker().pickMultipleMedia();

                  if (pickedMultimediaFile.length <= 5) {
                    for (var image in pickedMultimediaFile) {
                      String mimeType = lookupMimeType(image.path) ?? '';
                      if (mimeType.startsWith('image')) {
                        pickedImagePathCallback(image.path);
                      } else if (mimeType.startsWith('video')) {
                        // pickedImagePathCallback(image.path);
                        AppDialogs.showToast(message: 'Upload only Images');
                      } else {
                        // AppDialogs.showToast(message: 'Unsupported Media Type');
                      }
                    }
                  } else {
                    // AppDialogs.showToast(
                    //     message: AppStrings.UPLOAD_IMAGE_VIDEO_LIMIT);
                  }
                } else {
                  final pickedImageFile =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (pickedImageFile != null) {
                    pickedImagePathCallback(pickedImageFile.path);
                  }
                }
              },
            ),
            20.ph,
          ],
        ),
      ),
    );
  }
}
