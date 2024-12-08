// ignore_for_file: file_names

import 'package:artgig/Utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_constants.dart';
import '../../../Utils/app_fonts.dart';
import '../../../Utils/app_strings.dart';
import '../../../Utils/asset_paths.dart';
import '../../../Utils/date_time_manager.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/cs_container_border.dart';
import '../../../Widgets/custom_scaffold.dart';
import '../../../Widgets/custom_text.dart';
import '../../../Widgets/user_avatar_widget.dart';
import '../../Splash/Controller/splash_controller.dart';
import '../Model/chat_messages_model.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({
    super.key,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController message_controlller = TextEditingController();

  bool isShowSticker = false;

  @override
  void initState() {
    super.initState();
    // Constants.GLOBAL_ROUTE = AppRouteName.chatDetailScreenRoute;
    // SocketService.instance?.commonConnectSocket();
    // _getMessagesEmitMethod();
  }

  @override
  void dispose() {
    // SocketService.instance?.dispose();
    super.dispose();
  }

  final List<ChatThreadData> chatDataList = [
    ChatThreadData(
      firstName: "Alice",
      lastName: "Smith",
      profileImage: "profile_image/user1.jpg",
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
      profileImage: "profile_image/user2.jpg",
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
    ChatThreadData(
      firstName: "Alice",
      lastName: "Doe",
      profileImage: "profile_image/user3.jpg",
      id: 5,
      conversationId: 4,
      senderId: 1,
      receiverId: 16,
      type: "text",
      message: "Good morning!",
      readAt: "2024-07-10T09:20:00.000Z",
      status: "read",
      createdAt: '2024-07-10T09:15:00.000Z',
      updatedAt: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // SocketService.instance?.dispose();
        return true;
      },
      child: CustomScaffold(
        horizontalPadding: 0.0,
        appBar:
            customAppBar(context: context, isLeadingBack: true, title: 'Bob'),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: sendChatButton(),
        ),
        body: Column(
          children: [
            // GetBuilder<ChatController>(builder: (chatBuilderController) {
            Expanded(
              child:
                  //  chatBuilderController.isChatWaiting.value
                  //     ? const Center(
                  //         child: CircularProgressIndicator(
                  //           backgroundColor: AppColors.WHITE_COLOR,
                  //           color: AppColors.YELLOW_COLOR,
                  //         ),
                  //       )
                  //     : (chatBuilderController.chatThreadList ?? []).isEmpty
                  //         ? NoDataFoundWidget(
                  //             title: 'No Messages Found',
                  //             height: Constants().fullScreenSize / 1.2,
                  //           )
                  //         :
                  ListView.builder(
                itemCount: chatDataList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
                reverse: true,
                padding: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                itemBuilder: (context, index) {
                  ChatThreadData? chatThreadData = chatDataList[index];
                  return chatWidget(
                      isNotSender: chatThreadData.senderId != 1 ? false : true,
                      chatThreadData: chatThreadData);
                },
              ),
            ),
            // }
            // ),
            Padding(padding: EdgeInsets.only(bottom: 65.h)),
          ],
        ),
      ),
    );
  }

