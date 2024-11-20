// import 'dart:io';

// import 'package:cosmetologist/custom_widgets/custom_text.dart';
// import 'package:cosmetologist/utils/app_colors.dart';
// import 'package:cosmetologist/utils/app_fonts.dart';
// import 'package:cosmetologist/utils/app_navigation.dart';
// import 'package:cosmetologist/utils/app_strings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// class ImageGalleryClass {
//   ImagePicker picker = ImagePicker();
//   XFile? getFilePath;
//   CroppedFile? croppedImageFile;
//   File? imageFile;

//   Map<String, dynamic>? imageGalleryBottomSheet(
//       {required BuildContext context,
//       required ValueChanged<String?> onMediaChanged,
//       bool? multiImage = true,
//       bool? showFile = false}) {
//     showModalBottomSheet(
//         shape: RoundedRectangleBorder(
//           // <-- SEE HERE
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(18.r),
//           ),
//         ),
//         context: context,
//         builder: (_) {
//           return Container(
//             decoration: BoxDecoration(
//                 // color: AppColors.whiteColor,
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(18.r),
//                     topLeft: Radius.circular(18.r))),
//             child: SafeArea(
//               child: Wrap(children: <Widget>[
//                 GestureDetector(
//                   onTap: () {
//                     getCameraImage(
//                         onMediaChanged: onMediaChanged, context: context);
//                   },
//                   child: Container(
//                     color: Colors.transparent,
//                     padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 15.0,
//                         ),
//                         Icon(
//                           Icons.camera_enhance,
//                           color: AppColors.brownColor,
//                         ),
//                         SizedBox(
//                           width: 15.0,
//                         ),
//                         CustomText(
//                           text: AppStrings.camera,
//                           fontColor: AppColors.brownColor,
//                           fontSize: 18.0,
//                           fontFamily: AppFonts.openSansMedium,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 const Divider(
//                   color: AppColors.brownColor,
//                   height: 1.0,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     multiImage == true
//                         ? getGalleryMultiImage(
//                             onMediaChanged: onMediaChanged, context: context)
//                         : getGalleryImage(
//                             onMediaChanged: onMediaChanged, context: context);
//                   },
//                   child: Container(
//                     color: Colors.transparent,
//                     padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 15.0,
//                         ),
//                         Icon(
//                           Icons.image,
//                           color: AppColors.brownColor,
//                         ),
//                         SizedBox(
//                           width: 15.0,
//                         ),
//                         CustomText(
//                           text: AppStrings.gallery,
//                           fontColor: AppColors.brownColor,
//                           fontSize: 18.0,
//                           fontFamily: AppFonts.openSansMedium,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ]),
//             ),
//           );
//         });
//     return null;
//   }

//   void getCameraImage(
//       {required ValueChanged<String?> onMediaChanged,
//       BuildContext? context}) async {
//     try {
//       final imagePicker = ImagePicker();
//       final pickedFile = await imagePicker.getImage(source: ImageSource.camera);

//       if (pickedFile != null) {
//         onMediaChanged(pickedFile.path);
//       }
//       AppNavigation.navigatorPop(context!);
//     } on PlatformException {
//       //  CustomToast.s
//     }
//   }

//   void getGalleryImage({
//     required ValueChanged<String?> onMediaChanged,
//     BuildContext? context,
//   }) async {
//     try {
//       AppNavigation.navigatorPop(context!);
//       XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

//       if (image != null) {
//         onMediaChanged(image.path);
//       }
//     } on PlatformException {
//       // Handle exception
//     }
//   }

//   void getGalleryMultiImage(
//       {required ValueChanged<String?> onMediaChanged,
//       BuildContext? context}) async {
//     try {
//       AppNavigation.navigatorPop(context!);
//       List<XFile>? images = await ImagePicker().pickMultiImage();

//       for (var image in images) {
//         onMediaChanged(image.path);
//       }
//     } on PlatformException {
//       // AppDialogs.showToast(
//       //     message: e.message ?? AppStrings.SOMETHING_WENT_WRONG_ERROR);
//     }
//   }

//   void getMultipleImages(
//       {required ValueChanged<List<String?>?> onMediaChanged,
//       required BuildContext context}) async {
//     try {
//       List<XFile> multiImages = await picker.pickMultiImage(imageQuality: 80);
//       List<String> multiImagesPath = [];
//       if (multiImages.length > 0) {
//         for (int i = 0; i < multiImages.length; i++) {
//           multiImagesPath.add(multiImages[i].path);
//         }
//       }
//       onMediaChanged(multiImagesPath);
//       AppNavigation.navigatorPop(context);
//     } on PlatformException {
//       // AppDialogs.showToast(
//       //     message: e.message ?? AppStrings.SOMETHING_WENT_WRONG_ERROR);
//     }
//   }

//   void cropImage(
//       {String? imageFilePath,
//       BuildContext? context,
//       required ValueChanged<List<String?>?> onMediaChanged}) async {
//     croppedImageFile = await ImageCropper().cropImage(
//       sourcePath: imageFilePath!,
//       aspectRatioPresets: [
//         CropAspectRatioPreset.square,
//         CropAspectRatioPreset.ratio3x2,
//         CropAspectRatioPreset.original,
//         CropAspectRatioPreset.ratio4x3,
//         CropAspectRatioPreset.ratio16x9
//       ],
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: "Edit Photo",
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//       ],
//     );
//     //if image cropped then set object
//     if (croppedImageFile != null) {
//       onMediaChanged([File(croppedImageFile!.path).path]);
//     } else {
//       onMediaChanged([]);
//     }
//     AppNavigation.navigatorPop(context!);
//   }
// }
