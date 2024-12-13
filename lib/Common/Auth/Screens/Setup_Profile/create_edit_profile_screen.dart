import 'package:artgig/Common/Role_Selection/Controller/role_controller.dart';
import 'package:artgig/Common/Splash/Controller/splash_controller.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:place_picker/place_picker.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_constants.dart';
import '../../../../Utils/app_dialogs.dart';
import '../../../../Utils/app_padding.dart';
import '../../../../Utils/app_strings.dart';
import '../../../../Utils/app_validator.dart';
import '../../../../Widgets/cs_bottom_navg_button.dart';
import '../../../../Widgets/cs_container_border.dart';
import '../../../../Widgets/custom_auth_scaffold.dart';
import '../../../../Widgets/custom_drop_down_widget.dart';
import '../../../../Widgets/custom_image_preview.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../../Widgets/custom_textfield.dart';
import '../../../../Widgets/user_avatar_widget.dart';
import '../../Controller/auth_controller.dart';
import 'tutorial_guide_screen.dart';

class CreateEditProfileScreen extends StatefulWidget {
  CreateEditProfileScreen({super.key, required this.isFromEdit});

  final bool isFromEdit;

  @override
  State<CreateEditProfileScreen> createState() =>
      _CreateEditProfileScreenState();
}

class _CreateEditProfileScreenState extends State<CreateEditProfileScreen> {
  final AuthController authController = Get.isRegistered<AuthController>()
      ? Get.find<AuthController>()
      : Get.put(AuthController());

  @override
  void initState() {
    settingValues();
    super.initState();
  }

  List<ImageModel> selectedMediaPath = <ImageModel>[];

  void setSelectedImage(String imagePath) {
    if (selectedMediaPath.isNotEmpty) {
      selectedMediaPath[0] = ImageModel(path: imagePath, type: 'File');
    } else {
      selectedMediaPath.add(ImageModel(path: imagePath, type: 'File'));
    }
    setState(() {});
  }

  void settingValues() {
    if (widget.isFromEdit) {
      // UserDataModel? userData = SplashController.i.currentUser.value;
      // authController.firstNameEditingController.text =
      //     userData?.firstName ?? '';
      // authController.lastNameEditingController.text = userData?.lastName ?? '';
      // authController.emailEditingController.text = userData?.email ?? '';
      // authController.phNoEditingController.text = userData?.phone ?? '';
      // authController.locationEditingController.text = userData?.address ?? '';
      // authController.cityEditingController.text = userData?.city ?? '';
      // authController.stateEditingController.text = userData?.state ?? '';
      // authController.pickedProfileImagePath.value = userData?.imageName ?? '';

      authController.emailEditingController.text =
          'user@example.com'; // Prefill email
      authController.phNoEditingController.text =
          '123-456-7890'; // Prefill phone number
      authController.fullNameEditingController.text =
          'John'; // Prefill first name
      authController.locationEditingController.text =
          '123 Main St'; // Prefill location  MM-DD-YYYY
      authController.dateOfBirthEditingController.text = '06-24-1999';
      authController.genderEditingController.text = AppStrings.MALE;
      authController.descriptionEditingController.text =
          'having expertise in painting';
      AuthController.i.hourlyRateEditingController.text = '12';
    }
  }

  void creatingProfileApiFunction({required bool isFromEdit}) {
    // UserCompleteProfileBloc().userprofileBlocMethod(
    //   context: context,
    //   setProgressBar: () {
    //     AppDialogs.progressAlertDialog(context: context);
    //   },
    //   firstName: authController.firstNameEditingController.text,
    //   lastName: authController.lastNameEditingController.text,
    //   address: authController.locationEditingController.text,
    //   phoneNumber: authController.phNoEditingController.text,
    //   profileImage: authController.pickedProfileImagePath.value,
    //   careerInterests: authController.selectedCareerInterest,
    //   city: authController.cityEditingController.text,
    //   countryCode: 'US',
    //   isoCode: '+1',
    //   dateOfBirth: authController.dateOfBirthEditingController.text,
    //   designation: authController.designationEditingController.text,
    //   email: authController.emailEditingController.text,
    //   gender: authController.genderEditingController.text,
    //   gpaValue: authController.gpaEditingController.text,
    //   gradeLevel: authController.gradeLevelEditingController.text,
    //   institueName: authController.institueNameEditingController.text,
    //   state: authController.stateEditingController.text,
    //   zip: authController.zipEditingController.text,
    //   isEditProfile: isFromEdit,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      isLeading: true,
      showLogo: false,
      appBarTitle: widget.isFromEdit
          ? AppStrings.EDIT_PROFILE
          : AppStrings.CREATE_PROFILE,
      bottomNavigationWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
        child: CustomBottomNavigationWidget(
          buttonTitle:
              widget.isFromEdit ? AppStrings.UPDATE : AppStrings.CONTINUE,
          onTap: () {
            Constants.unFocusKeyboardMethod(context: context);
            // validateCreateProfile
            bool isValidate = FieldValidator().validateCreateProfile(
                AuthController.i.fullNameEditingController.text,
                AuthController.i.emailEditingController.text,
                AuthController.i.locationEditingController.text,
                AuthController.i.phNoEditingController.text,
                AuthController.i.dateOfBirthEditingController.text,
                AuthController.i.genderEditingController.text,
                AuthController.i.descriptionEditingController.text,
                context);
            if (isValidate) {
              if (widget.isFromEdit) {
              } else {
                if (RoleController.i.selectedRole.value == AppStrings.ARTIST) {
                  Get.to(() => const TestOptionSelection());
                } else {
                  AppDialogs().showSucessDialog(context,
                      'You have completed your profile set up successfully.');
                }
              }
            }
          },
        ),
      ),
      // bottomNavigationBar: GetBuilder<SplashController>(builder: (spl) {
      // return CustomBottomNavigationWidget(
      //   buttonTitle: widget.isFromEdit ? AppStrings.UPDATE : AppStrings.NEXT,
      //   onTap: () {
      //     Constants.unFocusKeyboardMethod(context: context);

