import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_dialogs.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/app_validator.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_bottom_navg_button.dart';
import '../../../Widgets/cs_container_border.dart';
import '../../../Widgets/custom_alert_dialog.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/custom_textfield.dart';
import '../../MainMenu/Controller/main_controller.dart';
import '../Model/payment_card_model.dart';

class AddNewCardScreen extends StatefulWidget {
  AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final cardNameEditingController = TextEditingController();

  final cardNumberEditingController = TextEditingController();

  final expMonthEditingController = TextEditingController();

  final expYearEditingController = TextEditingController();

  final cvvEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      headerText: AppStrings.ADD_NEW_CARD,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                14.ph,
                cardForm(),
                15.ph,
                CustomButton(
                    containerColor: AppColors.PINK_COLOR,
                    fontColor: AppColors.WHITE_COLOR,
                    onTap: () {
                      Constants.unFocusKeyboardMethod(context: context);
                      bool isValidate = FieldValidator().creditCardValidate(
                        context: context,
                        cardNumber: cardNumberEditingController.text,
                        // expMonth: expMonthEditingController.text,
                        expYear: expYearEditingController.text,
                        cvv: cvvEditingController.text,
                      );
                      if (isValidate) {
                        //!----
                        AppDialogs().showOptionsDialog(
                            headertitle: AppStrings.SUCCESSFUL,
                            title: 'Card Added Successfully',
                            haveTwoButton: false,
                            b1Text: AppStrings.CONTINUE,
                            imagePath: AssetPaths.TICK_ICON,
                            b1onTap: () {
                              MainController.i.paymentCards.add(PaymentCardData(
                                id: "${cardNumberEditingController.text} card_1",
                                object: "card",
                                addressCity: "New York",
                                addressCountry: "US",
                                addressLine1: "123 Main St",
                                addressLine1Check: "pass",
                                addressLine2: "Apt 4B",
                                addressState: "NY",
                                addressZip: "10001",
                                addressZipCheck: "pass",
                                brand: "Visa",
                                country: "US",
                                customer: "cust_1",
                                cvcCheck: "pass",
                                dynamicLast4: "1234",
                                expMonth: 12,
                                expYear: 2025,
                                fingerprint: "abc123",
                                funding: "credit",
                                last4: cardNumberEditingController.text
                                    .substring(cardNumberEditingController
                                            .text.length -
                                        4),
                                name: "John Doe",
                                tokenizationMethod: null,
                                wallet: null,
                              ));
                              AppNavigation.navigatorPop(context);
                              AppNavigation.navigatorPop(context);
                            },
                            context: context);
                      }
                    },
                    title: AppStrings.ADD_NEW_CARD),
                20.ph,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardForm() {
    return Column(
      children: [
        CustomTextField(
          controller: cardNameEditingController,
          keyboardType: TextInputType.text,
          hint: AppStrings.CARD_HOLDER_NAME,
          borderColor: AppColors.BLACK_COLOR,
          isDense: true,
          label: false,
          textCapitalization: TextCapitalization.none,
          inputFormatters: [LengthLimitingTextInputFormatter(16)],
        ),
        10.ph,
        CustomTextField(
          controller: cardNumberEditingController,
          keyboardType: TextInputType.number,
          hint: AppStrings.CARD_NUMBER,
          label: false,
          borderColor: AppColors.BLACK_COLOR,
          divider: false,
          isDense: false,
          textCapitalization: TextCapitalization.none,
          inputFormatters: [LengthLimitingTextInputFormatter(16)],
        ),
        10.ph,
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: expYearEditingController,
                keyboardType: TextInputType.number,
                hint: AppStrings.EX_DATE,
                label: false,
                prefixIconColor: AppColors.GREY_COLOR,
                borderColor: AppColors.BLACK_COLOR,
                divider: false,
                isDense: false,
                textCapitalization: TextCapitalization.none,
                inputFormatters: [LengthLimitingTextInputFormatter(2)],
              ),
            ),
            10.pw,
            Expanded(
              child: CustomTextField(
                controller: cvvEditingController,
                keyboardType: TextInputType.number,
                hint: AppStrings.CVV,
                label: false,
                prefixIconColor: AppColors.GREY_COLOR,
                divider: false,
                isDense: false,
                textCapitalization: TextCapitalization.none,
                borderColor: AppColors.BLACK_COLOR,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(Constants.cvcLength)
                ],
              ),
            ),
          ],
        ),
        10.ph,
      ],
    );
  }

  Widget _customTextField(
      {required TextEditingController textEditingController,
      required TextInputType keyboardType,
      required String hint,
      List<TextInputFormatter>? inputFormatters,
      bool? readOnly,
      Function()? onTap}) {
    return CustomTextField(
        controller: textEditingController,
        keyboardType: keyboardType,
        hint: hint,
        readOnly: readOnly ?? false,
        label: false,
        isDense: true,
        onTap: onTap,
        verticalPadding: 2.0,
        bgColor: Constants.isDarkTheme(context: context)
            ? AppColors.TRANSPARENT_COLOR
            : AppColors.WHITE_COLOR,
        borderColor: Constants.isDarkTheme(context: context)
            ? AppColors.WHITE_COLOR
            : AppColors.TRANSPARENT_COLOR,
        textCapitalization: TextCapitalization.none,
        inputFormatters: inputFormatters);
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:vaca_valet/Utils/extensions.dart';

// import '../../../Utils/app_colors.dart';
// import '../../../Utils/app_constants.dart';
// import '../../../Utils/app_dialogs.dart';
// import '../../../Utils/app_navigation.dart';
// import '../../../Utils/app_strings.dart';
// import '../../../Utils/app_validator.dart';
// import '../../../Utils/asset_paths.dart';
// import '../../../Widgets/cs_appbar.dart';
// import '../../../Widgets/cs_bottom_navg_button.dart';
// import '../../../Widgets/custom_scaffold.dart';
// import '../../../Widgets/custom_textfield.dart';

// class AddNewCardScreen extends StatelessWidget {
//   AddNewCardScreen({super.key});

//   final cardNameEditingController = TextEditingController();
//   final cardNumberEditingController = TextEditingController();
//   final expMonthEditingController = TextEditingController();
//   final expYearEditingController = TextEditingController();
//   final cvvEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       scffoldBg: AppColors.WHITE_COLOR,
//       appBar: customAppBar(
//           context: context,
//           isLeadingBack: true,
//           leadingIconColor: AppColors.BLACK_COLOR,
//           title: AppStrings.ADD_NEW_CARD),
//       bottomNavigationBar: CustomBottomNavigationWidget(
//         buttonTitle: AppStrings.ADD,
//         onTap: () {
          // Constants.unFocusKeyboardMethod(context: context);
          // bool isValidate = FieldValidator().creditCardValidate(
          //   context: context,
          //   cardNumber: cardNumberEditingController.text,
          //   expMonth: expMonthEditingController.text,
          //   expYear: expYearEditingController.text,
          //   cvv: cvvEditingController.text,
          // );
          // if (isValidate) {
          //   //!----
          //   AppDialogs().showOptionsDialog(
          //       headertitle: AppStrings.SUCCESSFUL,
          //       title: 'Card Added Successfully',
          //       haveTwoButton: false,
          //       b1Text: AppStrings.CONTINUE,
          //       imagePath: AssetPaths.bookingSucess,
          //       b1onTap: () {
          //         AppNavigation.navigatorPop(context);
          //         AppNavigation.navigatorPop(context);
          //       },
          //       context: context);
          // }
//           // AddNewCardBloc().addNewCardBlocMethod(
//           //     cardNumber: cardNumberEditingController.text,
//           //     cvc: cvvEditingController.text,
//           //     expMonth: int.parse(expMonthEditingController.text),
//           //     expYear: int.parse(expYearEditingController.text),
//           //     context: context,
//           //     setProgressBar: () {
//           //       AppDialogs.progressAlertDialog(context: context);
//           //     });
//         },
//       ),
//       body: Column(
//         children: [
//           10.ph,
//           cardForm(),
//           20.ph,
//         ],
//       ),
//     );
//   }

//   Widget cardForm() {
//     return Column(
//       children: [
//         CustomTextField(
//           controller: cardNameEditingController,
//           keyboardType: TextInputType.text,
//           hint: AppStrings.CARD_HOLDER_NAME,
//           borderColor: AppColors.BLACK_COLOR,
//           isDense: true,
//           label: false,
//           textCapitalization: TextCapitalization.none,
//           inputFormatters: [LengthLimitingTextInputFormatter(16)],
//         ),
//         10.ph,
//         CustomTextField(
//           controller: cardNumberEditingController,
//           keyboardType: TextInputType.number,
//           hint: AppStrings.CARD_NUMBER,
//           label: false,
//           borderColor: AppColors.BLACK_COLOR,
//           divider: false,
//           isDense: false,
//           textCapitalization: TextCapitalization.none,
//           inputFormatters: [LengthLimitingTextInputFormatter(16)],
//         ),
//         10.ph,
//         Row(
//           children: [
//             Expanded(
//               child: CustomTextField(
//                 controller: expMonthEditingController,
//                 keyboardType: TextInputType.number,
//                 hint: AppStrings.eXPDate,
//                 label: false,
//                 prefixIconColor: AppColors.GREY_COLOR,
//                 borderColor: AppColors.BLACK_COLOR,
//                 divider: false,
//                 isDense: false,
//                 textCapitalization: TextCapitalization.none,
//                 inputFormatters: [LengthLimitingTextInputFormatter(2)],
//               ),
//             ),
//             10.pw,
//             Expanded(
//               child: CustomTextField(
//                 controller: cvvEditingController,
//                 keyboardType: TextInputType.number,
//                 hint: AppStrings.CVV,
//                 label: false,
//                 prefixIconColor: AppColors.GREY_COLOR,
//                 divider: false,
//                 isDense: false,
//                 textCapitalization: TextCapitalization.none,
//                 borderColor: AppColors.BLACK_COLOR,
//                 inputFormatters: [
//                   LengthLimitingTextInputFormatter(Constants.cvcLength)
//                 ],
//               ),
//             ),
//           ],
//         ),
//         10.ph,
//       ],
//     );
//   }
// }


