import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easy_dialogs/flutter_easy_dialogs.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _vectorColor = Color(0xFFF4E9E6);
const _imageHeight = 174.0;

class EngineeringWorksDialog extends StatefulWidget {
  const EngineeringWorksDialog({
    required this.stream,
    this.title,
    this.description,
    this.btnTitle,
    this.onPressedButton,
    super.key,
  });

  final String? title;

  final String? description;

  final String? btnTitle;

  final VoidCallback? onPressedButton;

  final StreamController<StateStatus> stream;

  Future<void> show() {
    return DialogService.showFullscreenDialog<void>(
      dialog: this,
    );
  }

  Future<void> hide(bool? result) async {
    await DialogService.hide<bool>(
      identifier: FullScreenDialog.identifier(),
      result: result,
    );
  }

  @override
  State<EngineeringWorksDialog> createState() => _EngineeringWorksDialogState();
}

class _EngineeringWorksDialogState extends State<EngineeringWorksDialog> {
  StreamSubscription<StateStatus>? _subscription;

  late final AppLifecycleListener _listener;

  StateStatus status = StateStatus.fetchingFailure;

  bool requested = true;

  @override
  void initState() {
    _listener = AppLifecycleListener(onStateChange: print, onResume: () async {
      print('resutv');
      // if (requested) {
      //   requested = false;
      //   return;
      // }

      // requested = true;

      widget.onPressedButton?.call();

      setState(() {});
    },);

    _subscription = widget.stream.stream.listen(_streamListener);

    super.initState();
  }

  void _streamListener(StateStatus event) {
    setState(() {
      status = event;
    });

    if (event.isFetchingSuccess) {
      widget.hide(null);
    }
  }

  @override
  void dispose() {
    _listener.dispose();
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Insets.l),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                UiIcon(
                  Assets.icons.updateVector,
                  color: _vectorColor,
                ),
                UiImage(
                  Assets.images.update,
                  fit: BoxFit.fitHeight,
                  height: _imageHeight,
                ),
              ],
            ),
            Text(
              widget.title ?? DialogI18n.engineeringWorksTitle,
              style: context.text.bigTitle
                  .copyWith(color: context.color.textColor),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: Insets.s,
                bottom: Insets.xl,
                left: Insets.xxl,
                right: Insets.xxl,
              ),
              child: Text(
                widget.description ?? DialogI18n.engineeringWorksDescription,
                style: context.text.mainText,
                textAlign: TextAlign.center,
              ),
            ),
            UiButton.dialog(
              padding: EdgeInsets.zero,
              text: widget.btnTitle ?? DialogI18n.update,
              disabled: status.isFetchingInProgress,
              onPressed: widget.onPressedButton,
            ),
          ],
        ),
      ),
    );
  }
}
