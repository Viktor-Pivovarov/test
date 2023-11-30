// ignore_for_file: use_build_context_synchronously, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

library jnp_image_editor;

import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_draggable_gridview/flutter_draggable_gridview.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:neo_image_editor/camera/neo_camera_picker.dart';
import 'package:neo_image_editor/crop_image/crop_controller.dart';
import 'package:neo_image_editor/crop_image/crop_image.dart';
import 'package:neo_image_editor/crop_image/crop_rotation.dart';
import 'package:neo_image_editor/l10n/generated/neo_image_editor_localizations.dart';
import 'package:neo_image_editor/loading_overlay.dart';
import 'package:neo_image_editor/neo_image_source_type.dart';
import 'package:neo_image_editor/optimize_settings.dart';
import 'package:permission_handler/permission_handler.dart';

export 'package:neo_image_editor/optimize_settings.dart';

class NeoImageEditor extends StatefulWidget {
  const NeoImageEditor({
    super.key,
    required this.images,
    this.maxCount = 1,
    this.aspectRatio,
    this.optimizeSettings,
    this.resetCropOnChange = false,
    this.useFrontCamera = false,
    /*
      Включает обработку изображений в изолятах.
      В iOS для работы необходимо включить Impeller
    */
    this.useFlutterIsolates = true,
    this.permissionDialogBuilder,
    this.sourceType,
  })  : assert(maxCount > 0),
        assert(maxCount > 0 && images.length <= maxCount);

  final bool useFrontCamera;

  final bool useFlutterIsolates;

  final List<Uint8List> images;

  final int maxCount;

  final double? aspectRatio;

  final bool resetCropOnChange;

  final OptimizeSettings? optimizeSettings;

  final NeoImageSourceType? sourceType;

  final Widget Function(
    NeoImageSourceType type,
    Function(bool? result) onClose,
  )? permissionDialogBuilder;

  @override
  State<NeoImageEditor> createState() => _NeoImageEditorState();
}

class _NeoImageEditorState extends LoadingState<NeoImageEditor> {
  late final List<Uint8List> images;

  int selectedImage = 0;

  late final List<CropController> controllers;

  late final List<Widget> cropWidgets;

  AnchorScrollController? scrollController;

  late final List<Uint8List> result;

  int cropedCount = 0;

  bool isFlipped = false;

  bool isInit = false;

  late final Function() cropControllerListener;

  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    images = [];
    images.addAll(widget.images);

    result = [];

    result.addAll(images);

    controllers = <CropController>[];

    cropWidgets = <Widget>[];

    for (int i = 0; i < widget.maxCount; i++) {
      controllers.add(CropController(aspectRatio: widget.aspectRatio));
    }

    cropControllerListener = () {
      final bool tilted = controllers[0].rotation.isSideways;

      final double cropWidth;
      final double cropHeight;

      final image = controllers[0].getImage();

      if (image != null) {
        if (tilted) {
          cropWidth = controllers[0].crop.width * image.height;
          cropHeight = controllers[0].crop.height * image.width;
        } else {
          cropWidth = controllers[0].crop.width * image.width;
          cropHeight = controllers[0].crop.height * image.height;
        }

        for (int j = 1; j < controllers.length; j++) {
          if (controllers[j].getImage() != null) {
            Future.delayed(Duration.zero, () {
              controllers[j].aspectRatio = cropWidth / cropHeight;
              controllers[j].crop = const Rect.fromLTRB(0.0, 0.0, 1.0, 1.0);
            });
          }
        }
      }
    };

    controllers.first.addListener(cropControllerListener);

