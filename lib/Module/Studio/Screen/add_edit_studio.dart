import 'package:artgig/Module/MainMenu/Controller/main_controller.dart';
import 'package:artgig/Module/Studio/Model/studio_model.dart';
import 'package:artgig/Utils/app_fonts.dart';
import 'package:artgig/Utils/app_navigation.dart';
import 'package:artgig/Utils/app_validator.dart';
import 'package:artgig/Utils/asset_paths.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_dialogs.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_bottom_navg_button.dart';
import '../../../Widgets/cs_container_border.dart';
import '../../../Widgets/custom_image_preview.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/custom_textfield.dart';

class AddEditStudio extends StatefulWidget {
  const AddEditStudio({super.key});

  @override
  State<AddEditStudio> createState() => _AddEditStudioState();
}

class _AddEditStudioState extends State<AddEditStudio> {
  final TextEditingController portfolioTitleEditingController =
      TextEditingController();
  final TextEditingController perHourEditingController =
      TextEditingController();
  final TextEditingController howLongEditingController =
      TextEditingController();

  List<ImageModel> selectedMediaPath = <ImageModel>[];

  void setSelectedImage(String imagePath) {
    if (selectedMediaPath.isNotEmpty) {
      selectedMediaPath[0] = ImageModel(path: imagePath, type: 'File');
    } else {
      selectedMediaPath.add(ImageModel(path: imagePath, type: 'File'));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        scffoldBg: AppColors.TRANSPARENT_COLOR,
        appBar: customAppBar(
            context: context,
            isLeadingBack: true,
            title: AppStrings.CREATE_STUDIO),
        bottomNavigationBar: CustomBottomNavigationWidget(
          buttonTitle: AppStrings.UPLOAD_PORTFOLIO,
          onTap: () {
            bool isValidate = FieldValidator().validatePortfolio(
                portfolioTitleEditingController.text,
                perHourEditingController.text,
                howLongEditingController.text,
                context);
            if (isValidate) {
              MainController.i.studioList.insert(
                  0,
                  StudioModel(
                      portfolioTitle: portfolioTitleEditingController.text,
                      howLong: perHourEditingController.text,
                      imagePath: AssetPaths.TEMP_STUDIO_IMAGES,
                      perHour: howLongEditingController.text));
              AppNavigation.navigatorPop(context);
              AppDialogs.showToast(message: 'Portfoilio Added Sucessfully');
            }
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.ph,
              CustomText(
                text: AppStrings.ADD_PORTFOLIO,
                fontSize: 18.sp,
                fontFamily: AppFonts.JONES_BOLD,
                fontColor: Constants.primaryTextThemeColor(context: context),
              ),
              10.ph,
              _customTextField(
                hint: AppStrings.PORTFOLIO_TITLE,
                textEditingController: portfolioTitleEditingController,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(Constants.NAME_MAX_LENGHT)
                ],
              ),
              _customTextField(
                hint: AppStrings.PER_HOUR,
                textEditingController: perHourEditingController,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(4)],
              ),
              _customTextField(
                hint: AppStrings.HOW_LONG,
                textEditingController: howLongEditingController,
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(2)],
              ),
              10.ph,
              pictureUploadWidget()
            ],
          ),
        ));
  }

  Widget pictureUploadWidget() {
    return GestureDetector(
      onTap: () {
        AppDialogs().showImagePickerDialog(
            isMultiPicked: false,
            context: context,
            pickedImagePathCallback: setSelectedImage);
      },
      child: Column(
        children: [
          CustomContainerBorderWidget(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            bgColor: AppColors.TRANSPARENT_COLOR,
            borderRadius: 12.r,
            oppacityValue: 0.0,
            borderColor: Constants.isDarkTheme(context: context)
                ? AppColors.WHITE_COLOR
                : AppColors.ORANGE_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 20.h,
                  color: Constants.primaryTitleTextThemeColor(context: context),
                ),
                5.pw,
                CustomText(
                  text: 'Upload Picture',
                  fontSize: 16.sp,
                  fontColor:
                      Constants.primaryTitleTextThemeColor(context: context),
                ),
              ],
            ),
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
      String? hint,
      TextInputType? keyboardType,
      int? maxLine,
      Function()? onTap,
      bool? readOnly}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: CustomContainerBorderWidget(
        padding: EdgeInsets.zero,
        bgColor: AppColors.TRANSPARENT_COLOR,
        borderRadius: (maxLine ?? 0) > 1 ? 12.r : 50.r,
        oppacityValue: Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
        child: CustomTextField(
            controller: textEditingController,
            hint: hint ?? '',
            readOnly: readOnly ?? false,
            label: false,
            isDense: true,
            divider: false,
            onTap: onTap,
            maxlines: maxLine,
            borderRadius: (maxLine ?? 0) > 1 ? 12.r : 50.r,
            keyboardType: keyboardType,
            verticalPadding: 2.0,
            bgColor: Constants.isDarkTheme(context: context)
                ? AppColors.TRANSPARENT_COLOR
                : AppColors.WHITE_COLOR,
            borderColor: Constants.isDarkTheme(context: context)
                ? AppColors.WHITE_COLOR
                : AppColors.ORANGE_COLOR,
            textCapitalization: TextCapitalization.none,
            inputFormatters: inputFormatters),
      ),
    );
  }
}
