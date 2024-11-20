import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/date_time_manager.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/no_data_found_widget.dart';
import '../../../Widgets/user_avatar_widget.dart';
import '../Model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    super.key,
  });

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationData> notificationData = [
    NotificationData(
      id: 1,
      senderId: 2,
      receiverId: 15,
      type: "Accepted",
      postId: 2,
      message: "Lorem Ipsum dollor smit",
      readAt: "2024-07-05 07:52:59",
      createdAt: '2024-07-07T07:50:00.000000Z',
      updatedAt: "2024-07-05T07:52:59.000000Z",
      user: UserData(
        id: 2,
        firstName: "alpha",
        lastName: "dsfasd",
        profileImage:
            "profile_image/9RxjuxPpcUoQf4xaHEK4gZRhGZPIIJbywNvakljR.jpg",
      ),
    ),
    NotificationData(
      id: 2,
      senderId: 3,
      receiverId: 15,
      type: "Commented",
      postId: 3,
      message: "Someone commented on your post.",
      readAt: null,
      createdAt: "2024-07-06T10:00:00.000000Z",
      updatedAt: "2024-07-06T10:05:00.000000Z",
      user: UserData(
        id: 3,
        firstName: "beta",
        lastName: "example",
        profileImage: "profile_image/7abcxyz.jpg",
      ),
    ),
    NotificationData(
      id: 3,
      senderId: 4,
      receiverId: 15,
      type: "Liked",
      postId: 4,
      message: "Your post has been liked.",
      readAt: "2024-07-07T08:00:00.000000Z",
      createdAt: "2024-07-07T07:50:00.000000Z",
      updatedAt: "2024-07-07T08:00:00.000000Z",
      user: UserData(
        id: 4,
        firstName: "gamma",
        lastName: "tester",
        profileImage: "profile_image/test123.jpg",
      ),
    ),
  ];

  // fetchNotification() {
  //   GetNotificationBloc().getNotificationBlocMethod(
  //       context: context,
  //       setProgressBar: () {
  //         AppDialogs.progressAlertDialog(context: context);
  //       },
  //       notificationData: (value) {
  //         notificationData.assignAll(value);
  //         setState(() {});
  //       });
  // }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // fetchNotification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: customAppBar(
            context: context,
            isLeadingBack: true,
            title: AppStrings.NOTIFICATIONS),
        body: RefreshIndicator(
          onRefresh: () async {
            // fetchNotification();
          },
          child: notificationData.isEmpty
              ? NoDataFoundWidget(
                  havingScroll: true,
                  height: Constants().fullScreenSize / 1.2,
                )
              : ListView.builder(
                  itemCount: notificationData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: AppColors.LIGHT_GREY_COLOR.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Row(
                        children: [
                          CustomCicrleAvatarWidget(
                            imgPath:
                                notificationData[index].user?.profileImage ??
                                    '',
                            radius: 40.h,
                            isExtendedImage: true,
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
                                        // text: 'Name',
                                        text:
                                            ('${notificationData[index].user?.firstName ?? ''} ${notificationData[index].user?.lastName ?? ''}')
                                                .capitalizeFirst,
                                        fontSize: 14.sp,
                                        textAlign: TextAlign.start,
                                        fontColor: AppColors.BLACK_COLOR,
                                        fontFamily: AppFonts.MONTSERRAT_BOLD,
                                      ),
                                    ),
                                    CustomText(
                                      text: DateTimeManager.timeAgoMethod(
                                          createdDate: notificationData[index]
                                                  .createdAt ??
                                              ''),
                                      fontSize: 12.sp,
                                      fontColor: AppColors.BLACK_COLOR,
                                      fontFamily: AppFonts.MONTSERRAT_REGULAR,
                                    ),
                                  ],
                                ),
                                5.ph,
                                CustomText(
                                  text: notificationData[index].message,
                                  fontSize: 12.sp,
                                  textAlign: TextAlign.start,
                                  fontColor: AppColors.BLACK_COLOR,
                                  fontFamily: AppFonts.MONTSERRAT_REGULAR,
                                ),
                              ],
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
