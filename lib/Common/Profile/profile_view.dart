// //!------------------Other profile

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:giftify/Utils/app_colors.dart';
// import 'package:giftify/Utils/app_strings.dart';
// import 'package:giftify/Utils/asset_paths.dart';
// import 'package:giftify/Utils/extensions.dart';
// import 'package:giftify/Widgets/cs_appbar.dart';
// import 'package:giftify/Widgets/custom_button.dart';
// import 'package:giftify/Widgets/custom_scaffold.dart';
// import 'package:giftify/Widgets/custom_text.dart';
// import 'package:giftify/Widgets/user_avatar_widget.dart';

// import '../../Utils/app_fonts.dart';

// class UserProfileScreen extends StatelessWidget {
//   final bool isMyProfile;

//   const UserProfileScreen({super.key, required this.isMyProfile});
//   @override
//   Widget build(BuildContext context) {
//     return isMyProfile == false
//         ? CustomScaffold(
//             appBar: customAppBar(
//                 context: context,
//                 isLeadingBack: true,
//                 title: AppStrings.OTHER_PROFILE),
//             body: profileDataWidget())
//         : profileDataWidget();
//   }

//   Widget profileDataWidget() {
//     return Column(
//       children: [
//         // Profile Header
//         Container(
//           padding: const EdgeInsets.all(16.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12.r),
//             color: AppColors.LIGHT_GREY_COLOR,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomCicrleAvatarWidget(
//                     imgPath: '',
//                     radius: 60.h,
//                     isExtendedImage: true,
//                   ),
//                   20.pw,
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         dataColumn(titleText: '10', subTitleText: 'Posts'),
//                         20.pw,
//                         dataColumn(titleText: '10', subTitleText: 'Posts'),
//                         20.pw,
//                         dataColumn(titleText: '10', subTitleText: 'Posts'),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: 85.h,
//                     child: CustomText(
//                       text: 'Brad;ivosdsdo vosdn',
//                       fontSize: 16.sp,
//                       textAlign: TextAlign.start,
//                       fontColor: AppColors.BLACK_COLOR,
//                       fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
//                     ),
//                   ),
//                   20.pw,
//                   Expanded(
//                       child: followingButtonSwitchCase(isMyProfile ? 2 : 0))
//                 ],
//               ),
//               //!----Buio
//               5.ph,
//               CustomText(
//                 text: 'Bio',
//                 fontSize: 16.sp,
//                 textAlign: TextAlign.start,
//                 fontColor: AppColors.BLACK_COLOR,
//                 fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
//               ),
//               5.ph,
//               CustomText(
//                 text: AppStrings.loremIpsum,
//                 fontSize: 15.sp,
//                 maxLines: 2,
//                 textAlign: TextAlign.start,
//                 fontColor: AppColors.BLACK_COLOR,
//                 fontFamily: AppFonts.MONTSERRAT_REGULAR,
//               ),
//               7.ph,
//               dataRowWithIcon(
//                   iconPath: AssetPaths.LOCATION_ICON, title: '18th street'),
//               7.ph,
//               dataRowWithIcon(
//                   iconPath: AssetPaths.PHONE_ICON, title: '123 456 789 0'),
//               7.ph,
//               dataRowWithIcon(
//                   iconPath: AssetPaths.EMAIL_ICON,
//                   title: 'info@kevinexample.com'),
//             ],
//           ),
//         ),
//         10.ph,
//         // Tabs Section
//         Expanded(child: TabBarSection()),
//       ],
//     );
//   }