    _init();
  }

  Future<void> _init() async {
    await initCrops();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.sourceType != null) {
        onPressedAdd();
      }
    });
  }

  Future<bool> initCrops() async {
    for (int i = 0; i < images.length; i++) {
      controllers[i].image = await bytesToImage(images[i]);
    }

    setState(() {
      isInit = true;
    });

    return false;
  }

  Future<ui.Image> bytesToImage(Uint8List imgBytes) async {
    ui.Codec codec = await ui.instantiateImageCodec(imgBytes);
    ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }

  Future<void> flipImage(int index) async {
    final cmd = img.Command()
      ..decodeImage(images[index])
      ..copyFlip(direction: img.FlipDirection.horizontal)
      ..encodePng();

    await cmd.executeThread();

    final image = await cmd.getBytes();

    if (image != null) {
      images[index] = image;
      controllers[index].image = await bytesToImage(images[index]);
    }
  }

  List<AnchorItemWrapper> generateCropWidget(double width) {
    final result = <AnchorItemWrapper>[];

    for (int i = 0; i < images.length; i++) {
      result.add(AnchorItemWrapper(
        key: ValueKey(i),
        controller: scrollController,
        index: i,
        child: SizedBox(
          width: width,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: CropImage(
                              controller: controllers[i],
                              alwaysMove: true,
                              image: Image.memory(images[i])),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  loadingOverlay.show(context);

                                  await flipImage(i);

                                  loadingOverlay.hide();
                                },
                                icon: const Icon(
                                  Icons.flip,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  if (i == 0) {
                                    isFlipped = !isFlipped;
                                    controllers[i].rotateLeft();
                                    controllers[i].crop =
                                        const Rect.fromLTRB(0.0, 0.0, 1.0, 1.0);

                                    controllers[i].notifyListeners();
                                  } else {
                                    controllers[i].rotateLeft();
                                  }
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.arrowRotateLeft,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  if (i == 0) {
                                    isFlipped = !isFlipped;
                                    controllers[i].rotateRight();
                                    controllers[i].crop =
                                        const Rect.fromLTRB(0.0, 0.0, 1.0, 1.0);

                                    controllers[i].notifyListeners();
                                  } else {
                                    controllers[i].rotateRight();
                                  }
                                },
                                icon: const Icon(
                                    FontAwesomeIcons.arrowRotateRight,
                                    color: Colors.white)),
                            const SizedBox(
                              width: 50,
                            ),
                            IconButton(
                                onPressed: () async {
                                  loadingOverlay.show(context);
                                  images.removeAt(i);
                                  final removedController =
                                      controllers.removeAt(i);
                                  removedController.dispose();
                                  controllers.add(CropController(
                                      aspectRatio: widget.aspectRatio));
                                  if (i == 0) {
                                    if (controllers.first.getImage() != null) {
                                      controllers.first.aspectRatio =
                                          widget.aspectRatio;
                                    }

                                    controllers.first
                                        .addListener(cropControllerListener);
                                  }

                                  await initCrops();

                                  setState(() {});
                                  loadingOverlay.hide();
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.trashCan,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ));
    }
    return result;
  }

  Future<void> onPressedAdd() async {
    NeoImageSourceType? result = widget.sourceType;

    result ??= await showModalBottomSheet<NeoImageSourceType>(
        context: context,
        builder: (context) {
          return SafeArea(
            child: SizedBox(
              height: 115,
              child: Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      Navigator.of(context).pop(NeoImageSourceType.camera);
                    },
                    child: ListTile(
                      title: Center(
                          child: Text(
                              NeoImageEditorLocalizations.of(context).camera)),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      Navigator.of(context).pop(NeoImageSourceType.gallery);
                    },
                    child: ListTile(
                      title: Center(
                          child: Text(
                              NeoImageEditorLocalizations.of(context).gallery)),
                    ),
                  )
                ],
              ),
            ),
          );
        });

    if (result == null) {
      return;
    }

    if (result == NeoImageSourceType.camera) {
      var permission = await Permission.camera.request();

      if (permission.isDenied || permission.isPermanentlyDenied) {
        if (widget.permissionDialogBuilder != null) {
          final success = await showGeneralDialog<bool>(
            context: context,
            barrierDismissible: false,
            pageBuilder: (context, animation, secondaryAnimation) {
              return widget.permissionDialogBuilder!
                  .call(NeoImageSourceType.camera, ((result) {
                Navigator.of(context).pop(result);
              }));
            },
          );
          if (success ?? false) {
            permission = await Permission.camera.request();
          } else {
            Navigator.of(context).pop();
          }
        }
      }

      if (permission.isDenied || permission.isPermanentlyDenied) {
        return;
      }

      final file = await showDialog<Uint8List>(
          context: context,
          builder: (context) {
            return SafeArea(
              child: FractionallySizedBox(
                heightFactor: 1,
                child: NeoCameraPicker(
                  useFrontCamera: widget.useFrontCamera,
                ),
              ),
            );
          });

      if (file != null) {
        images.addAll(await _optimize(
            [file], const OptimizeSettings(minHeight: 2000, minWidth: 2000)));
        if (mounted) {
          await initCrops();
          loadingOverlay.hide();
        }
      }
    }

    if (result == NeoImageSourceType.gallery) {
      if (Platform.isIOS) {
        var permission = await Permission.photos.request();

        if (permission.isDenied || permission.isPermanentlyDenied) {
          if (widget.permissionDialogBuilder != null) {
            final success = await showGeneralDialog<bool>(
              context: context,
              barrierDismissible: false,
              pageBuilder: (context, animation, secondaryAnimation) {
                return widget.permissionDialogBuilder!
                    .call(NeoImageSourceType.gallery, ((result) {
                  Navigator.of(context).pop(result);
                }));
              },
            );
            if (success ?? false) {
              permission = await Permission.photos.request();
            } else {
              Navigator.of(context).pop();
            }
          }
        }

        if (permission.isDenied || permission.isPermanentlyDenied) {
          return;
        }
      }

      loadingOverlay.show(context);
      List<XFile> files = [];

      try {
        if (widget.maxCount == 1) {
          final file = await picker.pickImage(source: ImageSource.gallery);
          if (file != null) {
            files.add(file);
          }
        } else {
          files = await picker.pickMultiImage();
        }

        final count = widget.maxCount - images.length;

        if (count > 0) {
          images.addAll(await _optimize([
            ...await Future.wait(files.take(count).map((e) => e.readAsBytes()))
          ], const OptimizeSettings(minHeight: 2000, minWidth: 2000)));
        }

        if (mounted) {
          await initCrops();
          loadingOverlay.hide();
        }
      } catch (e) {
        loadingOverlay.hide();
      }
    }
  }

  void _cropWithIsolates() async {
    var result = await Future.wait(controllers
        .where((element) => element.getImage() != null)
        .map((e) => cropImage(e, controllers, images)));
    if (mounted) {
      if (widget.optimizeSettings != null) {
        result = await _optimize(result, widget.optimizeSettings!);
      }
      Navigator.of(context).pop(result);
    }
  }

  void _cropWithoutIsolates() async {
    final croppedImages = await Future.wait(controllers
        .where((element) => element.getImage() != null)
        .map((e) => e.croppedBitmap()));

    if (mounted) {
      var result = <Uint8List>[];

      for (var image in croppedImages) {
        final data = await image.toByteData(format: ui.ImageByteFormat.png);

        if (data != null) {
          result.add(data.buffer.asUint8List());
        }
      }
      if (widget.optimizeSettings != null) {
        result = await _optimize(result, widget.optimizeSettings!);
      }
      Navigator.of(context).pop(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
              onPressed: images.isEmpty
                  ? null
                  : () async {
                      loadingOverlay.show(context);

                      try {
                        if (widget.useFlutterIsolates) {
                          _cropWithIsolates();
                        } else {
                          _cropWithoutIsolates();
                        }
                      } catch (e) {
                        loadingOverlay.hide();
                      }
                    },
              child: Text(
                NeoImageEditorLocalizations.of(context).ok,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: LayoutBuilder(builder: (context, constraints) {
                if (isInit) {
                  if (scrollController == null) {
                    scrollController = AnchorScrollController();
                  } else {
                    scrollController = AnchorScrollController(
                        initialScrollOffset: scrollController?.offset ?? 0);
                  }

                  return ListView(
                    key: UniqueKey(),
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    addAutomaticKeepAlives: true,
                    children: generateCropWidget(constraints.maxWidth),
                  );
                }
                return const UiProgressIndicator();
              }),
            ),
            const SizedBox(height: 16),
            if (widget.maxCount == 1)
              if (images.isEmpty)
                SizedBox(
                  width: 64,
                  height: 64,
                  child: InkWell(
                    onTap: onPressedAdd,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: Colors.grey.withAlpha(100))),
                          child: const Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
              else
                SizedBox(
                  width: 64,
                  height: 64,
                  child: InkWell(
                    onTap: () {
                      scrollController?.scrollToIndex(
                        index: 0,
                        scrollSpeed: 5,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: Colors.grey.withAlpha(100))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.memory(
                            images.first,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            else
              LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  height: widget.maxCount <= 6
                      ? MediaQuery.of(context).size.height * 0.1
                      : MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: DraggableGridViewBuilder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: constraints.maxWidth / 6),
                    dragCompletion: (list, beforeIndex, afterIndex) {
                      final controller = controllers.removeAt(beforeIndex);
                      controllers.insert(afterIndex, controller);
                      final image = images.removeAt(beforeIndex);
                      images.insert(afterIndex, image);

                      if (beforeIndex == 0) {
                        controller.removeListener(cropControllerListener);
                        controllers.first.addListener(cropControllerListener);
                        controllers.first.aspectRatio = widget.aspectRatio;
                        controllers.first.notifyListeners();
                      }

                      if (afterIndex == 0) {
                        controllers.first.addListener(cropControllerListener);
                        controllers[1].removeListener(cropControllerListener);
                        controllers.first.aspectRatio = widget.aspectRatio;
                        controllers.first.notifyListeners();
                      }
                      setState(() {});
                    },
                    dragFeedback: (List<DraggableGridItem> list, int index) {
                      return Material(
                        color: Colors.transparent,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: list[index].child,
                        ),
                      );
                    },
                    dragPlaceHolder: (List<DraggableGridItem> list, int index) {
                      return PlaceHolderWidget(
                        child: Container(
                          color: Colors.black,
                        ),
                      );
                    },
                    children: [
                      for (int i = 0; i < images.length; i++)
                        DraggableGridItem(
                          isDraggable: true,
                          child: InkWell(
                            onTap: () {
                              scrollController?.scrollToIndex(
                                index: i,
                                scrollSpeed: 5,
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.grey.withAlpha(100))),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.memory(
                                    images[i],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      for (int i = images.length; i < widget.maxCount; i++)
                        DraggableGridItem(
                          isDraggable: false,
                          child: InkWell(
                            onTap: onPressedAdd,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Colors.grey.withAlpha(100))),
                                  child: const Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        )
                    ],
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  Future<List<Uint8List>> _optimize(
      List<Uint8List> images, OptimizeSettings settings) {
    return Future.wait(images.map((e) {
      return FlutterImageCompress.compressWithList(
        e,
        quality: settings.quality,
        minHeight: settings.minHeight,
        minWidth: settings.minWidth,
      );
    }));
  }
}

Future<Uint8List> cropImage(CropController controller,
    List<CropController> controllers, List<Uint8List> images) {
  return flutterCompute(cropIsolate, {
    'rotation': controller.rotation.index,
    'data': images[controllers.indexOf(controller)],
    'cropLeft': controller.crop.left,
    'cropRight': controller.crop.right,
    'cropBottom': controller.crop.bottom,
    'cropTop': controller.crop.top,
  });
}

@pragma('vm:entry-point')
Future<Uint8List> cropIsolate(Map<String, dynamic> params) async {
  Rect crop = Rect.fromLTRB(params['cropLeft'], params['cropTop'],
      params['cropRight'], params['cropBottom']);

  ui.Codec codec = await ui.instantiateImageCodec(params['data']);

  ui.FrameInfo frame = await codec.getNextFrame();

  final rotation = CropRotation.values[params['rotation']];

  final image = frame.image;

  const maxSize = null;

  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);

  final bool tilted = rotation.isSideways;
  final double cropWidth;
  final double cropHeight;
  if (tilted) {
    cropWidth = crop.width * image.height;
    cropHeight = crop.height * image.width;
  } else {
    cropWidth = crop.width * image.width;
    cropHeight = crop.height * image.height;
  }
  // factor between the full size and the maxSize constraint.
  double factor = 1;
  if (maxSize != null) {
    if (cropWidth > maxSize || cropHeight > maxSize) {
      if (cropWidth >= cropHeight) {
        factor = maxSize / cropWidth;
      } else {
        factor = maxSize / cropHeight;
      }
    }
  }

  final Offset cropCenter = rotation.getRotatedOffset(
    crop.center,
    image.width.toDouble(),
    image.height.toDouble(),
  );

  final double alternateWidth = tilted ? cropHeight : cropWidth;
  final double alternateHeight = tilted ? cropWidth : cropHeight;
  if (rotation != CropRotation.up) {
    canvas.save();
    final double x = alternateWidth / 2 * factor;
    final double y = alternateHeight / 2 * factor;
    canvas.translate(x, y);
    canvas.rotate(rotation.radians);
    if (rotation == CropRotation.right) {
      canvas.translate(
        -y,
        -cropWidth * factor + x,
      );
    } else if (rotation == CropRotation.left) {
      canvas.translate(
        y - cropHeight * factor,
        -x,
      );
    } else if (rotation == CropRotation.down) {
      canvas.translate(-x, -y);
    }
  }

  canvas.drawImageRect(
    image,
    Rect.fromCenter(
      center: cropCenter,
      width: alternateWidth,
      height: alternateHeight,
    ),
    Rect.fromLTWH(
      0,
      0,
      alternateWidth * factor,
      alternateHeight * factor,
    ),
    Paint()..filterQuality = FilterQuality.high,
  );

  if (rotation != CropRotation.up) {
    canvas.restore();
  }

  final result = await pictureRecorder
      .endRecording()
      .toImage((cropWidth * factor).round(), (cropHeight * factor).round());

  final buffer =
      (await result.toByteData(format: ui.ImageByteFormat.png))!.buffer;

  return buffer.asUint8List();
}
