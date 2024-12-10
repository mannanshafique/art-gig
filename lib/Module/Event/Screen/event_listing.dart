import 'package:artgig/Module/Event/Screen/event_details_screen.dart';
import 'package:artgig/Utils/app_colors.dart';
import 'package:artgig/Utils/app_fonts.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Common/Splash/Controller/splash_controller.dart';
import '../../../Utils/app_constants.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../Model/event_model.dart';

class EventListingScreen extends StatelessWidget {
  const EventListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EventCard(
          eventData: EventData(
            imagePath: 'assets/images/im_splash_background_dark.jpg',
            title: 'World Art Events',
            organizerName: 'Robert Smith',
            startTime: '10:00 AM',
            endTime: '09:00 PM',
            description:
                'By providing event organizers with intuitive tools for event creation...',
            eventFee: '\$99.00',
            location: '36 Guild Street London, USA',
          ),
          onAccept: () {
            print('Event Accepted');
          },
          onReject: () {
            print('Event Rejected');
          },
        ),
        EventCard(
          eventData: EventData(
            imagePath: 'assets/images/im_splash_background_dark.jpg',
            title: 'World Art Events',
            organizerName: 'Robert Smith',
            startTime: '10:00 AM',
            endTime: '09:00 PM',
            description:
                'By providing event organizers with intuitive tools for event creation...',
            eventFee: '\$99.00',
            location: '36 Guild Street London, USA',
          ),
          onAccept: () {
            print('Event Accepted');
          },
          onReject: () {
            print('Event Rejected');
          },
        ),
        Switch(
          value: SplashController.i.isDarkMode,
          onChanged: (value) {
            SplashController.i.toggleTheme(value);
          },
        ),
      ],
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
              eventData: eventData,
            ));
      },
      child: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(12.w),
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
                  (havingButtons ?? true)
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
                                        Constants.isDarkTheme(context: context)
                                            ? AppColors.WHITE_COLOR
                                            : AppColors.PINK_COLOR,
                                    fontColor:
                                        Constants.isDarkTheme(context: context)
                                            ? AppColors.WHITE_COLOR
                                            : AppColors.PINK_COLOR,
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