//!---Message View Widget

  Widget chatWidget({
    required bool isNotSender,
    ChatThreadData? chatThreadData,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.sp, top: 8.sp),
      child: Row(
          mainAxisAlignment:
              isNotSender ? MainAxisAlignment.start : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //!----Image on Left
            isNotSender
                ? CustomCicrleAvatarWidget(
                    // imagePath: chatThreadData?.senderId?.imageName ?? '',
                    // imagePlaceHolder: AssetsPath.userPlaceHolder,
                    // imageType: MediaPathType.NETWORK.name,
                    radius: 43.0,
                    circularColor: Constants.themeButton(context: context),
                    imgPath: chatThreadData?.profileImage ?? '',
                    isExtendedImage: true,
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 10.sp),
                child: Column(
                    crossAxisAlignment: isNotSender
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      // isNotSender
                      //     ?
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: CustomText(
                          text: chatThreadData?.firstName,
                          fontColor:
                              Constants.primaryTextThemeColor(context: context),
                          fontSize: 16.sp,
                          fontFamily: AppFonts.JONES_MEDIUM,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      // : const SizedBox.shrink(),
                      Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          color: isNotSender
                              ? AppColors.ORANGE_COLOR
                              : Constants.isDarkTheme(context: context)
                                  ? AppColors.PINK_COLOR
                                  : AppColors.BLACK_COLOR,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: CustomText(
                          text: chatThreadData?.message ?? 'Null',
                          fontColor: AppColors.WHITE_COLOR,
                          fontSize: 14.sp,
                          maxLines: 400,
                          fontFamily: AppFonts.JONES_REGULAR,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                        ),
                        child: CustomText(
                          text: DateTimeManager.timeAgoMethod(
                              createdDate: chatThreadData?.createdAt ?? '',
                              isUtc: true),
                          fontColor:
                              Constants.primaryTextThemeColor(context: context),
                          fontSize: 10.sp,
                          fontFamily: AppFonts.JONES_LIGHT,
                          textAlign: TextAlign.start,
                        ),
                      )
                    ]),
              ),
            ),
            isNotSender
                ? const SizedBox.shrink()
                : CustomCicrleAvatarWidget(
                    // imagePath: chatThreadData?.senderId?.imageName ?? '',
                    // imagePlaceHolder: AssetsPath.userPlaceHolder,
                    // imageType: MediaPathType.NETWORK.name,
                    imgPath: chatThreadData?.profileImage,
                    radius: 40.0,
                    circularColor: Constants.themeButton(context: context),

                    isExtendedImage: true,
                  ),
          ]),
    );
  }

  Widget sendChatButton() {
    return CustomContainerBorderWidget(
      padding: EdgeInsets.zero,
      bgColor: Constants.isDarkTheme(context: context)
          ? AppColors.TRANSPARENT_COLOR
          : AppColors.WHITE_COLOR,
      borderColor: Constants.isDarkTheme(context: context)
          ? AppColors.WHITE_COLOR
          : AppColors.TRANSPARENT_COLOR,
      borderRadius: 50.r,
      oppacityValue: Constants.isDarkTheme(context: context) ? 0.0 : 0.4,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              controller: message_controlller,
              cursorColor: Constants.primaryTextThemeColor(context: context),
              style: TextStyle(
                fontFamily: AppFonts.JONES_MEDIUM,
                fontSize: 15.sp,
                color: Constants.primaryTextThemeColor(context: context),
              ),
              decoration: InputDecoration(
                  fillColor: AppColors.TRANSPARENT_COLOR,
                  filled: true,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      suffixIconData(
                          iconPath: AssetPaths.EMOJI_ICON, onTap: () {}),
                      suffixIconData(
                          iconPath: AssetPaths.MIC_ICON, onTap: () {}),
                      suffixIconData(
                          iconColor: AppColors.PINK_COLOR,
                          iconPath: AssetPaths.SEND_ICON,
                          onTap: () {
                            if (message_controlller.text.isNotEmpty) {
                              setState(() {
                                chatDataList.insert(
                                  0,
                                  ChatThreadData(
                                    firstName: "Bob",
                                    lastName: "Miller",
                                    profileImage: "profile_image/user2.jpg",
                                    id: 4,
                                    conversationId: 3,
                                    senderId: 16,
                                    receiverId: 1,
                                    type: "image",
                                    message: message_controlller.text,
                                    readAt: null,
                                    status: null,
                                    createdAt: DateTime.now().toString(),
                                    updatedAt: null,
                                  ),
                                );
                              });
                            }
                          }),
                      5.pw,
                    ],
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 0.025.sw, vertical: 0.02.sh),
                  hintText: '${AppStrings.TYPE_YOUR_MESSAGE_HERE}...',
                  hintStyle:
                      TextStyle(color: AppColors.GREY_COLOR, fontSize: 14.sp),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget suffixIconData(
      {required Function() onTap, required String iconPath, Color? iconColor}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Image.asset(
          iconPath,
          scale: 3.7,
          color: iconColor ??
              (Constants.isDarkTheme(context: context)
                  ? AppColors.WHITE_COLOR
                  : AppColors.ORANGE_COLOR),
        ),
      ),
    );
  }

//!--

  void _getMessagesEmitMethod() {
    //   //? Get Chat Thread\
    // chatController.chatThreadList?.clear();
    // log('Get Messages Emit${{
    //   "sender_id": SplashController.i.currentUser.value?.id ?? '0',
    //   "receiver_id": '1',
    // }}');
    // SocketService.instance?.socketEmitMethod(
    //     eventName: NetworkStrings.GET_MESSAGES_EVENT,
    //     eventParamaters: {
    //       "sender_id": SplashController.i.currentUser.value?.id ?? 0,
    //       "receiver_id": 1,
    //     });
  }

  void _sendMessageEmitMethod({required String message}) {
    // log({
    //   "sender_id": SplashController.i.currentUser.value?.id ?? 0,
    //   "receiver_id": 1,
    //   "type": "text",
    //   "message": message
    // }.toString());
    // //   //? Send Message
    // SocketService.instance?.socketEmitMethod(
    //     eventName: NetworkStrings.SEND_MESSAGE_EVENT,
    //     eventParamaters: {
    //       "sender_id": SplashController.i.currentUser.value?.id ?? 0,
    //       "receiver_id": 1,
    //       "type": "text",
    //       "message": message
    //     });
  }
}
