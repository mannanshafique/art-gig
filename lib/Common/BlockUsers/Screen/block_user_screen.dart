import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/no_data_found_widget.dart';
import '../../../Widgets/user_avatar_widget.dart';
import '../Model/block_user_model.dart';

class BlockedUserScreen extends StatefulWidget {
  const BlockedUserScreen({
    super.key,
  });

  @override
  State<BlockedUserScreen> createState() => _BlockedUserScreenState();
}

class _BlockedUserScreenState extends State<BlockedUserScreen> {
  List<BlockUserData> blockedUser = [
    BlockUserData(
      id: 1,
      fullName: "John Doe",
      profileImage: "profile_image/john_doe.jpg",
      isBlocked: 1,
    ),
    BlockUserData(
      id: 2,
      fullName: "Jane Smith",
      profileImage: "profile_image/jane_smith.jpg",
      isBlocked: 1,
    ),
    BlockUserData(
      id: 3,
      fullName: "Robert Johnson",
      profileImage: "profile_image/robert_johnson.jpg",
      isBlocked: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: customAppBar(
            context: context,
            isLeadingBack: true,
            title: AppStrings.BLOCK_USERS),
        body: RefreshIndicator(
          onRefresh: () async {
            // fetchNotification();
          },
          child: blockedUser.isEmpty
              ? NoDataFoundWidget(
                  havingScroll: true,
                  height: Constants().fullScreenSize / 1.2,
                )
              : ListView.builder(
                  itemCount: blockedUser.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        children: [
                          CustomCicrleAvatarWidget(
                            imgPath: blockedUser[index].profileImage ?? '',
                            radius: 40.h,
                            isExtendedImage: true,
                          ),
                          10.pw,
                          Expanded(
                            child: CustomText(
                              // text: 'Name',
                              text: (blockedUser[index].fullName ?? "")
                                  .capitalizeFirst,
                              fontSize: 14.sp,
                              textAlign: TextAlign.start,
                              fontColor: AppColors.BLACK_COLOR,
                              fontFamily: AppFonts.JONES_BOLD,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: AppColors.BLACK_COLOR),
                            child: CustomText(
                              text: AppStrings.UNBLOCK,
                              fontSize: 14.sp,
                              fontColor: AppColors.WHITE_COLOR,
                              fontFamily: AppFonts.JONES_MEDIUM,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
        ));
  }
}
