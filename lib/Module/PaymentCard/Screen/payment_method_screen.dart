import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_dialogs.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_bottom_navg_button.dart';
import '../../../Widgets/cs_container_border.dart';
import '../../../Widgets/cs_slidable_widget.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/no_data_found_widget.dart';
import '../../MainMenu/Controller/main_controller.dart';
import '../Model/payment_card_model.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   MainController.i.cardSelectedValue.value = 0;
    //   GetCardListingBloc().getCardListingMethod(
    //       context: context,
    //       setProgressBar: () {
    //         AppDialogs.progressAlertDialog(context: context);
    //       });
    // });

    super.initState();
  }

  final MainController mainController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scffoldBg: AppColors.WHITE_COLOR,
      appBar: customAppBar(
          context: context,
          isLeadingBack: true,
          title: AppStrings.PAYMENT),
      bottomNavigationBar: CustomBottomNavigationWidget(
        buttonTitle: AppStrings.CONTINUE,
        onTap: () {
          // AppNavigation.navigatorPop(context);
          Get.back(result: 'amount');
        },
      ),
      body: Column(children: [
        10.ph,
        Flexible(
          child: RefreshIndicator(
              onRefresh: () async {
                // GetCardListingBloc().getCardListingMethod(
                //     context: context,
                //     setProgressBar: () {
                //       AppDialogs.progressAlertDialog(context: context);
                //     });
              },
              child: Obx(
                () => mainController.paymentCards.isEmpty
                    ? NoDataFoundWidget(
                        havingScroll: true,
                        height: Constants().fullScreenSize / 1.2,
                      )
                    : ListView.builder(
                        itemCount: mainController.paymentCards.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          PaymentCardData paymentCardData =
                              mainController.paymentCards[index];
                          return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Obx(
                                () => customCardView(
                                    optionValue: index,
                                    groupValue: MainController
                                        .i.cardSelectedValue.value,
                                    onChanged: (value) {
                                      MainController.i.cardSelectedValue.value =
                                          value;
                                      // SetDefaultCardBloc()
                                      //     .setDefaultCardBlocMethod(
                                      //         context: context,
                                      //         cardId: paymentCardData.id,
                                      //         setProgressBar: () {
                                      //           AppDialogs.progressAlertDialog(
                                      //               context: context);
                                      //         });
                                    },
                                    onTap: (i) {
                                      // DeleteCardBloc().deleteCardMethod(
                                      //     context: context,
                                      //     cardId: paymentCardData.id,
                                      //     setProgressBar: () {
                                      //       AppDialogs.progressAlertDialog(
                                      //           context: context);
                                      //     });
                                      AppDialogs.showToast(
                                          message: 'Card deleted sucessfully');
                                      mainController.paymentCards
                                          .removeAt(index);
                                    },
                                    paymentCardData: paymentCardData),
                              ));
                        },
                      ),
              )),
        ),
        12.ph,
        //!----Add New Card Widget
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                AppDialogs().showAddNewCardDialog(context, onTap: () {});
              },
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: AppColors.GREEN_COLOR,
                          borderRadius: BorderRadius.circular(3.r)),
                      padding: const EdgeInsets.all(5.0),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.WHITE_COLOR,
                      )),
                  10.pw,
                  CustomText(
                    text: AppStrings.ADD_NEW_CARD,
                    fontColor: AppColors.BLACK_COLOR,
                    fontSize: 16.sp,
                    maxLines: 1,
                    fontFamily: AppFonts.JONES_BOLD,
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget customCardView(
      {required int? optionValue,
      groupValue,
      Function(dynamic)? onChanged,
      required Function(BuildContext)? onTap,
      required PaymentCardData paymentCardData}) {
    return CustomSlidableWidget(
      isenable: true,
      onTap: onTap,
      child: CustomContainerBorderWidget(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: AppColors.LIGHT_GREY_COLOR,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Image.asset(
                paymentCardData.brand == 'Visa'
                    ? AssetPaths.VISA_ICON
                    : AssetPaths.MASTERCARD_ICON,
                height: 18.h,
                color: AppColors.GREEN_COLOR,
                width: 18.h,
              ),
            ),
            14.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: paymentCardData.brand,
                    fontColor: AppColors.BLACK_COLOR,
                    fontSize: 15.sp,
                    maxLines: 1,
                    fontFamily: AppFonts.JONES_MEDIUM,
                  ),
                  6.ph,
                  CustomText(
                    text: '*******${paymentCardData.last4}',
                    fontColor: AppColors.GREY_COLOR,
                    fontSize: 14.sp,
                    fontFamily: AppFonts.JONES_REGULAR,
                  ),
                ],
              ),
            ),
            10.pw,
            Radio(
              visualDensity: VisualDensity.compact,
              activeColor: AppColors.GREEN_COLOR,
              value: optionValue,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            5.pw
          ],
        ),
      ),
    );
  }
}