//   Widget followingButtonSwitchCase(
//     int index,
//   ) {
//     //!------
//     //0 --- Follow
//     //1 --- Followed
//     //2 --- MyProfile
//     Widget data = Container();
//     switch (index) {
//       case 0:
//         data = Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(child: Container()),
//             Expanded(
//               child: CustomButton(
//                 title: 'Follow',
//                 verticalPadding: 10.h,
//                 fontSize: 14.sp,
//                 containerColor: AppColors.BLACK_COLOR,
//                 onTap: () {},
//               ),
//             ),
//           ],
//         );
//         break;
//       case 1:
//         data = Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Expanded(
//               child: CustomButton(
//                 title: 'Followed',
//                 verticalPadding: 10.h,
//                 fontSize: 14.sp,
//                 containerColor: AppColors.BLACK_COLOR,
//                 onTap: () {},
//               ),
//             ),
//             10.pw,
//             Expanded(
//               child: CustomButton(
//                 title: 'Message',
//                 verticalPadding: 10.h,
//                 fontSize: 14.sp,
//                 containerColor: AppColors.BLACK_COLOR,
//                 onTap: () {},
//               ),
//             ),
//           ],
//         );
//         break;
//       case 2:
//         data = Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(child: Container()),
//             Expanded(
//               child: CustomButton(
//                 title: 'Edit Profile',
//                 verticalPadding: 10.h,
//                 fontSize: 14.sp,
//                 containerColor: AppColors.BLACK_COLOR,
//                 onTap: () {},
//               ),
//             ),
//           ],
//         );
//         break;
//     }
//     return data;
//   }

//   Widget dataRowWithIcon({
//     required String iconPath,
//     required String title,
//   }) {
//     return Row(
//       children: [
//         Image.asset(
//           iconPath,
//           height: 14.h,
//           color: AppColors.BLACK_COLOR,
//         ),
//         8.pw,
//         CustomText(
//           text: title,
//           fontSize: 15.sp,
//           maxLines: 2,
//           textAlign: TextAlign.start,
//           fontColor: AppColors.BLACK_COLOR,
//           fontFamily: AppFonts.MONTSERRAT_REGULAR,
//         ),
//       ],
//     );
//   }

//   Widget dataColumn({
//     required String titleText,
//     required String subTitleText,
//   }) {
//     return Column(
//       children: [
//         CustomText(
//           text: titleText,
//           fontSize: 18.sp,
//           textAlign: TextAlign.start,
//           fontColor: AppColors.BLACK_COLOR,
//           fontFamily: AppFonts.MONTSERRAT_SEMIBOLD,
//         ),
//         5.ph,
//         CustomText(
//           text: subTitleText,
//           fontSize: 14.sp,
//           textAlign: TextAlign.start,
//           fontColor: AppColors.BLACK_COLOR,
//           fontFamily: AppFonts.MONTSERRAT_REGULAR,
//         ),
//       ],
//     );
//   }
// }

// class TabBarSection extends StatefulWidget {
//   const TabBarSection({super.key});

//   @override
//   _TabBarSectionState createState() => _TabBarSectionState();
// }

// class _TabBarSectionState extends State<TabBarSection> {
//   int selectedIndex = 0;

//   List<String> mytablists = [
//     'My Posts',
//     'My Whishlist',
//     'My Interests',
//     'Childern Profile',
//   ];
//   List<String> otherUsertablists = [
//     'Posts',
//     'Whishlist',
//     'Interests',
//     'Childern Profile',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//             height: 40.h,
//             decoration: BoxDecoration(
//                 color: AppColors.LIGHT_GREY_COLOR,
//                 borderRadius: BorderRadius.circular(5.r)),
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: mytablists.length,
//               itemBuilder: (context, index) {
//                 return customToggleButton(
//                     title: mytablists[index],
//                     isSelected: selectedIndex == index ? true : false,
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                     });
//               },
//             )),
//         10.ph,
//         Expanded(
//             child: Container(
//           color: AppColors.AMBER_COLOR,
//           child: Text('css'),
//         ))
//       ],
//     );
//   }

//   Widget customToggleButton(
//       {required String title,
//       required bool isSelected,
//       required Function() onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.all(5.0),
//         padding: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50.r),
//             color: isSelected
//                 ? AppColors.BLACK_COLOR
//                 : AppColors.LIGHT_GREY_COLOR),
//         child: Center(
//           child: CustomText(
//               text: title,
//               textAlign: TextAlign.start,
//               fontSize: 15.sp,
//               fontColor:
//                   isSelected ? AppColors.WHITE_COLOR : AppColors.BLACK_COLOR,
//               fontFamily: AppFonts.MONTSERRAT_MEDIUM),
//         ),
//       ),
//     );
//   }
// }