      //   },
      // );
      // }),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
          child: Column(
            children: [
              10.ph,
              userProfileDetailForm(context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget userProfileDetailForm({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => UserAvatarWidget(
            selectedImgPath: authController.pickedProfileImagePath.value,
            radius: 0.17.sh,
            borderColor: AppColors.BLACK_COLOR,
            setImage: authController.setProfileImage,
            isViewOnly: false,
          ),
        ),
        20.ph,
        _customTextField(
          hint: AppStrings.FULL_NAME,
          textEditingController: AuthController.i.fullNameEditingController,
          keyboardType: TextInputType.text,
          inputFormatters: [
            LengthLimitingTextInputFormatter(Constants.NAME_MAX_LENGHT)
          ],
        ),
        AuthController.i.loginType.value == AppStrings.PHONE_NUMBER
            ? const SizedBox()
            : Column(
                children: [
                  10.ph,
                  _customTextField(
                    hint: AppStrings.EMAIL_ADDRESS,
                    readOnly: AuthController.i.loginType.value ==
                            AppStrings.EMAIL_ADDRESS
                        ? true
                        : false,
                    textEditingController:
                        AuthController.i.emailEditingController,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                          Constants.EMAIL_MAX_LENGTH)
                    ],
                  ),
                ],
              ),
        10.ph,
        _customTextField(
          hint: AppStrings.PHONE_NUMBER,
          readOnly: AuthController.i.loginType.value == AppStrings.PHONE_NUMBER
              ? true
              : false,
          textEditingController: AuthController.i.phNoEditingController,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            LengthLimitingTextInputFormatter(Constants.PHONE_MAX_LENGHT),
            MaskTextInputFormatter(
                mask: '(+1)###-###-####', filter: {"#": RegExp(r'[0-9]')}),
          ],
        ),
        10.ph,
        _customTextField(
          hint: AppStrings.LOCATION,
          readOnly: true,
          textEditingController: AuthController.i.locationEditingController,
          keyboardType: TextInputType.text,
          onTap: () async {
            Constants.unFocusKeyboardMethod(context: context);
            // await authController.getAddress(context);
            LocationResult t = await Constants().showPlacePicker(context);
            AuthController.i.locationEditingController.text =
                t.formattedAddress ?? "";
          },
        ),
        10.ph,
        _customTextField(
          hint: AppStrings.DATE_OF_BIRTH,
          readOnly: true,
          textEditingController: AuthController.i.dateOfBirthEditingController,
          keyboardType: TextInputType.text,
          onTap: () async {
            Constants.unFocusKeyboardMethod(context: context);
            AuthController.i.dateOfBirthEditingController.text =
                await Constants().datePicker(
              context,
              initialDate: DateTime(1970),
              firstDate: DateTime(1970),
              lastDate: DateTime.now(),
            );
          },
        ),
        10.ph,
        customizedDropDown(
            dropDownDataList: [AppStrings.MALE, AppStrings.FEMALE],
            dropDownValue: widget.isFromEdit
                ? authController.genderEditingController.text
                : null,
            hintValue: AppStrings.CHOOSE_GENDER,
            fontSize: 14.sp,
            onChangeFunction: (selectedValue) {
              authController.genderEditingController.text =
                  selectedValue ?? AppStrings.MALE;
            }),
        10.ph,
        if (RoleController.i.selectedRole.value == AppStrings.ARTIST) ...[
          _customTextField(
            textEditingController: AuthController.i.hourlyRateEditingController,
            hint: 'Hourly Rate',
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(4)],
          ),
          10.ph,
        ],
        _customTextField(
          textEditingController: AuthController.i.descriptionEditingController,
          hint: 'Bio',
          keyboardType: TextInputType.text,
          maxLine: 4,
          inputFormatters: [
            LengthLimitingTextInputFormatter(Constants.DESCRIPTION_MAX_LENGTH)
          ],
        ),
        10.ph,
        pictureUploadWidget(),
        10.ph,
      ],
    );
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
    return CustomContainerBorderWidget(
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
    );
  }

  // Widget _customTextField(
  //     {required TextEditingController textEditingController,
  //     required TextInputType keyboardType,
  //     required String hint,
  //     List<TextInputFormatter>? inputFormatters,
  //     bool? readOnly,
  //     Function()? onTap}) {
  //   return CustomTextField(
  //       controller: textEditingController,
  //       keyboardType: keyboardType,
  //       hint: hint,
  //       readOnly: readOnly ?? false,
  //       label: false,
  //       isDense: true,
  //       onTap: onTap,
  //       verticalPadding: 2.0,
  //       bgColor: Constants.isDarkTheme(context: context)
  //           ? AppColors.TRANSPARENT_COLOR
  //           : AppColors.WHITE_COLOR,
  //       borderColor: Constants.isDarkTheme(context: context)
  //           ? AppColors.WHITE_COLOR
  //           : AppColors.TRANSPARENT_COLOR,
  //       textCapitalization: TextCapitalization.none,
  //       inputFormatters: inputFormatters);
  // }

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
