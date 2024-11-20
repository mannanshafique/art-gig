import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../Utils/app_colors.dart';
import '../Utils/asset_paths.dart';

class CustomImageWidget extends StatefulWidget {
  final File? pickedImage;
  final Function(File?)? setFile;
  final bool canSelectImage;
  final bool isBaseUrl;
  final Color? borderColor;
  final bool isPlaceHolderShow;
  final String? imageAssets;
  final String? onTapIcon;
  final String? imageUrl;
  final BoxFit? fit;
  final double? imageWidth;
  final double? imageHeight;
  final double? borderWidth;
  final bool isBorder;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  const CustomImageWidget({
    super.key,
    this.pickedImage,
    this.isBaseUrl = true,
    this.padding,
    this.fit,
    this.isPlaceHolderShow = true,
    this.setFile,
    this.canSelectImage = false,
    this.borderColor,
    this.imageAssets,
    this.imageUrl,
    this.isBorder = true,
    this.imageWidth,
    this.imageHeight,
    this.borderWidth,
    this.shape = BoxShape.circle,
    this.borderRadius,
    this.onTap,
    this.onTapIcon,
  });

  @override
  State<CustomImageWidget> createState() => _CustomImageWidgetState();
}

class _CustomImageWidgetState extends State<CustomImageWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: widget.canSelectImage == false
          ? null
          : widget.onTap ??
              () {
                // Utils.showImageSourceSheet(
                //   context: context,
                //   setFile: widget.setFile,
                // );
              },
      child: Stack(
        children: [
          Container(
            // margin: EdgeInsets.all(2.w),
            width: widget.imageWidth ?? 140.w,
            height: widget.imageHeight ?? 140.w,
            padding: widget.padding,
            decoration: BoxDecoration(
              border: widget.isBorder
                  ? Border.all(
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: widget.borderColor ?? const Color(0xFF000000),
                      width: widget.borderWidth ?? 2.w)
                  : null,
              borderRadius: widget.borderRadius,
              shape: widget.borderRadius == null
                  ? widget.shape
                  : BoxShape.rectangle,
            ),
            child: widget.pickedImage != null
                ? ExtendedImage.file(
                    widget.pickedImage!,
                    fit: widget.fit ?? BoxFit.cover,
                    borderRadius: widget.borderRadius,
                    shape: widget.borderRadius == null
                        ? widget.shape
                        : BoxShape.rectangle,
                  )
                : widget.imageUrl != null
                    ? ExtendedImage.network(
                        widget.isBaseUrl ? widget.imageUrl! : widget.imageUrl!,
                        borderRadius: widget.borderRadius,
                        shape: widget.borderRadius == null
                            ? widget.shape
                            : BoxShape.rectangle,
                        fit: widget.fit ?? BoxFit.cover,
                        loadStateChanged: (ExtendedImageState state) {
                          switch (state.extendedImageLoadState) {
                            case LoadState.completed:
                              return ExtendedRawImage(
                                image: state.extendedImageInfo?.image,
                                fit: widget.fit ?? BoxFit.fill,
                              );
                            default:
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(color: Colors.white),
                              );
                          }
                        },
                      )
                    : widget.isPlaceHolderShow
                        ? ExtendedImage.asset(
                            widget.imageAssets ?? AssetPaths.PROFILE_ICON,
                            borderRadius: widget.borderRadius,
                            shape: widget.borderRadius == null
                                ? widget.shape
                                : BoxShape.rectangle,
                            fit: widget.fit ?? BoxFit.cover)
                        // ? const SizedBox.shrink()
                        // Image.asset(
                        //     widget.imageAssets ?? asset .cameraPlaceHolder,
                        //     fit: widget.fit ?? BoxFit.cover,
                        //     // width: 2,
                        //     // height: 2,
                        //   )
                        : null,
          ),
          widget.canSelectImage
              ? Positioned(
                  bottom: 10,
                  right: 0,
                  child: InkWell(
                    onTap: widget.onTap ??
                        () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          // Utils.showImageSourceSheet(
                          //   context: context,
                          //   setFile: widget.setFile,
                          // );
                        },
                    child: Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        color: AppColors.WHITE_COLOR,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                          // child: SizedBox(
                          //   height: 32,
                          //   width: 32,
                          //   child: CircleAvatar(
                          //       backgroundColor:MyColors().payPalColor,
                          //       child: Image(
                          //         image: AssetImage(
                          //           widget.onTapIcon ?? AppAssets.cameraPicker,
                          //         ),
                          //         width: 13.w,
                          //         height: 13.h,
                          //         color: AppColors.white,
                          //       )),
                          // ),
                          ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
