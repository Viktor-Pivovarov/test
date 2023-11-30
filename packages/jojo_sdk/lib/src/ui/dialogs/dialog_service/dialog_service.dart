import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class DialogService {
  static Widget Function(BuildContext, Widget?) builder =
      FlutterEasyDialogs.builder();

  static Future<T?> showPositionedDialog<T>({
    required Widget dialog,
    EasyDialogPosition position = EasyDialogPosition.center,
    EasyDialogAnimationConfiguration animationConfiguration =
        const EasyDialogAnimationConfiguration.bounded(
      duration: Duration(milliseconds: 100),
      reverseDuration: Duration(milliseconds: 100),
    ),
    EasyDialogDecoration<EasyDialog> decoration =
        const EasyDialogDecoration.combine([
      EasyDialogAnimation.fadeBackground(backgroundColor: Colors.black45),
      EasyDialogAnimation.fade(),
    ]),
    Duration? autoHideDuration,
  }) =>
      FlutterEasyDialogs.show<T>(
        EasyDialog.positioned(
          content: dialog,
          position: position,
          animationConfiguration: animationConfiguration,
          autoHideDuration: autoHideDuration,
          decoration: decoration,
        ),
      );

  static Future<T?> showBottomDialog<T>({
    required Widget dialog,
    EasyDialogPosition position = EasyDialogPosition.bottom,
    EasyDialogAnimationConfiguration animationConfiguration =
        const EasyDialogAnimationConfiguration.bounded(
      duration: Duration(milliseconds: 100),
      reverseDuration: Duration(milliseconds: 100),
    ),
    EasyDialogDecoration<EasyDialog>? decoration,
    Duration? autoHideDuration,
  }) =>
      FlutterEasyDialogs.show<T>(
        EasyDialog.positioned(
          content: dialog,
          position: position,
          animationConfiguration: animationConfiguration,
          autoHideDuration: autoHideDuration,
          decoration: decoration ??
              const CustomPositionedShell()
                  .chained(CustomPositionedAnimation())
                  .chained(
                    CustomPositionedDismiss(onDismissed: () => 6),
                  ),
        ),
      );

  static Future<T?> showFullscreenDialog<T>({
    required Widget dialog,
    Future<bool> Function()? androidWillPop,
    EasyDialogAnimationConfiguration animationConfiguration =
        const EasyDialogAnimationConfiguration.bounded(
      duration: Duration(milliseconds: 100),
      reverseDuration: Duration(milliseconds: 100),
    ),
    EasyDialogDecoration<EasyDialog> decoration =
        const EasyDialogDecoration.combine([
      EasyDialogAnimation.fadeBackground(backgroundColor: Colors.black45),
      EasyDialogAnimation.fade(),
    ]),
    Duration? autoHideDuration,
  }) =>
      FlutterEasyDialogs.show<T>(
        EasyDialog.fullScreen(
          content: dialog,
          androidWillPop: androidWillPop,
          decoration: decoration,
          animationConfiguration: animationConfiguration,
        ),
      );

  static Future<void> hide<T>({
    required EasyDialogIdentifier identifier,
    T? result,
  }) {
    return FlutterEasyDialogs.hide(identifier, result: result);
  }
}
