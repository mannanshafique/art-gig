import 'package:artgig/Common/Splash/Controller/splash_controller.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_constants.dart';
import '../../../../Utils/app_padding.dart';
import '../../../../Utils/app_strings.dart';
import '../../../../Widgets/cs_bottom_navg_button.dart';
import '../../../../Widgets/custom_auth_scaffold.dart';
import '../../../../Widgets/custom_drop_down_widget.dart';
import '../../../../Widgets/custom_textfield.dart';
import '../../../../Widgets/user_avatar_widget.dart';
import '../../Controller/auth_controller.dart';

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
          '123 Main St'; // Prefill location
      authController.cityEditingController.text = 'New York'; // Prefill city
      authController.stateEditingController.text = 'NY'; // Prefill state
      authController.zipEditingController.text = '10001'; // Prefill zip code
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
              Switch(
                value: SplashController.i.isDarkMode,
                onChanged: (value) {
                  SplashController.i.toggleTheme(value);
                },
              ),
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
            // await authController.getAddress(context);
          },
        ),
        10.ph,
        _customTextField(
          hint: AppStrings.GENDER,
          readOnly: true,
          textEditingController: AuthController.i.genderEditingController,
          keyboardType: TextInputType.text,
          onTap: () async {
            Constants.unFocusKeyboardMethod(context: context);
            // await authController.getAddress(context);
          },
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

  // Widget customizedDropDown(
  //     {required List<String> dropDownDataList,
  //     required String hintValue,
  //     required String? dropDownValue,
  //     String? iconPath,
  //     double? fontSize,
  //     required Function(String?)? onChangeFunction}) {
  //   return CustomDropDown2(
  //       dropIconSize: 16.h,
  //       errorBorder: AppColors.RED_COLOR,
  //       hintColor: AppColors.GREY_COLOR,
  //       isBorder: true,
  //       dropDownData: dropDownDataList,
  //       hintText: hintValue,
  //       dropdownValue: dropDownValue,
  //       borderRadius: AppPadding.textFieldBorder,
  //       contentPadding: EdgeInsets.symmetric(
  //         vertical: AppPadding.textFieldVerticalPadding.h,
  //       ),
  //       dropDownWidth: 0.914.sw,
  //       offset: const Offset(-5, -25),
  //       horizontalPadding: 0.w,
  //       buttonPadding: 7.w,
  //       dropDownFontSize: fontSize,
  //       fontSize: fontSize,
  //       borderColor: AppColors.PURPLE_COLOR,
  //       validator: (value) =>
  //           (value == null || value.isEmpty) ? hintValue + 'App' : null,
  //       onChanged: onChangeFunction);
  // }
}
