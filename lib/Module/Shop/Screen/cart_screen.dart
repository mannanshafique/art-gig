import 'dart:developer';

import 'package:artgig/Module/PaymentCard/Screen/payment_method_screen.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Common/Splash/Controller/splash_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_dialogs.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_route_name.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_container_border.dart';
import '../../../Widgets/cs_slidable_widget.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get total =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bottomNavigationBar: Container(
          height: 70.h,
          padding: EdgeInsets.only(bottom: 20.h, top: 5.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Total',
                    fontSize: 14.sp,
                    fontColor:
                        Constants.primaryTextThemeColor(context: context),
                    fontFamily: AppFonts.JONES_MEDIUM,
                  ),
                  5.ph,
                  CustomText(
                    text: '\$347.00',
                    fontSize: 18.sp,
                    fontColor:
                        Constants.primaryTitleTextThemeColor(context: context),
                    fontFamily: AppFonts.JONES_BOLD,
                  ),
                ],
              ),
              20.pw,
              Expanded(
                child: CustomButton(
                  fontSize: 17.sp,
                  title: 'Checkout',
                  fontFamily: AppFonts.JONES_MEDIUM,
                  onTap: () {
                    Get.to(() => const PaymentMethodsScreen(
                          isFromOrderPage: true,
                        ));
                  },
                  containerColor: AppColors.PINK_COLOR,
                  verticalPadding: 0.0,
                ),
              ),
            ],
          )),
      appBar:
          customAppBar(context: context, isLeadingBack: true, title: 'My Cart'),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  item: cartItems[index],
                  onQuantityChanged: (newQuantity) {
                    setState(() {
                      cartItems[index].quantity = newQuantity;
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 30),
            child: Column(
              children: [
                rowWidget(title: 'Booking Fee', value: '\$25.00'),
                5.ph,
                rowWidget(title: 'Artist Fee', value: '\$15.00'),
                5.ph,
                rowWidget(title: 'Booking Fee', value: '\$5.00', isTip: true),
                15.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppDialogs().showOptionsDialog(
                            headertitle: AppStrings.CANCEL_ORDER,
                            title:
                                '${AppStrings.ARE_YOU_SURE} \n cancel that order ?',
                            haveTwoButton: true,
                            b1Text: AppStrings.CANCEL,
                            b2Text: AppStrings.YES,
                            // imagePath: AssetPaths.logout,
                            b1onTap: () {
                              AppNavigation.navigatorPop(context);
                            },
                            b2onTap: () {
                              AppDialogs.showToast(
                                message:
                                    "Your order has been canceled, Successfully",
                              );
                              AppNavigation.navigatorPopUnitl(
                                  context, AppRouteName.MAIN_MENU_SCREEN);
                            },
                            context: context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.h, vertical: 5.h),
                        decoration: BoxDecoration(
                            color: Constants.isDarkTheme(context: context)
                                ? AppColors.PINK_COLOR
                                : AppColors.ORANGE_COLOR,
                            borderRadius: BorderRadius.circular(50.r)),
                        child: CustomText(
                          text: 'Cancel',
                          fontSize: 15.sp,
                          fontColor: AppColors.WHITE_COLOR,
                          fontFamily: AppFonts.JONES_BOLD,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowWidget(
      {required String title, required String value, bool? isTip = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontSize: 18.sp,
          fontColor: Constants.primaryTextThemeColor(context: context),
          fontFamily: AppFonts.JONES_BOLD,
        ),
        isTip!
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 2.h),
                decoration: BoxDecoration(
                    color: Constants.isDarkTheme(context: context)
                        ? AppColors.PINK_COLOR
                        : AppColors.ORANGE_COLOR,
                    borderRadius: BorderRadius.circular(50.r)),
                child: CustomText(
                  text: value,
                  fontSize: 14.sp,
                  fontColor: AppColors.WHITE_COLOR,
                  fontFamily: AppFonts.JONES_BOLD,
                ),
              )
            : CustomText(
                text: value,
                fontSize: 18.sp,
                fontColor: Constants.primaryTextThemeColor(context: context),
                fontFamily: AppFonts.JONES_BOLD,
              ),
      ],
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;

  const CartItemWidget(
      {Key? key, required this.item, required this.onQuantityChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: CustomSlidableWidget(
        isenable: true,
        onTap: (context) {},
        child: CustomContainerBorderWidget(
          padding: EdgeInsets.zero,
          bgColor: Constants.isDarkTheme(context: context)
              ? AppColors.TRANSPARENT_COLOR
              : AppColors.WHITE_COLOR,
          borderColor: Constants.isDarkTheme(context: context)
              ? AppColors.WHITE_COLOR
              : AppColors.ORANGE_COLOR,
          borderRadius: 15.r,
          oppacityValue: Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 80.h,
                  width: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: const DecorationImage(
                      image: AssetImage(AssetPaths.TEMP_EVENT_IMAGES),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                12.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: item.name,
                        fontSize: 16.sp,
                        fontColor:
                            Constants.primaryTextThemeColor(context: context),
                        fontFamily: AppFonts.JONES_BOLD,
                      ),
                      10.ph,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "\$${item.price.toStringAsFixed(2)}",
                            fontSize: 16.sp,
                            fontColor: Constants.primaryTitleTextThemeColor(
                                context: context),
                            fontFamily: AppFonts.JONES_BOLD,
                          ),
                          5.pw,
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 2.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                border: Border.all(
                                  color: Constants.isDarkTheme(context: context)
                                      ? AppColors.WHITE_COLOR
                                      : AppColors.ORANGE_COLOR,
                                )),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (item.quantity > 1) {
                                      onQuantityChanged(item.quantity - 1);
                                    }
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                                Text(item.quantity.toString().padLeft(2, '0')),
                                GestureDetector(
                                  onTap: () {
                                    onQuantityChanged(item.quantity + 1);
                                  },
                                  child: const Icon(
                                    Icons.add,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItem(
      {required this.name,
      required this.image,
      required this.price,
      this.quantity = 1});
}

List<CartItem> cartItems = [
  CartItem(
      name: "Conference T-Shirt",
      image: AssetPaths.TEMP_EVENT_IMAGES,
      price: 20),
  CartItem(
      name: "Conference T-Shirt",
      image: AssetPaths.TEMP_EVENT_IMAGES,
      price: 20),
  CartItem(
      name: "Conference T-Shirt",
      image: AssetPaths.TEMP_EVENT_IMAGES,
      price: 20),
  CartItem(
      name: "Conference T-Shirt",
      image: AssetPaths.TEMP_EVENT_IMAGES,
      price: 20),
];
