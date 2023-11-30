import 'dart:async';
import 'dart:collection';

import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class NotifyService {
  NotifyService() {
    _controller.stream.listen((NotifyMessageModel event) {
      _queueFuture.add(() async {
        switch (event.type) {
          case NotifyMessageType.success:
            await _showSuccessNotify<void>(
              event.message,
              duration: event.duration,
            );
          case NotifyMessageType.error:
            await _showErrorNotify<void>(
              event.message,
              duration: event.duration,
            );
          case NotifyMessageType.warning:
            await _showWarningNotify<void>(
              event.message,
              duration: event.duration,
            );

          case NotifyMessageType.defaults:
            await _showDefaultNotify<void>(
              event.message,
              duration: event.duration,
            );
        }

        _queue.remove(event);
      });
    });
  }

  BuildContext? get _context =>
      GetIt.I<RootStackRouter>().navigatorKey.currentState?.context;

  final Queue<NotifyMessageModel> _queue = Queue<NotifyMessageModel>();
  final CustomQueue _queueFuture = CustomQueue();

  final StreamController<NotifyMessageModel> _controller =
      StreamController<NotifyMessageModel>.broadcast();

  Future<T?>? _showFlash<T>({
    required FlashBuilder<T> builder,
    Duration? duration,
  }) {
    if (_context != null) {
      return showFlash<T>(
        context: _context!,
        duration: duration,
        builder: builder,
      );
    }

    return null;
  }

  void showSuccess(String message, {Duration? duration}) {
    final NotifyMessageModel model = NotifyMessageModel(
      message: message,
      type: NotifyMessageType.success,
      duration: duration ?? const Duration(seconds: 2),
    );

    if (!_queue.contains(model)) {
      _queue.addLast(model);

      _controller.add(model);
    }
  }

  void showDefault(String message, {Duration? duration}) {
    final NotifyMessageModel model = NotifyMessageModel(
      message: message,
      type: NotifyMessageType.defaults,
      duration: duration ?? const Duration(seconds: 2),
    );

    if (!_queue.contains(model)) {
      _queue.addLast(model);

      _controller.add(model);
    }
  }

  Future<void> showError(String message, {Duration? duration}) async {
    final NotifyMessageModel model = NotifyMessageModel(
      message: message,
      type: NotifyMessageType.error,
      duration: duration ?? const Duration(seconds: 5),
    );

    if (!_queue.contains(model)) {
      _queue.addLast(model);

      _controller.add(model);
    }
  }

  void showWarning(String message, {Duration? duration}) {
    final NotifyMessageModel model = NotifyMessageModel(
      message: message,
      type: NotifyMessageType.warning,
      duration: duration ?? const Duration(seconds: 2),
    );

    if (!_queue.contains(model)) {
      _queue.addLast(model);

      _controller.add(model);
    }
  }

  Future<T?>? _showDefaultNotify<T>(String contentText, {Duration? duration}) {
    return _showFlash<T>(
      duration: duration ?? const Duration(seconds: 3),
      builder: (BuildContext context, FlashController<T> controller) {
        return Flash<T>(
          controller: controller,
          position: FlashPosition.bottom,
          child: FlashBar(
            controller: controller,
            content: Container(
              padding: const EdgeInsets.all(Insets.l),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Insets.l),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      contentText,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<T?>? _showErrorNotify<T>(String contentText, {Duration? duration}) {
    // GetIt.I<XLogger>(param1: NotifyService).e(contentText);

    return _showFlash<T>(
      duration: duration ?? const Duration(seconds: 2),
      builder: (BuildContext context, FlashController<T> controller) {
        return Flash<T>(
          controller: controller,
          position: FlashPosition.bottom,
          child: FlashBar(
            controller: controller,
            content: Container(
              padding: const EdgeInsets.all(Insets.l),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Insets.l),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: Insets.s),
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: context.theme.colorScheme.error,
                    //   borderRadius: BorderRadius.circular(100),
                    // ),
                    child: Icon(
                      Icons.error,
                      color: context.theme.colorScheme.error,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      contentText,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<T?>? _showSuccessNotify<T>(String contentText, {Duration? duration}) {
    return _showFlash<T>(
      duration: duration ?? const Duration(seconds: 2),
      builder: (BuildContext context, FlashController<T> controller) {
        return Flash<T>(
          controller: controller,
          position: FlashPosition.bottom,
          child: FlashBar(
            controller: controller,
            content: Container(
              padding: const EdgeInsets.all(Insets.l),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Insets.l),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: Insets.s),
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: ThemeConfig.success_3,
                    //   borderRadius: BorderRadius.circular(100),
                    // ),
                    // child: NeoIcon(
                    //   NeoAssets.icons.check,
                    //   color: ThemeConfig.success_1,
                    // ),
                  ),
                  Expanded(
                    child: Text(
                      contentText,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<T?>? _showWarningNotify<T>(String contentText, {Duration? duration}) {
    return _showFlash<T>(
      duration: duration ?? const Duration(seconds: 2),
      builder: (BuildContext context, FlashController<T> controller) {
        return Flash<T>(
          controller: controller,
          position: FlashPosition.top,
          child: FlashBar(
            controller: controller,
            content: Container(
              padding: const EdgeInsets.all(Insets.l),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Insets.l),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: Insets.s),
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: ThemeConfig.primary,
                    //   borderRadius: BorderRadius.circular(100),
                    // ),
                    // child: NeoIcon(
                    //   NeoAssets.icons.info,
                    //   color: ThemeConfig.primary,
                    // ),
                  ),
                  Expanded(
                    child: Text(
                      contentText,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Completer<void> completer = NotifyService.showLoader();
  /// await Future<dynamic>.delayed(const Duration(seconds: 1));
  /// completer.complete();
  Completer<void> showLoader() {
    final Completer<void> completer = Completer<void>();

    _context!.showModalFlash(
      dismissCompleter: completer,
      builder: (context, controller) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: FadeTransition(
            opacity: controller.controller,
            child: const Align(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: UiLoader(),
              ),
            ),
          ),
        );
      },
    );

    return completer;
  }

  Future<T?>? showPushNotify<T>(
    String contentText, {
    String? contentBody,
    Duration? duration,
    VoidCallback? onTap,
  }) {
    return _showFlash<T>(
      duration: duration ?? const Duration(seconds: 3),
      builder: (BuildContext context, FlashController<T> controller) {
        return Flash<T>(
          controller: controller,

          position: FlashPosition.top,

          // onTap: () {
          //   controller.dismiss();
          //   onTap?.call();
          // },

          child: FlashBar(
            controller: controller,
            content: Container(
              padding: const EdgeInsets.all(Insets.l),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Insets.l),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: Insets.s),
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    //   color: ThemeConfig.success_3,
                    //   borderRadius: BorderRadius.circular(100),
                    // ),
                    // child: NeoIcon(
                    //   NeoAssets.icons.check,
                    //   color: ThemeConfig.success_1,
                    // ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          contentText,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (contentBody != null)
                          Padding(
                            padding: const EdgeInsets.only(top: Insets.s),
                            child: Text(
                              contentBody,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
