import 'dart:io';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_network_strings.dart';

class CustomExtendedImageWidget extends StatelessWidget {
  final String? imagePath, imageType;
  final String imagePlaceholder;
  final BoxFit? fit;
  final Color? placeholderColor, imageColor;
  final VoidCallback? onTap;

  CustomExtendedImageWidget(
      {this.imagePath,
      this.imageType,
      required this.imagePlaceholder,
      this.imageColor,
      this.placeholderColor,
      this.fit,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return imagePath != null && imageType == MediaPathType.FILE.name
        ? GestureDetector(
            onTap: onTap,
            child: ExtendedImage.file(
              File(imagePath!),
              fit: fit ?? BoxFit.cover,
              color: imageColor,
              loadStateChanged: (state) {
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    return Image.asset(
                      imagePlaceholder,
                      // fit: BoxFit.contain,
                      fit: fit ?? BoxFit.cover,
                      color: placeholderColor,
                    );

                  case LoadState.failed:
                    return Image.asset(
                      imagePlaceholder,
                      // fit: BoxFit.contain,
                      fit: fit ?? BoxFit.cover,
                      color: placeholderColor,
                    );

                  case LoadState.completed:
                    break;
                }
              },
              //cancelToken: cancellationToken,
            ),
          )
        : imagePath != null && imageType == MediaPathType.NETWORK.name
            ? GestureDetector(
                onTap: onTap,
                child: ExtendedImage.network(
                  NetworkStrings.NETWORK_IMAGE_BASE_URL + imagePath!,
                  fit: fit ?? BoxFit.cover,
                  color: imageColor,
                  loadStateChanged: (state) {
                    switch (state.extendedImageLoadState) {
                      case LoadState.loading:
                        // return Image.asset(
                        //   imagePlaceholder,
                        //   // fit: BoxFit.contain,
                        //   fit: fit ?? BoxFit.cover,
                        //   color: placeholderColor,
                        // );
                        return Shimmer.fromColors(
                          baseColor: AppColors.shimmerBaseColor,
                          highlightColor: AppColors.shimmerHighlightColor,
                          child: Container(
                            color: Colors.grey,
                          ),
                        );
                      case LoadState.failed:
                        return Image.asset(
                          imagePlaceholder,
                          fit: fit ?? BoxFit.cover,
                          // fit: BoxFit.contain,
                          color: placeholderColor,
                        );
                      case LoadState.completed:
                        break;
                    }
                  },
                  //cancelToken: cancellationToken,
                ),
              )
            : imagePath != null && imageType == MediaPathType.ASSETS.name
                ? GestureDetector(
                    onTap: onTap,
                    child: ExtendedImage.asset(
                      imagePath!,
                      color: imageColor,
                      fit: fit ?? BoxFit.cover,
                      loadStateChanged: (state) {
                        switch (state.extendedImageLoadState) {
                          case LoadState.loading:
                            return Image.asset(
                              imagePlaceholder,
                              fit: fit ?? BoxFit.cover,
                              color: placeholderColor,
                            );

                          case LoadState.failed:
                            return Image.asset(
                              imagePlaceholder,
                              fit: fit ?? BoxFit.cover,
                              color: placeholderColor,
                            );

                          case LoadState.completed:
                            return SizedBox();
                        }
                      },
                      //cancelToken: cancellationToken,
                    ),
                  )
                : Image.asset(
                    imagePlaceholder,
                    fit: fit ?? BoxFit.cover,
                    color: placeholderColor,
                  );
  }
}

enum MediaPathType { FILE, NETWORK, ASSETS }
