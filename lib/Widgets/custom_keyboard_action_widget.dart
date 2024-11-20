import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class CustomKeyboardActionWidget extends StatelessWidget {
  final Widget child;
  final FocusNode focusNode;
  KeyboardActionsPlatform? keyboardActionsPlatform;
  CustomKeyboardActionWidget(
      {required this.child,
      required this.focusNode,
      this.keyboardActionsPlatform});
  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
        config: _buildConfig(context), disableScroll: true, child: child);
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform:
          keyboardActionsPlatform ?? KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.white,
      actions: [
        KeyboardActionsItem(
          focusNode: focusNode,
          displayArrows: false,
          displayDoneButton: true,
        ),
      ],
    );
  }
}
