import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:neo_image_editor/neo_image_editor.dart';
import 'package:neo_image_editor/neo_image_source_type.dart';

abstract class SelectImagesHelper {
  static Future<List<Uint8List>?> selectImages({
    int maxPhotos = 9,
    List<Uint8List> images = const [],
    double? aspectRatio,
    OptimizeSettings? optimizeSettings,
    NeoImageSourceType? sourceType,
    Widget Function(
      NeoImageSourceType,
      dynamic Function(bool?),
    )? onPermissionDenied,
    bool useFrontCamera = false,
  }) async {
    final BuildContext context =
        GetIt.I<RootStackRouter>().navigatorKey.currentState!.context;

    return Navigator.of(context).push<List<Uint8List>>(
      MaterialPageRoute<List<Uint8List>>(
        builder: (BuildContext context) => NeoImageEditor(
          images: images,
          maxCount: maxPhotos,
          aspectRatio: aspectRatio,
          optimizeSettings: optimizeSettings,
          sourceType: sourceType,
          permissionDialogBuilder: onPermissionDenied,
          useFrontCamera: useFrontCamera,
        ),
      ),
    );
  }
}
