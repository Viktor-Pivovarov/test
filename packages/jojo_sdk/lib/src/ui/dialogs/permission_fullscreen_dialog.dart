import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionFullScreenDialog extends StatefulWidget {
  const PermissionFullScreenDialog({
    required this.title,
    required this.description,
    required this.mainButtonTitle,
    required this.secondaryButtonTitle,
    required this.onClose,
    required this.permission,
    this.onSecondaryTap,
    super.key,
  });

  final String title;
  final String description;

  final String mainButtonTitle;
  final String secondaryButtonTitle;

  final Permission permission;

  final void Function(bool?) onClose;

  final VoidCallback? onSecondaryTap;

  @override
  State<PermissionFullScreenDialog> createState() => _PermissionDialogState();
}

class _PermissionDialogState extends State<PermissionFullScreenDialog> {
  late final AppLifecycleListener _listener;

  bool requested = true;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onResume: () async {
        if (requested) {
          requested = false;
          return;
        }
        requested = true;
        final result = await widget.permission.request();
        if (!result.isDenied && !result.isPermanentlyDenied) {
          widget.onClose(true);
        }
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog.fullscreen(
        backgroundColor: context.color.greyLight,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UiImage(
                Assets.images.permissionDenied,
                width: MediaQuery.of(context).size.width > 375
                    ? double.infinity
                    : 300,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                child: Column(
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: context.text.bigTitle,
                    ),
                    const SizedBox(
                      height: Insets.l,
                    ),
                    Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: context.text.smallTitle
                          .copyWith(color: context.color.smallTextColor),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                child: Column(
                  children: [
                    UiButton(
                      text: widget.mainButtonTitle,
                      onPressed: openAppSettings,
                    ),
                    const SizedBox(
                      height: Insets.l,
                    ),
                    UiButton.text(
                      text: widget.secondaryButtonTitle,
                      onPressed: () {
                        widget.onClose(null);
                        widget.onSecondaryTap?.call();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
