import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/app_colors.dart';

class CustomRatingBarWidget extends StatelessWidget {
  const CustomRatingBarWidget(
      {super.key,
      required this.rating,
      this.itemSize,
      this.itemPadding,
      required this.onRatingUpdate,
      this.isIgnoreGesture});

  final double rating;
  final double? itemSize;
  final bool? isIgnoreGesture;
  final Function(double) onRatingUpdate;
  final EdgeInsetsGeometry? itemPadding;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        glow: false,
        itemCount: 5,
        ignoreGestures: isIgnoreGesture ?? false,
        itemSize: itemSize ?? 20.h,
        itemPadding: itemPadding ?? EdgeInsets.symmetric(horizontal: 2.w),
        unratedColor: AppColors.GREY_COLOR,
        itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: onRatingUpdate);
  }
}
