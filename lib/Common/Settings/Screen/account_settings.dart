// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:giftify/Utils/extensions.dart';
// import 'package:giftify/Widgets/cs_appbar.dart';
// import 'package:giftify/Widgets/custom_scaffold.dart';

// import '../../../Utils/app_colors.dart';
// import '../../../Utils/app_fonts.dart';
// import '../../../Utils/app_strings.dart';
// import '../../../Widgets/custom_text.dart';

// class AccountSettingScreen extends StatefulWidget {
//   const AccountSettingScreen({
//     super.key,
//   });

//   @override
//   State<AccountSettingScreen> createState() => _AccountSettingScreenState();
// }

// class _AccountSettingScreenState extends State<AccountSettingScreen> {
//   var selectedItem = '';

//   List<String> accountSettings = [
//     'Profile Privacy',
//     'Whishlist privacy',
//     'Child Whishlist Privacy'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       appBar: customAppBar(
//           context: context,
//           isLeadingBack: true,
//           title: AppStrings.ACCOUNT_SETTINGS),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           for (String name in accountSettings) ...[
//             rowWidget(title: name, isIcon: false, onTap: () {}),
//             10.ph,
//           ]
//         ],
//       ),
//     );
//   }

//   Widget popupWidget() {
//     return PopupMenuButton(
//         onSelected: (value) {
//           // your logic
//           setState(() {
//             selectedItem = value.toString();
//           });
//           print(value);
//           // Navigator.pushNamed(context, value.toString());
//         },
//         icon: const Icon(
//           Icons.keyboard_arrow_down_rounded,
//           size: 30,
//           color: AppColors.WHITE_COLOR,
//         ),
//         itemBuilder: (BuildContext bc) {
//           return [
//             PopupMenuItem(
//               value: '',
//               child: Row(
//                 children: [
//                   const Expanded(child: Text("Public")),
//                   Transform.scale(
//                     scale: 0.7,
//                     child: CupertinoSwitch(
//                       activeColor: AppColors.BLACK_COLOR,
//                       value: true,
//                       onChanged: (value) {},
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             PopupMenuItem(
//               value: '',
//               child: Row(
//                 children: [
//                   const Expanded(child: Text("Private")),
//                   Transform.scale(
//                     scale: 0.7,
//                     child: CupertinoSwitch(
//                       activeColor: AppColors.GREY_COLOR,
//                       value: false,
//                       onChanged: (value) {},
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ];
//         });
//   }

//   Widget rowWidget(
//       {required String title,
//       required void Function() onTap,
//       required bool isIcon}) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
//       decoration: BoxDecoration(
//         color: AppColors.BLACK_COLOR,
//         borderRadius: BorderRadius.circular(50.r),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: CustomText(
//               text: title,
//               textAlign: TextAlign.start,
//               fontSize: 16.sp,
//               fontColor: AppColors.WHITE_COLOR,
//               fontFamily: AppFonts.MONTSERRAT_MEDIUM,
//             ),
//           ),
//           popupWidget()
//         ],
//       ),
//     );
//   }
// }
