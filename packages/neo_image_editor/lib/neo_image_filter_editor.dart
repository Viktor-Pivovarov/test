import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:neo_image_editor/l10n/generated/neo_image_editor_localizations.dart';
import 'package:neo_image_editor/loading_overlay.dart';

class NeoImageFilterEditor extends StatefulWidget {
  const NeoImageFilterEditor({super.key, required this.images});

  final List<Uint8List> images;

  @override
  State<NeoImageFilterEditor> createState() => _NeoImageFilterEditorState();
}

class _NeoImageFilterEditorState extends LoadingState<NeoImageFilterEditor> {
  late final List<Uint8List> images;

  int selectedImage = 0;

  @override
  void initState() {
    super.initState();
    images = [];
    images.addAll(widget.images);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
              onPressed: () async {},
              child: Text(NeoImageEditorLocalizations.of(context).ok))
        ],
      ),
      backgroundColor: Colors.black,
      body: const SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox.shrink(),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(height: 50, child: SizedBox.shrink())
          ],
        ),
      ),
    );
  }
}
