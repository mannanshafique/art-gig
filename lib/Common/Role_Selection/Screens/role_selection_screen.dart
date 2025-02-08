import 'dart:developer';

import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_route_name.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/Dialog/cs_event_type_choose_dialog.dart';
import '../../../Widgets/custom_auth_scaffold.dart';
import '../../../Widgets/custom_bottom_height_space.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_padding.dart';
import '../Controller/role_controller.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  final RoleController roleController = Get.find<RoleController>();

  String? selectedOption = AppStrings.ARTIST;

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
        appBarTitle: AppStrings.ROLE_SELECTION,
        child: CustomPadding(
          child: Column(children: [
            // _roleSelectionCustomButton(context, title: AppStrings.ARTIST,
            //     onTap: () {
            //   roleController.setRole(comingRole: AppStrings.ARTIST);
            //   AppNavigation.navigateTo(
            //       context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
            // }),
            // 10.ph,
            // _roleSelectionCustomButton(context, title: AppStrings.USER,
            //     onTap: () {
            //   roleController.setRole(comingRole: AppStrings.USER);
            //   AppNavigation.navigateTo(
            //       context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
            // }),
            20.ph,
            CustomRadioListTile<String>(
              value: AppStrings.ARTIST,
              groupValue: selectedOption,
              title: AppStrings.ARTIST_ROLE_TITLE,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            CustomRadioListTile<String>(
              value: AppStrings.USER,
              groupValue: selectedOption,
              title: AppStrings.USER_ROLE_TITLE,
              onChanged: (value) {
                setState(() {
                  selectedOption = value;
                });
              },
            ),
            80.ph,
            _roleSelectionCustomButton(context, title: AppStrings.CONTINUE,
                onTap: () {
              roleController.setRole(comingRole: selectedOption);
              AppNavigation.navigateTo(
                  context, AppRouteName.PRE_LOGIN_SCREEN_ROUTE);
            }),
            10.ph,
            const BottomHeightSpace()
          ]),
        ));
  }

  Widget _roleSelectionCustomButton(
    BuildContext context, {
    required String title,
    required Function() onTap,
  }) {
    return CustomButton(
        borderRadius: 12.0,
        title: title,
        fontFamily: AppFonts.JONES_MEDIUM,
        fontSize: 16.sp,
        containerColor: AppColors.PINK_COLOR,
        fontColor: AppColors.WHITE_COLOR,
        onTap: onTap);
  }
}
