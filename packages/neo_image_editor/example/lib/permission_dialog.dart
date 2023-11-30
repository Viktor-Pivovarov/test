import 'package:flutter/material.dart';
import 'package:neo_image_editor/neo_image_source_type.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionDialog extends StatefulWidget {
  const PermissionDialog(
      {required this.type, required this.onClose, super.key});

  final NeoImageSourceType type;
  final Function(bool?) onClose;

  @override
  State<PermissionDialog> createState() => _PermissionDialogState();
}

class _PermissionDialogState extends State<PermissionDialog> {
  late final AppLifecycleListener _listener;

  bool lastRequested = false;

  @override
  void initState() {
    super.initState();

    _listener = AppLifecycleListener(
      onResume: () async {
        if (lastRequested) {
          lastRequested = false;
          return;
        }

        if (widget.type == NeoImageSourceType.gallery) {
          final result = await Permission.photos.request();
          lastRequested = true;

          if (!result.isDenied && !result.isPermanentlyDenied) {
            widget.onClose(true);
          }
        }
        if (widget.type == NeoImageSourceType.camera) {
          final result = await Permission.camera.request();
          lastRequested = true;

          if (!result.isDenied && !result.isPermanentlyDenied && mounted) {
            widget.onClose(true);
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Нет разрешения на ${widget.type}!'),
      actions: [
        ElevatedButton(
            onPressed: () async {
              await openAppSettings();
            },
            child: const Text('В настройки')),
        ElevatedButton(
            onPressed: () {
              widget.onClose(false);
            },
            child: const Text('Cancel'))
      ],
    );
  }

  @override
  void dispose() {
    _listener.dispose();

    super.dispose();
  }
}
