import 'package:artgig/Utils/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widgets/custom_text.dart';

class EventListingScreen extends StatelessWidget {
  const EventListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return EventCard(
            isDarkTheme:
                true, // Switch between true or false for light/dark theme
            imagePath: 'assets/images/im_splash_background_dark.jpg',
            title: 'World Art Events',
            organizerName: 'Robert Smith',
            description:
                'By providing event organizers with intuitive tools for event creation...',
            eventFee: '\$99.00',
            location: '36 Guild Street London, USA',
            onAccept: () {
              print('Event Accepted');
            },
            onReject: () {
              print('Event Rejected');
            },
          );
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final bool isDarkTheme;
  final String imagePath;
  final String title;
  final String organizerName;
  final String description;
  final String eventFee;
  final String location;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const EventCard({
    super.key,
    required this.isDarkTheme,
    required this.imagePath,
    required this.title,
    required this.organizerName,
    required this.description,
    required this.eventFee,
    required this.location,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkTheme ? Colors.black : Colors.white;
    final textColor = isDarkTheme ? Colors.white : Colors.black;
    final secondaryTextColor =
        isDarkTheme ? Colors.grey[400] : Colors.grey[700];

    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
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
              imagePath,
              height: 100.h,
              width: 100.h,
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
                  text: title,
                  fontSize: 18,
                  fontColor: textColor,
                  fontFamily: 'Roboto',
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),

                // Organizer Name
                CustomText(
                  text: organizerName,
                  fontSize: 14,
                  fontColor: secondaryTextColor,
                  fontFamily: 'Roboto',
                ),
                SizedBox(height: 6.h),

                // Description
                CustomText(
                  text: description,
                  fontSize: 14,
                  fontColor: secondaryTextColor,
                  maxLines: 2,
                  fontFamily: 'Roboto',
                ),
                SizedBox(height: 6.h),

                // Event Fee
                CustomText(
                  text: 'Event Fee: $eventFee',
                  fontSize: 14,
                  fontColor: textColor,
                  fontFamily: 'Roboto',
                  weight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),

                // Location
                Row(
                  children: [
                    Icon(Icons.location_on,
                        size: 14.w, color: secondaryTextColor),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: CustomText(
                        text: location,
                        fontSize: 12,
                        fontColor: secondaryTextColor,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Accept Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onAccept,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: CustomText(
                          text: 'Accept',
                          fontSize: 14,
                          fontColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),

                    // Reject Button
                    Expanded(
                      child: OutlinedButton(
                        onPressed: onReject,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.pink, width: 1.5.w),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: CustomText(
                          text: 'Reject',
                          fontSize: 14,
                          fontColor: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Constants.isDarkTheme(context: context)




// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'custom_text.dart';

// class EventCard extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String organizerName;
//   final String description;
//   final String eventFee;
//   final String location;
//   final VoidCallback onAccept;
//   final VoidCallback onReject;

//   const EventCard({
//     super.key,
//     required this.imagePath,
//     required this.title,
//     required this.organizerName,
//     required this.description,
//     required this.eventFee,
//     required this.location,
//     required this.onAccept,
//     required this.onReject,
//   });

//   @override
//   Widget build(BuildContext context) {
//     // Access theme data
//     final theme = Theme.of(context);
//     final backgroundColor = theme.cardColor;
//     final primaryTextColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
//     final secondaryTextColor = theme.textTheme.bodyMedium?.color ?? Colors.grey;

//     return Container(
//       margin: EdgeInsets.all(16.w),
//       padding: EdgeInsets.all(12.w),
//       decoration: BoxDecoration(
//         color: backgroundColor,
//         borderRadius: BorderRadius.circular(12.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 6,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               // Event Image
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10.r),
//                 child: Image.asset(
//                   imagePath,
//                   height: 100.h,
//                   width: 100.h,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SizedBox(width: 12.w),

//               // Event Details
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Title
//                     CustomText(
//                       text: title,
//                       fontSize: 18,
//                       fontColor: primaryTextColor,
//                       fontFamily: 'Roboto',
//                       weight: FontWeight.bold,
//                     ),
//                     SizedBox(height: 4.h),

//                     // Organizer Name
//                     CustomText(
//                       text: organizerName,
//                       fontSize: 14,
//                       fontColor: secondaryTextColor,
//                       fontFamily: 'Roboto',
//                     ),
//                     SizedBox(height: 6.h),

//                     // Description
//                     CustomText(
//                       text: description,
//                       fontSize: 14,
//                       fontColor: secondaryTextColor,
//                       maxLines: 2,
//                       fontFamily: 'Roboto',
//                     ),
//                     SizedBox(height: 6.h),

//                     // Event Fee
//                     CustomText(
//                       text: 'Event Fee: $eventFee',
//                       fontSize: 14,
//                       fontColor: primaryTextColor,
//                       fontFamily: 'Roboto',
//                       weight: FontWeight.bold,
//                     ),
//                     SizedBox(height: 4.h),

//                     // Location
//                     Row(
//                       children: [
//                         Icon(Icons.location_on, size: 14.w, color: secondaryTextColor),
//                         SizedBox(width: 4.w),
//                         Expanded(
//                           child: CustomText(
//                             text: location,
//                             fontSize: 12,
//                             fontColor: secondaryTextColor,
//                             fontFamily: 'Roboto',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 12.h),

//           // Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Accept Button
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: onAccept,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: theme.colorScheme.primary,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.r),
//                     ),
//                   ),
//                   child: CustomText(
//                     text: 'Accept',
//                     fontSize: 14,
//                     fontColor: theme.colorScheme.onPrimary,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 8.w),

//               // Reject Button
//               Expanded(
//                 child: OutlinedButton(
//                   onPressed: onReject,
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(color: theme.colorScheme.primary, width: 1.5.w),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.r),
//                     ),
//                   ),
//                   child: CustomText(
//                     text: 'Reject',
//                     fontSize: 14,
//                     fontColor: theme.colorScheme.primary,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
