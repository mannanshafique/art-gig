import 'dart:developer';

import 'package:artgig/Module/Shop/Screen/cart_screen.dart';
import 'package:artgig/Utils/app_constants.dart';
import 'package:artgig/Utils/app_route_name.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:artgig/Widgets/custom_button.dart';
import 'package:artgig/Widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:place_picker/place_picker.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_dialogs.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_padding.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_bottom_navg_button.dart';
import '../../../Widgets/cs_container_border.dart';
import '../../../Widgets/custom_drop_down_widget.dart';
import '../../../Widgets/custom_image_preview.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/custom_textfield.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController eventForController = TextEditingController();
  final TextEditingController howManyPeopleController = TextEditingController();
  final TextEditingController whereIsEventController = TextEditingController();
  final TextEditingController whenIsEventController = TextEditingController();
  final TextEditingController whenTimeEventController = TextEditingController();
  final TextEditingController eventFeeController = TextEditingController();
  final TextEditingController hourlyRateController = TextEditingController();
  final TextEditingController timeDurationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<ImageModel> selectedMediaPath = <ImageModel>[];

// Corporate Event, Birthday Party, Ladies Night, Casual Getogether, Kids Party, Other (Drop down)

  void setImage(String imagePath) {
    if (selectedMediaPath.isNotEmpty) {
      selectedMediaPath[0] = ImageModel(path: imagePath, type: 'File');
    } else {
      selectedMediaPath.add(ImageModel(path: imagePath, type: 'File'));
    }

    setState(() {});

    log('selected media length : ${selectedMediaPath.length}');
  }

  String? eventFor;
  List<String> eventForDropDownList = [
    "Corporate Event",
    "Birthday Party",
    "Ladies Night",
    "Casual Getogether",
    "Kids Party",
    "Other"
  ];

  List<String> dummyImages = [
    AssetPaths.TEMP_EVENT_IMAGES,
    AssetPaths.TEMP_EVENT_IMAGES,
    AssetPaths.TEMP_EVENT_IMAGES,
  ];

  //!---Time (Artist)
  List<String> timeSlots = [];
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    generateTimeSlots();
  }

  void generateTimeSlots() {
    DateTime now = DateTime.now();
    DateTime startTime =
        now.add(const Duration(minutes: 30)); // Start after 30 min
    DateTime endTime = now.add(const Duration(hours: 2)); // End after 2 hours

    while (startTime.isBefore(endTime)) {
      timeSlots.add(DateFormat.jm().format(startTime)); // Format as "10:30 AM"
      startTime = startTime.add(const Duration(minutes: 15)); // Add 15 min
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scffoldBg: AppColors.TRANSPARENT_COLOR,
      appBar: customAppBar(
          context: context,
          isLeadingBack: true,
          title: AppStrings.CREATE_EVENT),
      bottomNavigationBar: CustomBottomNavigationWidget(
        buttonTitle: AppStrings.CONTINUE,
        onTap: () {
          Get.to(() => const NestedCreateEvent());
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            paintingUploadWidget(),
            10.ph,
            customizedDropDown(
                dropDownDataList: eventForDropDownList,
                dropDownValue: eventFor,
                hintValue: 'What is the event for?',
                fontSize: 14.sp,
                onChangeFunction: (selectedValue) {
                  setState(() {
                    eventFor = selectedValue ?? '';
                  });
                }),
            10.ph,
            _customTextField(
              textEditingController: howManyPeopleController,
              hintText: 'How many people the event is for?',
              keybordType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(5)],
            ),
            10.ph,
            _customTextField(
                textEditingController: whereIsEventController,
                hintText: 'Where is the event?',
                keybordType: TextInputType.text,
                readOnly: true,
                onTap: () async {
                  LocationResult t = await Constants().showPlacePicker(context);
                  whereIsEventController.text = t.formattedAddress ?? '';
                }),
            10.ph,
            _customTextField(
                textEditingController: whenIsEventController,
                hintText: 'When is the event?',
                keybordType: TextInputType.text,
                readOnly: true,
                onTap: () async {
                  whenIsEventController.text = await Constants().datePicker(
                    context,
                    initialDate: DateTime.now().add(const Duration(
                        days: 15)), // Ensure it's AFTER firstDate
                    firstDate: DateTime.now()
                        .add(const Duration(days: 14)), // First date allowed
                    lastDate: DateTime.now()
                        .add(const Duration(days: 2 * 365)), // 2 years ahead
                  );
                }),
            10.ph,
            _customTextField(
                textEditingController: whenTimeEventController,
                hintText: 'What time is the event?',
                keybordType: TextInputType.text,
                readOnly: true,
                onTap: () {
                  Constants.showSelectTimePicker(
                    context: context,
                    getSelectedTime: (value) {
                      whenTimeEventController.text =
                          Constants.formatTimeOfDay(value!);
                    },
                  );
                }),
            10.ph,
            _customTextField(
              textEditingController: eventFeeController,
              hintText: 'Event Fee',
              keybordType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(6)],
            ),
            10.ph,
            customizedDropDown(
                dropDownDataList: timeSlots,
                dropDownValue: selectedTime,
                hintValue: 'Setup Artist',
                fontSize: 14.sp,
                onChangeFunction: (selectedValue) {
                  setState(() {
                    selectedTime = selectedValue ?? '';
                  });
                }),
            10.ph,
            _customTextField(
              textEditingController: timeDurationController,
              hintText: 'Time Duration',
              keybordType: TextInputType.number,
              inputFormatters: [LengthLimitingTextInputFormatter(2)],
            ),
            10.ph,
            _customTextField(
              textEditingController: descriptionController,
              hintText: 'Description',
              keybordType: TextInputType.text,
              maxLine: 4,
              inputFormatters: [
                LengthLimitingTextInputFormatter(
                    Constants.DESCRIPTION_MAX_LENGTH)
              ],
            ),
            10.ph,
          ],
        ),
      ),
    );
  }

  Widget paintingUploadWidget() {
    return GestureDetector(
      onTap: () {
        AppDialogs().showImagePickerDialog(
            isMultiPicked: false,
            context: context,
            pickedImagePathCallback: setImage);
      },
      child: Column(
        children: [
          // CustomContainerBorderWidget(
          //   padding: const EdgeInsets.symmetric(vertical: 30.0),
          //   bgColor: AppColors.TRANSPARENT_COLOR,
          //   borderRadius: 12.r,
          //   oppacityValue: 0.0,
          //   borderColor: Constants.isDarkTheme(context: context)
          //       ? AppColors.WHITE_COLOR
          //       : AppColors.ORANGE_COLOR,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Icon(
          //         Icons.add,
          //         size: 20.h,
          //         color: Constants.primaryTitleTextThemeColor(context: context),
          //       ),
          //       5.pw,
          //       CustomText(
          //         text: 'Upload Painting',
          //         fontSize: 16.sp,
          //         fontColor:
          //             Constants.primaryTitleTextThemeColor(context: context),
          //       ),
          //     ],
          //   ),
          // ),
          Row(
            children: [
              for (String path in dummyImages) ...[
                Container(
                  height: 80.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                      color: AppColors.PINK_COLOR,
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(path, fit: BoxFit.cover)),
                ),
                10.pw,
              ]
            ],
          ),
          10.ph,
          ImagePreviewWidget(
            imagePaths: selectedMediaPath,
            isGalleryIconVisible: false,
            isCameraIconVisible: false,
            showRowSlider: false,
            isFromEdit: false,
          ),
        ],
      ),
    );
  }

  Widget _customTextField(
      {required TextEditingController textEditingController,
      List<TextInputFormatter>? inputFormatters,
      String? hintText,
      TextInputType? keybordType,
      int? maxLine,
      Function()? onTap,
      bool? readOnly}) {
    return CustomContainerBorderWidget(
      padding: EdgeInsets.zero,
      bgColor: AppColors.TRANSPARENT_COLOR,
      borderRadius: (maxLine ?? 0) > 1 ? 12.r : 50.r,
      oppacityValue: Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
      child: CustomTextField(
          controller: textEditingController,
          hint: hintText ?? '',
          readOnly: readOnly ?? false,
          label: false,
          isDense: true,
          divider: false,
          onTap: onTap,
          maxlines: maxLine,
          borderRadius: (maxLine ?? 0) > 1 ? 12.r : 50.r,
          keyboardType: keybordType,
          verticalPadding: 2.0,
          bgColor: Constants.isDarkTheme(context: context)
              ? AppColors.TRANSPARENT_COLOR
              : AppColors.WHITE_COLOR,
          borderColor: Constants.isDarkTheme(context: context)
              ? AppColors.WHITE_COLOR
              : AppColors.ORANGE_COLOR,
          textCapitalization: TextCapitalization.none,
          inputFormatters: inputFormatters),
    );
  }

  Widget customizedDropDown(
      {required List<String> dropDownDataList,
      required String hintValue,
      required String? dropDownValue,
      String? iconPath,
      double? fontSize,
      required Function(String?)? onChangeFunction}) {
    return CustomDropDown2(
        dropIconSize: 16.h,
        errorBorder: AppColors.RED_COLOR,
        hintColor: AppColors.GREY_COLOR.withOpacity(0.8),
        isBorder: true,
        dropDownData: dropDownDataList,
        hintText: hintValue,
        dropdownValue: dropDownValue,
        borderRadius: 50.r,
        contentPadding: EdgeInsets.symmetric(
          vertical: AppPadding.textFieldVerticalPadding.h,
        ),
        dropDownWidth: 0.914.sw,
        offset: const Offset(-5, -25),
        horizontalPadding: 0.w,
        buttonPadding: 7.w,
        dropDownFontSize: fontSize,
        fontSize: fontSize,
        borderColor: AppColors.RED_COLOR,
        validator: (value) =>
            (value == null || value.isEmpty) ? hintValue + 'App' : null,
        onChanged: onChangeFunction);
  }
}

