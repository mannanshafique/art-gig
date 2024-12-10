import 'package:artgig/Utils/app_colors.dart';
import 'package:artgig/Utils/app_fonts.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_constants.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../Splash/Controller/splash_controller.dart';

class SupportHelpScreen extends StatefulWidget {
  @override
  _SupportHelpScreenState createState() => _SupportHelpScreenState();
}

class _SupportHelpScreenState extends State<SupportHelpScreen> {
  List<bool> isVisible = [
    false,
    false,
    false,
    false,
    false
  ]; // Visibility states for each FAQ item

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scffoldBg: AppColors.TRANSPARENT_COLOR,
      appBar: customAppBar(
          context: context,
          isLeadingBack: true,
          title: AppStrings.SUPPORT_HELP),
      bottomNavigationBar: bottomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.ph,
            CustomText(
              text: AppStrings.FAQ,
              fontSize: 20.sp,
              fontFamily: AppFonts.JONES_BOLD,
              fontColor: Constants.primaryTextThemeColor(context: context),
            ),
            10.ph,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5, // Total number of questions
              itemBuilder: (context, index) {
                return Card(
                  elevation: 0.0,
                  color: AppColors.TRANSPARENT_COLOR,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    side:
                        const BorderSide(color: AppColors.PINK_COLOR, width: 1),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        splashColor: AppColors.TRANSPARENT_COLOR,
                        shape: RoundedRectangleBorder(
                            borderRadius: isVisible[index]
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(12.r),
                                    topRight: Radius.circular(12.r))
                                : BorderRadius.circular(12.r)),
                        tileColor: AppColors.PINK_COLOR,
                        title: CustomText(
                            text: "Question ${index + 1}?",
                            fontSize: 16.sp,
                            textAlign: TextAlign.start,
                            fontFamily: AppFonts.JONES_BOLD,
                            fontColor: AppColors.WHITE_COLOR),
                        trailing: Icon(
                          isVisible[index]
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppColors.WHITE_COLOR,
                        ),
                        onTap: () {
                          setState(() {
                            isVisible[index] = !isVisible[index];
                          });
                        },
                      ),
                      Visibility(
                        visible: isVisible[index],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: CustomText(
                            text: AppStrings.loremIpsum,
                            fontSize: 14.sp,
                            textAlign: TextAlign.start,
                            maxLines: 6,
                            fontFamily: AppFonts.JONES_REGULAR,
                            fontColor: Constants.primaryTextThemeColor(
                                context: context),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.support_agent,
              color: Constants.primaryTitleTextThemeColor(context: context)),
          5.pw,
          // CustomText(
          //   text: 'Chat with support',
          //   fontSize: 13.sp,
          //   fontFamily: AppFonts.JONES_REGULAR,
          //   fontColor: Constants.primaryTitleTextThemeColor(context: context),
          // ),
          // 5.pw,
          // CustomText(
          //   text: 'OR',
          //   fontSize: 13.sp,
          //   fontFamily: AppFonts.JONES_REGULAR,
          //   fontColor: Constants.primaryTitleTextThemeColor(context: context),
          // ),
          // const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              // Open email
            },
            child: CustomText(
              text: 'support@email.com',
              fontSize: 13.sp,
              fontFamily: AppFonts.JONES_REGULAR,
              fontColor: Constants.primaryTitleTextThemeColor(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
