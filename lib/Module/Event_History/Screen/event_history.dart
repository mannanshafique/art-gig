import 'package:artgig/Utils/app_constants.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Common/Splash/Controller/splash_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../Event/Model/event_model.dart';
import '../../Event/Screen/event_listing.dart';

class EventHistoryScreen extends StatefulWidget {
  const EventHistoryScreen({super.key});

  @override
  State<EventHistoryScreen> createState() => _EventHistoryScreenState();
}

class _EventHistoryScreenState extends State<EventHistoryScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0.04.sw),
            decoration: BoxDecoration(
              color: Constants.isDarkTheme(context: context)
                  ? AppColors.PINK_COLOR.withOpacity(0.6)
                  : AppColors.LIGHT_GREY_COLOR,
              borderRadius: BorderRadius.circular(50.r),
            ),
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: customToggleButton(
                      title: AppStrings.ACTIVE,
                      isSelected: selectedIndex == 0 ? true : false,
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      }),
                ),
                Expanded(
                  child: customToggleButton(
                      title: AppStrings.COMPLETED,
                      isSelected: selectedIndex == 1 ? true : false,
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
        10.ph,
        Expanded(
            child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return EventCard(
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
              havingButtons: false,
              onAccept: () {
                print('Event Accepted');
              },
              onReject: () {
                print('Event Rejected');
              },
            );
          },
        ))
      ],
    );
  }

  Widget customToggleButton(
      {required String title,
      required bool isSelected,
      required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: isSelected
                ? AppColors.PINK_COLOR
                : AppColors.TRANSPARENT_COLOR),
        child: Center(
          child: CustomText(
              text: title,
              textAlign: TextAlign.start,
              fontSize: 15.sp,
              fontColor: AppColors.WHITE_COLOR,
              fontFamily: AppFonts.JONES_MEDIUM),
        ),
      ),
    );
  }
}
