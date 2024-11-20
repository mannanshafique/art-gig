import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_strings.dart';
import '../Utils/asset_paths.dart';
import 'custom_textfield.dart';

class CustomSearchAndFilter extends StatelessWidget {
  CustomSearchAndFilter(
      {required this.isfilter,
      required this.onChange,
      required this.searchController,
      this.isReadOnly,
      this.onSuffixTap,
      this.hint,
      super.key});
  final bool isfilter;
  final bool? isReadOnly;
  final String? hint;
  final Function(String)? onChange;
  final Function()? onSuffixTap;

  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomTextField(
            divider: false,
            label: false,
            // onTap: onSuffixTap,
            readOnly: isReadOnly ?? false,
            inputFormatters: [LengthLimitingTextInputFormatter(30)],
            hint: hint ?? AppStrings.SEARCH,
            suffixIcon: AssetPaths.CAMERA_ICON,
            isSuffixIcon: true,
            onchange: onChange,
            bgColor: AppColors.WHITE_COLOR,
            labelColor: AppColors.GREY_COLOR,
            controller: searchController,
            isDense: true,
          ),
        ),
        isfilter
            ? const SizedBox(
                width: 8,
              )
            : const SizedBox.shrink(),
        Visibility(
          visible: isfilter,
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
            decoration: BoxDecoration(
                color: AppColors.WHITE_COLOR,
                borderRadius: BorderRadius.circular(30.0)),
            child: InkWell(
              onTap: onSuffixTap ?? () {},
              child: Image.asset(
                AssetPaths.CAMERA_ICON,
                scale: 3.9,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
