import 'dart:io';
import 'package:artgig/Common/Chat/Screen/chat_screen.dart';
import 'package:artgig/Common/Notifications/Screens/notification_screen.dart';
import 'package:artgig/Common/Role_Selection/Controller/role_controller.dart';
import 'package:artgig/Common/Settings/Screen/settings_screen.dart';
import 'package:artgig/Module/Event/Screen/create_event_screen.dart';
import 'package:artgig/Utils/app_constants.dart';
import 'package:artgig/Utils/app_fonts.dart';
import 'package:artgig/Utils/extensions.dart';
import 'package:artgig/Widgets/no_data_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/app_colors.dart';
import '../../../Utils/app_dialogs.dart';
import '../../../Utils/app_navigation.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Widgets/Bottom_Navigation/bottom_navigation.dart';
import '../../../Widgets/Bottom_Navigation/bottom_navigation_controller.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_drawer_widget.dart';
import '../../../Widgets/cs_filter_bt_sheet.dart';
import '../../../Widgets/custom_button.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../Event/Screen/event_listing.dart';
import '../../../Common/Profile/host_profile.dart';
import '../../Event_History/Screen/event_history.dart';
import '../../PaymentCard/Screen/payment_method_screen.dart';
import '../../Shop/Screen/product_listing.dart';
import '../../order_sucess_screen.dart';
import '../Controller/main_controller.dart';

class MainMenuScreen extends StatelessWidget {
  MainMenuScreen({super.key});
  final bottomNavigationController =
      Get.isRegistered<BottomNavigationController>()
          ? Get.find<BottomNavigationController>()
          : Get.put(BottomNavigationController());
  final initMainController = Get.put(MainController());

  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>(); //drawer

  final List<Widget> screensList = [
    EventListingScreen(),
    EventHistoryScreen(),
    HostProfileScreen(isFromMainMenu: true),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // log('IS USEE ${RoleController.i.fromUser.value}');
    return WillPopScope(
      onWillPop: () async {
        return await AppDialogs().showOptionsDialog(
            headertitle: AppStrings.EXIT,
            title: '${AppStrings.ARE_YOU_SURE} \n exit an app?',
            haveTwoButton: true,
            b1Text: AppStrings.CANCEL,
            b2Text: AppStrings.EXIT,
            imagePath: AssetPaths.LOGOUT_ICON,
            b1onTap: () {
              AppNavigation.navigatorPop(context);
            },
            b2onTap: () {
              exit(0);
            },
            context: context);
      },
      child: Obx(
        () => CustomScaffold(
          scffoldKey: _scaffoldKey,
          drawer: CustomDrawerWidget(scffoldKey: _scaffoldKey),
          bottomNavBarPadding: EdgeInsets.zero,
          appBar: customAppBar(
              context: context,
              isLeadingBack: false,
              title: titleSwitchCase(
                  bottomNavigationController.selectedIndex.value),
              actionWidget: actionWidget(context: context),
              leadingWidget: leadingWidget(context: context),
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              }),
          floatingActionButton: floatingActionWidget(context: context),
          extendedBoy: true,
          body: screensList
              .elementAt(bottomNavigationController.selectedIndex.value),
          bottomNavigationBar: BottomNavigationBarWidget(),
        ),
      ),
    );
  }

  String titleSwitchCase(
    int index,
  ) {
    String data = AppStrings.HOME;
    switch (index) {
      case 0:
        data =
            RoleController.isArtist() ? AppStrings.HOME : AppStrings.MY_EVENT;
        break;
      case 1:
        data = AppStrings.HISTORY;
        break;
      case 2:
        data = AppStrings.PROFILE;
        break;
      case 3:
        data = AppStrings.SETTINGS;
        break;
    }
    return data;
  }

  Widget actionWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 14, 10),
      child: Row(
        children: [
          bottomNavigationController.selectedIndex.value == 0
              ? GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      // barrierLabel: 'sad',
                      enableDrag: true,
                      isDismissible: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(0.08.sw),
                        ),
                      ),
                      backgroundColor: AppColors.WHITE_COLOR,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomFilterBottomSheet();
                      },
                    );
                  },
                  child: Image.asset(
                    AssetPaths.FILTER_ICON,
                    height: 21.h,
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    Get.to(() => ChatScreen());
                  },
                  child: Image.asset(
                    AssetPaths.MESSAGE_ICON,
                    height: 21.h,
                  ),
                ),
          10.pw,
          GestureDetector(
            onTap: () {
              Get.to(() => NotificationScreen());
            },
            child: Image.asset(
              AssetPaths.NOTIFICATION_ICON,
              height: 22.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget floatingActionWidget({required BuildContext context}) {
    return (RoleController.i.selectedRole.value == AppStrings.USER &&
            bottomNavigationController.selectedIndex.value == 0)
        ? SizedBox(
            height: 40.h,
            width: 100.h,
            child: CustomButton(
              verticalPadding: 0.0,
              title: 'Create Event',
              onTap: () {
                AppDialogs().showEventTypeDialog(context, onTap: () {
                  AppNavigation.navigatorPop(context);
                  Get.to(() => CreateEventScreen());
                });
              },
              fontSize: 14.sp,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget leadingWidget({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 14, 10),
      child: Image.asset(
        AssetPaths.DRAWER_ICON,
        height: 22.h,
        color: AppColors.ORANGE_COLOR,
      ),
    );
  }
}
