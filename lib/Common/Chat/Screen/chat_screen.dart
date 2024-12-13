import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Utils/date_time_manager.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_container_border.dart';
import '../../../Widgets/cs_search_bar.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/user_avatar_widget.dart';
import '../../Splash/Controller/splash_controller.dart';
import '../Model/chat_messages_model.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatThreadData> chatDataList = [
    ChatThreadData(
      firstName: "Lisa",
      lastName: "Mira",
      profileImage: AssetPaths.TEMP_PROFILE1_IMAGES,
      id: 3,
      conversationId: 2,
      senderId: 1,
      receiverId: 16,
      type: "text",
      message: "I'm good, thanks for asking!",
      readAt: "2024-07-10T09:00:00.000Z",
      status: "read",
      createdAt: '2024-07-10T09:15:00.000Z',
      updatedAt: null,
    ),
    ChatThreadData(
      firstName: "Bob",
      lastName: "Miller",
      profileImage: AssetPaths.TEMP_PROFILE_IMAGES,
      id: 4,
      conversationId: 3,
      senderId: 16,
      receiverId: 1,
      type: "image",
      message: "Check out this photo!",
      readAt: null,
      status: null,
      createdAt: '2024-07-10T09:15:00.000Z',
      updatedAt: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: customAppBar(
          context: context, isLeadingBack: true, title: AppStrings.MESSAGE),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!---Search Bar
            CustomContainerBorderWidget(
              padding: EdgeInsets.zero,
              bgColor: AppColors.TRANSPARENT_COLOR,
              borderRadius: 50.r,
              oppacityValue:
                  Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
              child: CustomSearchAndFilter(
                isfilter: false,
                searchController: TextEditingController(),
                hint: AppStrings.SEARCH,
                onChange: (value) {},
              ),
            ),
            10.ph,
            CustomText(
              text: AppStrings.ACTIVITIES,
              fontSize: 18.sp,
              fontColor: Constants.primaryTextThemeColor(context: context),
              textAlign: TextAlign.start,
              fontFamily: AppFonts.JONES_BOLD,
            ),
            10.ph,
            SizedBox(
              height: 80.h,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: activitesWidget());
                  }),
            ),
            10.ph,
            CustomText(
              text: AppStrings.MESSAGE,
              fontSize: 18.sp,
              fontColor: Constants.primaryTextThemeColor(context: context),
              textAlign: TextAlign.start,
              fontFamily: AppFonts.JONES_BOLD,
            ),
            10.ph,
            for (ChatThreadData chatData in chatDataList) ...[
              _chatContainer(chatData: chatData),
            ]
          ],
        ),
      ),
    );
  }

  Widget activitesWidget() {
    return SizedBox(
      width: 52.h,
      child: Column(
        children: [
          CustomCicrleAvatarWidget(
            circularColor: Constants.themeButton(context: context),
            imgPath: AssetPaths.TEMP_EVENT_IMAGES,
            radius: 50.h,
            isExtendedImage: false,
          ),
          6.ph,
          CustomText(
            text: 'Emma',
            fontSize: 16.sp,
            fontColor: Constants.primaryTitleTextThemeColor(context: context),
            textAlign: TextAlign.start,
            fontFamily: AppFonts.JONES_MEDIUM,
          ),
        ],
      ),
    );
  }

  Widget _chatContainer({required ChatThreadData chatData}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatDetailScreen());
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(color: AppColors.TRANSPARENT_COLOR),
            child: Row(
              children: [
                CustomCicrleAvatarWidget(
                  imgPath: chatData.profileImage,
                  radius: 40.h,
                  isExtendedImage: false,
                  circularColor: Constants.themeButton(context: context),
                ),
                10.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: chatData.firstName,
                              fontSize: 14.sp,
                              textAlign: TextAlign.start,
                              fontColor: Constants.primaryTextThemeColor(
                                  context: context),
                              fontFamily: AppFonts.JONES_MEDIUM,
                            ),
                          ),
                          CircleAvatar(
                            radius: 10.r,
                            backgroundColor:
                                Constants.isDarkTheme(context: context)
                                    ? AppColors.ORANGE_COLOR
                                    : AppColors.BLACK_COLOR,
                            child: Center(
                              child: CustomText(
                                text: '1',
                                fontSize: 10.sp,
                                fontColor: AppColors.WHITE_COLOR,
                                fontFamily: AppFonts.JONES_REGULAR,
                              ),
                            ),
                          ),
                        ],
                      ),
                      4.ph,
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: chatData.message,
                              fontSize: 10.sp,
                              textAlign: TextAlign.start,
                              fontColor: Constants.primaryTextThemeColor(
                                  context: context),
                              fontFamily: AppFonts.JONES_LIGHT,
                            ),
                          ),
                          3.pw,
                          CustomText(
                            text: DateTimeManager.timeAgoMethod(
                                createdDate: chatData.createdAt ?? ''),
                            fontSize: 10.sp,
                            fontColor: Constants.primaryTextThemeColor(
                                context: context),
                            fontFamily: AppFonts.JONES_LIGHT,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
            height: 10.0,
            color: AppColors.MEDIUM_BLACK_COLOR,
          )
        ],
      ),
    );
  }
}