class NestedCreateEvent extends StatefulWidget {
  const NestedCreateEvent({super.key});

  @override
  State<NestedCreateEvent> createState() => _NestedCreateEventState();
}

class _NestedCreateEventState extends State<NestedCreateEvent> {
  int activeStepNumber = 0;
  int itemCount = 0;

  updateActiveStep({required int comingActiveStep}) {
    setState(() {
      activeStepNumber = comingActiveStep;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        scffoldBg: AppColors.TRANSPARENT_COLOR,
        appBar: customAppBar(
            onTap: () {
              if (activeStepNumber == 0) {
                AppNavigation.navigatorPop(context);
              } else if (activeStepNumber == 1) {
                activeStepNumber--;
              } else if (activeStepNumber == 2) {
                activeStepNumber--;
              }
              setState(() {});
            },
            context: context,
            isLeadingBack: true,
            title: AppStrings.CREATE_EVENT),
        body: Column(
          children: [
            IndexedStack(
              index: activeStepNumber,
              children: [
                //!---1 Setp
                wantToBuyArtKits(onYesTap: () {
                  activeStepNumber++;
                  setState(() {});
                }),
                //!----2 Setp
                numberOfArtKits(),
                //!----3 Setp
                // studentStepThreeData(),
              ],
            ),
          ],
        ));
  }

  Widget wantToBuyArtKits({required Function() onYesTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.ph,
        CustomText(
          text: 'Do you want to buy Art kits?',
          fontColor: Constants.primaryTextThemeColor(context: context),
          fontSize: 16.sp,
          maxLines: 2,
          fontFamily: AppFonts.JONES_MEDIUM,
        ),
        20.ph,
        CustomText(
          text: 'Disclaimer!',
          fontColor: Constants.primaryTextThemeColor(context: context),
          fontSize: 14.sp,
          maxLines: 2,
          fontFamily: AppFonts.JONES_MEDIUM,
        ),
        10.ph,
        CustomText(
          text: 'Please review your order carefully before confirming',
          fontColor: Constants.primaryTextThemeColor(context: context),
          fontSize: 14.sp,
          maxLines: 2,
          textAlign: TextAlign.start,
          fontFamily: AppFonts.JONES_LIGHT,
        ),
        20.ph,
        CustomButton(verticalPadding: 10.h, onTap: onYesTap, title: 'Yes'),
        10.ph,
        CustomButton(
            verticalPadding: 10.h,
            containerColor: Constants.isDarkTheme(context: context)
                ? AppColors.BLACK_COLOR
                : AppColors.WHITE_COLOR,
            borderColor: Constants.isDarkTheme(context: context)
                ? AppColors.WHITE_COLOR
                : AppColors.PINK_COLOR,
            fontColor: Constants.isDarkTheme(context: context)
                ? AppColors.WHITE_COLOR
                : AppColors.PINK_COLOR,
            onTap: () {},
            title: 'No'),
      ],
    );
  }

  Widget numberOfArtKits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        10.ph,
        CustomText(
          text: 'How many Art Kits do you need?',
          fontColor: Constants.primaryTextThemeColor(context: context),
          fontSize: 16.sp,
          maxLines: 2,
          fontFamily: AppFonts.JONES_MEDIUM,
        ),
        20.ph,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 6.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.r),
              border: Border.all(
                color: Constants.isDarkTheme(context: context)
                    ? AppColors.WHITE_COLOR
                    : AppColors.ORANGE_COLOR,
              )),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (itemCount > 1) {
                      itemCount--;
                      setState(() {});
                    }
                  },
                  child: const Icon(Icons.remove),
                ),
              ),
              Text(itemCount.toString().padLeft(2, '0')),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    itemCount++;
                    setState(() {});
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ],
          ),
        ),
        20.ph,
        CustomButton(
            verticalPadding: 10.h,
            onTap: () {
              Get.to(() => CartScreen());
              // AppNavigation.navigateToRemovingAll(
              //     context, AppRouteName.MAIN_MENU_SCREEN);
              // AppDialogs.showToast(message: 'Event Craeted Sucessfull');
            },
            title: 'Next'),
      ],
    );
  }
}
