import 'package:artgig/Utils/app_constants.dart';
import 'package:artgig/Widgets/cs_appbar.dart';
import 'package:artgig/Widgets/custom_scaffold.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Utils/app_colors.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({required this.videoUrl});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool _isVideoInitializing = true;
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
          ..initialize().then((_) {
            setState(() {
              _isVideoInitializing = false; // Update initialization state
            });
          });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      horizontalPadding: 0.0,
      scffoldBg: AppColors.TRANSPARENT_COLOR,
      //!----AppBar
      appBar: customAppBar(
          context: context, title: 'Tutorial', isLeadingBack: true),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            !_isVideoInitializing
                ? Chewie(
                    controller: _chewieController,
                  )
                : SizedBox(),
            if (_isVideoInitializing)
              Center(
                child: CircularProgressIndicator(
                  backgroundColor:
                      Constants.primaryTextThemeColor(context: context),
                  color: Constants.primaryTitleTextThemeColor(context: context),
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
