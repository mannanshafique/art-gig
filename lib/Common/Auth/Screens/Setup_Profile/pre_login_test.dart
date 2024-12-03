import 'package:artgig/Utils/app_colors.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_constants.dart';
import '../../../../Utils/app_fonts.dart';
import '../../../../Widgets/cs_bottom_navg_button.dart';
import '../../../../Widgets/custom_auth_scaffold.dart';
import '../../../../Widgets/custom_text.dart';
import '../../../Splash/Controller/splash_controller.dart';

class PreLoginTestScreen extends StatefulWidget {
  const PreLoginTestScreen({super.key});

  @override
  State<PreLoginTestScreen> createState() => _PreLoginTestScreenState();
}

class _PreLoginTestScreenState extends State<PreLoginTestScreen> {
  // Sample data for quizzes
  final List<Map<String, dynamic>> quizzes = [
    {'title': 'Quiz 01', 'description': 'Lorem ipsum dolor sit amet...'},
    {'title': 'Quiz 02', 'description': 'Lorem ipsum dolor sit amet...'},
    {'title': 'Quiz 03', 'description': 'Lorem ipsum dolor sit amet...'},
    {'title': 'Quiz 04', 'description': 'Lorem ipsum dolor sit amet...'},
  ];

  // Selected answers for each quiz (null means no selection yet)
  final Map<int, String?> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return CustomAuthScaffold(
      isLeading: true,
      showLogo: false,
      appBarTitle: 'Pre-Login Test',
      bottomNavigationWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
        child: CustomBottomNavigationWidget(
          buttonTitle: 'Complete',
          onTap: () {
            Constants.unFocusKeyboardMethod(context: context);
          },
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
        child: Column(
          children: [
            10.ph,
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quizzes.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: quiz['title'],
                        fontColor: Theme.of(context).textTheme.bodySmall?.color,
                        fontSize: 18.sp,
                        fontFamily: AppFonts.JONES_BOLD,
                      ),
                      const SizedBox(height: 8.0),
                      CustomText(
                        text: quiz['description'],
                        fontColor: Theme.of(context).textTheme.bodySmall?.color,
                        fontSize: 15.sp,
                        fontFamily: AppFonts.JONES_REGULAR,
                      ),
                      const SizedBox(height: 8.0),
                      Column(
                        children: ['Yes', 'No'].map((answer) {
                          return RadioListTile<String>(
                            dense: true,
                            value: answer,
                            groupValue: selectedAnswers[index],
                            onChanged: (value) {
                              setState(() {
                                selectedAnswers[index] = value;
                              });
                            },
                            title: CustomText(
                              text: answer,
                              textAlign: TextAlign.start,
                              fontColor:
                                  Theme.of(context).textTheme.bodySmall?.color,
                              fontSize: 15.sp,
                              fontFamily: AppFonts.JONES_REGULAR,
                            ),
                            activeColor: AppColors.PINK_COLOR,
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
