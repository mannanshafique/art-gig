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
        appBar: customAppBar(
            actionWidget: Switch(
              value: SplashController.i.isDarkMode,
              onChanged: (value) {
                SplashController.i.toggleTheme(value);
              },
            ),
            context: context,
            isLeadingBack: true,
            title: 'Bob'),
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
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.BLACK_COLOR, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.WHITE_COLOR),
              child: TextField(
                controller: message_controlller,
                cursorColor: AppColors.WHITE_COLOR,
                style: const TextStyle(color: AppColors.BLACK_COLOR),
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          Constants.unFocusKeyboardMethod(context: context);
                          if (message_controlller.text.isEmpty) {
                          } else {
                            _sendMessageEmitMethod(
                                message: message_controlller.text);
                          }
                          message_controlller.clear();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Image.asset(
                          AssetPaths.APPLE_ICON,
                          scale: 3.0,
                        ),
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 0.025.sw, vertical: 0.02.sh),
                    hintText: '${AppStrings.TYPE_YOUR_MESSAGE_HERE}...',
                    hintStyle:
                        TextStyle(color: AppColors.GREY_COLOR, fontSize: 14.sp),
                    labelStyle: const TextStyle(color: AppColors.WHITE_COLOR),
                    border: InputBorder.none),
              ),
            ),
          ),
          10.pw,
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.BLACK_COLOR, width: 1),
                borderRadius: BorderRadius.circular(10),
                color: AppColors.WHITE_COLOR),
            child: Center(child: Image.asset(AssetPaths.HOME_ICON)),
          )
        ],
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
