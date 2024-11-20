import 'package:flutter/material.dart';

class LiveVerticalButtonWidget extends StatelessWidget {
  const LiveVerticalButtonWidget(
      {super.key, required this.onTap, required this.iconData});

  final Function() onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(iconData, color: Colors.white),
        ),
        // const SizedBox(
        //   height: 3,
        // ),
        // CustomText(
        //     text:
        //         _isHLSRunning ? 'STOP_VIDEO' : 'START_VIDEO',
        //     fontColor: Colors.white),
      ],
    );
  }
}
