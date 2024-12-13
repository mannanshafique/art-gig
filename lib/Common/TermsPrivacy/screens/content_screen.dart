import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Utils/app_colors.dart';
import '../../../Widgets/cs_appbar.dart';
import '../../../Widgets/custom_scaffold.dart';

class ContentScreen extends StatefulWidget {
  final String? title, contentType;

  const ContentScreen({this.title, this.contentType});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  double? _opacity = 0;
  bool? _isLoading = true;
  bool? _isUrlLoading = true;
  String? webViewUrl;
  // TermsPrivacyBloc _termsPrivacyBloc = TermsPrivacyBloc();
  @override
  void initState() {
    getContentData();
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  getContentData() async {
    // log(widget.contentType!);
    // await _termsPrivacyBloc.contentMethod(
    //     context: context, contentType: widget.contentType!);
    setState(() {
      // webViewUrl = _termsPrivacyBloc.contentTypeResponse['data'][0]['content']
      //     .toString();
      webViewUrl = 'https://www.lipsum.com/';
      _isUrlLoading = false;
    });
    // log(_termsPrivacyBloc.contentTypeResponse['url']["data"].toString());
    log(webViewUrl ?? '-');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      horizontalPadding: 0.0,
      scffoldBg: AppColors.WHITE_COLOR,
      appBar: customAppBar(
          context: context, isLeadingBack: true, title: widget.title ?? ''),
      body: _isUrlLoading!
          ? Visibility(
              visible: _isLoading!,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.ORANGE_COLOR),
              ),
            )
          : Stack(
              children: [
                Opacity(
                  opacity: _opacity ?? 0,
                  child: WebView(
                    backgroundColor: AppColors.WHITE_COLOR,
                    initialUrl: webViewUrl,
                    onPageStarted: (String? url) {
                      setState(() {
                        _opacity = 1.0;
                      });
                    },
                    onPageFinished: (String? url) {
                      setState(() {
                        _isLoading = false;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: _isLoading!,
                  child: const Center(
                    child: CircularProgressIndicator(
                        color: AppColors.ORANGE_COLOR),
                  ),
                )
              ],
            ),
    );
  }

  // CustomAppBar _customAppBar() {
  //   return CustomAppBar(
  //     title: widget.title ?? "",
  //     appBarColor: AppColors.creamColor,
  //     leading: AssetPaths.arrowBackIcon,
  //     leadingColor: AppColors.blackColor,
  //   );
  // }
}
