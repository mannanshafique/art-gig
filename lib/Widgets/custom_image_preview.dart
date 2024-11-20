import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_network_strings.dart';

class ImagePreviewWidget extends StatefulWidget {
  final List<ImageModel>? imagePaths;
  final Map<String, dynamic>? imagesMap;
  final bool? isCameraIconVisible,
      isGalleryIconVisible,
      showRowSlider,
      isFromEdit;

  const ImagePreviewWidget(
      {Key? key,
      this.imagePaths,
      this.imagesMap,
      this.showRowSlider = true,
      this.isFromEdit = false,
      this.isCameraIconVisible = true,
      this.isGalleryIconVisible = true})
      : super(key: key);

  @override
  State<ImagePreviewWidget> createState() => _ImagePreviewWidgetState();
}

class _ImagePreviewWidgetState extends State<ImagePreviewWidget> {
  dynamic imagePickerPath = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          widget.showRowSlider == true ? imageRowSlider() : imageColSlider(),
        ],
      ),
    );
  }

  Widget imageRowSlider() {
    return Container(
      height: 85.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  // ImageGalleryClass().imageGalleryBottomSheet(
                  //   context: context,
                  //   onMediaChanged: (value) {
                  //     setState(() {
                  //       widget.imagePaths!
                  //           .add(ImageModel(type: "File", path: value));
                  //       // imagePath = value;
                  //     });
                  //   },
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: DottedBorder(
                    radius: Radius.circular(10.sp),
                    strokeWidth: 1,
                    dashPattern: [5, 2],
                    borderType: BorderType.RRect,
                    color: AppColors.MAROON_COLOR,
                    child: Container(
                      height: 110.h,
                      width: 86.w,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AppColors.WHITE_COLOR,
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(22.0),
                        child: Container(
                            height: 15.h,
                            width: 15.h,
                            decoration: const BoxDecoration(
                                color: AppColors.BLACK_COLOR,
                                shape: BoxShape.circle),
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: AppColors.BLACK_COLOR,
                              size: 16,
                            ))),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              ImagePreviews(widget.imagePaths!,
                  onDelete: _onDeleteImage, onSelect: _onSelectImage),
            ],
          ),
        ],
      ),
    );
  }

  Widget imageColSlider() {
    return Column(
      children: [
        Container(
          height: widget.imagePaths?.length == 0 ? 0 : 90.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ImagePreviews(widget.imagePaths!,
                  onDelete: _onDeleteImage, onSelect: _onSelectImage),
            ],
          ),
        )
      ],
    );
  }

  void _onDeleteImage(int position) {
    setState(() {
      if (position >= 0) {
        if (position == 0) {
          imagePickerPath = "";
        } else {
          imagePickerPath = widget.imagePaths![position - 1];
        }
      }
      widget.imagePaths!.removeAt(position);
    });
  }

  void _onSelectImage(int index) {
    // AppNavigation.navigateTo(
    //   context,
    //   AppRouteName.PDF_VIEW_ROUTE,
    //   arguments: PdfViewRoutingArguments(
    //     pdfPath: widget.imagePaths![index].path,
    //     pdfTitle: AppStrings.DOCUMENTS + " 01",
    //     pdfType: widget.imagePaths![index].type,
    //     //AppStrings.FILE_TEXT,
    //   ),
    // );
/*    setState(() {
      imagePickerPath = widget.imagePaths![index];
      // imagePaths.removeAt(position);
    });*/
  }
}

/// Widget for displaying a preview of images
class ImagePreviews extends StatelessWidget {
  /// The image paths of the displayed images
  final List<ImageModel> imagePaths;
  final bool? isFromEdit;

  /*-------- Callback when an image should be removed-----------*/
  final Function(int)? onDelete;
  final Function(int)? onSelect;

  /*------- Creates a widget for preview of images. [imagePaths] can not be empty---------*/
  // and all contained paths need to be non empty.
  const ImagePreviews(this.imagePaths,
      {Key? key, this.onDelete, this.onSelect, this.isFromEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (imagePaths.isEmpty) {
      return Container();
    }
    final imageWidgets = <Widget>[];
    for (var i = 0; i < imagePaths.length; i++) {
      imageWidgets.add(_ImagePreview(
        imagePaths[i].path ?? "",
        imageType: imagePaths[i].type ?? "",
        onDelete: onDelete != null ? () => onDelete!(i) : null,
        onSelect: onSelect != null ? () => onSelect!(i) : null,
        index: i,
        ifFromEdit: isFromEdit,
      ));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: imageWidgets),
    );
  }
}

class _ImagePreview extends StatelessWidget {
  final String imagePath;
  final String? imageType;
  final VoidCallback? onDelete;
  final VoidCallback? onSelect;
  final int? index;
  final bool? ifFromEdit;

  const _ImagePreview(this.imagePath,
      {Key? key,
      this.imageType,
      this.onDelete,
      this.onSelect,
      this.index,
      this.ifFromEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageFile = imagePath;
    print("data us " +
        NetworkStrings.NETWORK_IMAGE_BASE_URL +
        imagePath.toString());
    print("data us " + imageType.toString());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          InkWell(
            onTap: onSelect,
            child: imageType == "asset"
                ? Container(
                    width: 90.h,
                    height: 90.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.BLACK_COLOR),
                        borderRadius: BorderRadius.circular(15.r),
                        color: AppColors.WHITE_COLOR,
                        image: DecorationImage(
                          image: AssetImage(
                            imagePath.toString(),
                          ),
                          fit: BoxFit.cover,
                        )),
                  )
                : imageType == "File"
                    ? Container(
                        width: 90.h,
                        height: 90.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(color: AppColors.BLACK_COLOR),
                            image: DecorationImage(
                              image: FileImage(
                                File(imagePath),
                              ),
                              fit: BoxFit.cover,
                            )),
                      )
                    : Container(
                        width: 90.h,
                        height: 90.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(color: AppColors.BLACK_COLOR),
                            image: DecorationImage(
                              image: NetworkImage(
                                NetworkStrings.NETWORK_IMAGE_BASE_URL +
                                    imageFile,
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
            //),
          ),
          Visibility(
            visible: ((imageType == "File" ||
                imageType == "asset" ||
                imageType == 'Network')),
            child: Positioned(
              right: 5,
              top: 5,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: GestureDetector(
                  onTap: onDelete,
                  child: Container(
                      height: 20.h,
                      width: 20.h,
                      decoration: BoxDecoration(
                          color: AppColors.BLACK_COLOR, shape: BoxShape.circle),
                      child: Center(
                          child: Icon(
                        Icons.delete,
                        size: 16,
                        color: AppColors.WHITE_COLOR,
                      ))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageModel {
  String? path;
  String? type;
  ImageModel({this.path, this.type});
}
