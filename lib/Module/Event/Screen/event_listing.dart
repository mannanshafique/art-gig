import 'package:artgig/Common/Role_Selection/Controller/role_controller.dart';
import 'package:artgig/Module/Event/Screen/event_details_screen.dart';
import 'package:artgig/Module/MainMenu/Controller/main_controller.dart';
import 'package:artgig/Utils/app_colors.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Utils/app_constants.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_text.dart';
import '../Model/event_model.dart';

class EventListingScreen extends StatelessWidget {
  const EventListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: MainController.i.eventDataList.length,
      itemBuilder: (context, index) {
        return EventCard(
          havingButtons: true,
          eventData: MainController.i.eventDataList[index],
          onAccept: () {
            print('Event Accepted');
          },
          onReject: () {
            print('Event Rejected');
          },
        );
      },
    );
  }
}

class EventCard extends StatelessWidget {
  final EventData? eventData;
  final VoidCallback onAccept;
  final VoidCallback onReject;
  final bool? havingButtons;

  const EventCard(
      {super.key,
      required this.eventData,
      required this.onAccept,
      required this.onReject,
      this.havingButtons});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => EventDetailScreen(
              havingButton: havingButtons ?? false,
              eventData: eventData,
            ));
      },
      child: Container(
        padding: EdgeInsets.all(12.w),
        margin: EdgeInsets.symmetric(horizontal: 1.h, vertical: 5.h),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
              color: Constants.isDarkTheme(context: context)
                  ? AppColors.WHITE_COLOR
                  : AppColors.TRANSPARENT_COLOR),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Event Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                eventData?.imagePath ?? "",
                height: 130.h,
                width: 80.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12.w),

            // Event Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  CustomText(
                    text: eventData?.title ?? '',
                    fontSize: 18.sp,
                    fontColor:
                        Constants.primaryTitleTextThemeColor(context: context),
                  ),
                  SizedBox(height: 4.h),

                  // Organizer Name
                  Row(
                    children: [
                      CustomText(
                        text: eventData?.organizerName,
                        fontSize: 14.sp,
                        fontColor:
                            Constants.primaryTextThemeColor(context: context),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),

                  // Description
                  CustomText(
                    text: eventData?.description,
                    fontSize: 13.sp,
                    fontColor:
                        Constants.primaryTextThemeColor(context: context),
                    maxLines: 2,
                    lineSpacing: 1.2,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 6.h),

                  // Event Fee
                  CustomText(
                    text: 'Event Fee: ${eventData?.eventFee}',
                    fontSize: 14.sp,
                    fontColor:
                        Constants.primaryTitleTextThemeColor(context: context),
                  ),
                  4.ph,
                  // Location
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 14.w,
                          color: Constants.isDarkTheme(context: context)
                              ? AppColors.WHITE_COLOR
                              : AppColors.PINK_COLOR),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: CustomText(
                          text: eventData?.location,
                          textAlign: TextAlign.start,
                          fontSize: 12.sp,
                          fontColor: Constants.secondaryTextThemeColor(
                              context: context),
                        ),
                      ),
                    ],
                  ),
                  5.ph,
                  (RoleController.isArtist() && (havingButtons ?? true))
                      ? Row(
                          children: [
                            // Accept Button
                            Expanded(
                              child: CustomButton(
                                  verticalPadding: 10.h,
                                  onTap: () {},
                                  title: 'Accept'),
                            ),
                            5.pw,
                            // Reject Button
                            Expanded(
                                child: CustomButton(
                                    verticalPadding: 10.h,
                                    containerColor:
                                        Constants.isDarkTheme(context: context)
                                            ? AppColors.BLACK_COLOR
                                            : AppColors.WHITE_COLOR,
                                    borderColor:
                                        Constants.themeButton(context: context),
                                    fontColor:
                                        Constants.themeButton(context: context),
                                    onTap: () {},
                                    title: 'Reject')),
                          ],
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
