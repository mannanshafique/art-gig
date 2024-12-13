import 'package:artgig/Module/MainMenu/Controller/main_controller.dart';
import 'package:artgig/Module/Studio/Screen/add_edit_studio.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Common/Splash/Controller/splash_controller.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_bottom_navg_button.dart';
import '../../../Widgets/cs_container_border.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../Model/studio_model.dart';

class StudioListing extends StatefulWidget {
  const StudioListing({super.key});

  @override
  State<StudioListing> createState() => _StudioListingState();
}

class _StudioListingState extends State<StudioListing> {
  final main = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        scffoldBg: AppColors.TRANSPARENT_COLOR,
        appBar: customAppBar(
            context: context,
            isLeadingBack: true,
            title: AppStrings.CREATE_STUDIO),
        bottomNavigationBar: CustomBottomNavigationWidget(
          buttonTitle: AppStrings.UPLOAD_PORTFOLIO,
          onTap: () {
            Get.to(() => const AddEditStudio());
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.ph,
            CustomText(
              text: AppStrings.portfolio,
              fontSize: 18.sp,
              fontFamily: AppFonts.JONES_BOLD,
              fontColor: Constants.primaryTextThemeColor(context: context),
            ),
            10.ph,
            Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: MainController.i.studioList.length,
                      itemBuilder: (context, index) {
                        return studioCard(
                            studioModel: MainController.i.studioList[index]);
                      },
                    ))),
            10.ph,
          ],
        ));
  }

  Widget studioCard({required StudioModel studioModel}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: CustomContainerBorderWidget(
          padding: const EdgeInsets.all(8.0),
          bgColor: Constants.isDarkTheme(context: context)
              ? AppColors.TRANSPARENT_COLOR
              : AppColors.WHITE_COLOR,
          borderColor: Constants.isDarkTheme(context: context)
              ? AppColors.WHITE_COLOR
              : AppColors.ORANGE_COLOR,
          borderRadius: 12.r,
          oppacityValue: Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(12.r),
              //   child: Image.asset(studioModel.imagePath ?? ''),
              // ),
              Image.asset(studioModel.imagePath ?? ''),
              10.ph,
              CustomText(
                text: studioModel.portfolioTitle,
                fontSize: 14.sp,
                fontColor: Constants.primaryTextThemeColor(context: context),
                fontFamily: AppFonts.JONES_BOLD,
              ),
              10.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text:
                        "${AppStrings.HOW_LONG} : ${studioModel.howLong} hours",
                    fontSize: 14.sp,
                    fontColor:
                        Constants.primaryTextThemeColor(context: context),
                    fontFamily: AppFonts.JONES_MEDIUM,
                  ),
                  5.pw,
                  CustomText(
                    text: "${AppStrings.PER_HOUR} : \$${studioModel.perHour}",
                    fontSize: 14.sp,
                    fontColor:
                        Constants.primaryTitleTextThemeColor(context: context),
                    fontFamily: AppFonts.JONES_BOLD,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
