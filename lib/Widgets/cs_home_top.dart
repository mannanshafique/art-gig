// import 'package:flutter/cupertino.dart';
// import 'package:mecca/Utils/app_colors.dart';
// import 'package:mecca/Utils/app_strings.dart';
// import 'package:mecca/Utils/asset_paths.dart';
// import 'package:mecca/Utils/extensions.dart';
// import 'package:mecca/Widgets/cs_rich_text.dart';
// import 'package:mecca/Widgets/custom_textfield.dart';

// class CustomHomePageTop extends StatelessWidget {
//   const CustomHomePageTop(
//       {super.key,
//       required this.userName,
//       required this.searchEditingController});

//   final String userName;
//   final TextEditingController searchEditingController;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomRichTextWidget(
//           firstText: AppStrings.HELLO,
//           secondText: userName.toUpperCase(),
//         ),
//         10.ph,
//         CustomTextField(
//           divider: false,
//           onTap: () {},
//           readOnly: false,
//           hint: AppStrings.SEARCH,
//           prefxicon: AssetPaths.SEARCH_ICON,
//           prefixIconColor: AppColors.BLACK_COLOR,
//           onchange: (value) {},
//           borderRadius: 12.0,
//           bgColor: AppColors.LIGHT_GREY_COLOR,
//           labelColor: AppColors.BLACK_COLOR,
//           label: false,
//           controller: searchEditingController,
//           isDense: true,
//         ),
//       ],
//     );
//   }
// }
