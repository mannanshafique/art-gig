import 'package:artgig/Module/Shop/Screen/cart_screen.dart';
import 'package:artgig/Utils/app_fonts.dart';
import 'package:artgig/Utils/app_strings.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:artgig/Widgets/custom_button.dart';
import 'package:artgig/Widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_container_border.dart';
import '../../../Widgets/custom_text.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: customAppBar(
          context: context, isLeadingBack: true, title: 'Product Listing'),
      body: Column(
        children: [
          // Category Filters
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 8.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: List.generate(5, (index) {
          //       return Column(
          //         children: [
          //           CircleAvatar(
          //             radius: 30.r,
          //             backgroundImage:
          //                 AssetImage('assets/images/sample_image.jpg'),
          //           ),
          //           SizedBox(height: 8.h),
          //           CustomText(
          //             text: index == 0 ? "All" : "Lorem",
          //             fontSize: 14,
          //             fontColor: Colors.black,
          //           ),
          //         ],
          //       );
          //     }),
          //   ),
          // ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.68,
              ),
              itemCount: 8, // Example: 8 products
              itemBuilder: (context, index) {
                return ProductCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerBorderWidget(
      padding: EdgeInsets.zero,
      bgColor: Constants.isDarkTheme(context: context)
          ? AppColors.TRANSPARENT_COLOR
          : AppColors.WHITE_COLOR,
      borderColor: Constants.isDarkTheme(context: context)
          ? AppColors.WHITE_COLOR
          : AppColors.ORANGE_COLOR,
      borderRadius: 10.r,
      oppacityValue: Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image and Favorite Icon
            Stack(
              children: [
                Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: const DecorationImage(
                      image: AssetImage(AssetPaths.TEMP_EVENT_IMAGES),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Positioned(
                //   top: 8.h,
                //   right: 8.w,
                //   child: const Icon(Icons.favorite, color: Colors.red),
                // ),
              ],
            ),
            SizedBox(height: 8.h),
            // Product Name
            CustomText(
              text: "Product Name",
              fontSize: 16.sp,
              fontFamily: AppFonts.JONES_BOLD,
              fontColor: AppColors.BLACK_COLOR,
            ),
            SizedBox(height: 4.h),
            // Product Description
            CustomText(
              text:
                  "Lorem ipsum dolor sit amet consectetur adipiscing, elit congue...",
              fontSize: 12.sp,
              textAlign: TextAlign.start,
              fontColor: AppColors.GREY_COLOR,
              maxLines: 2,
            ),
            SizedBox(height: 8.h),
            // Price and Add to Cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "\$17.99",
                  fontSize: 16.sp,
                  fontColor:
                      Constants.primaryTitleTextThemeColor(context: context),
                  fontFamily: AppFonts.JONES_BOLD,
                ),
                10.pw,
                Expanded(
                    child: CustomButton(
                        verticalPadding: 5.h,
                        horizontalPadding: 2.h,
                        onTap: () {
                          Get.to(CartScreen());
                        },
                        title: AppStrings.ADD_TO_CART))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
