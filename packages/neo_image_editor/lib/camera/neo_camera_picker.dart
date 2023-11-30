import 'package:camera/camera.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class NeoCameraPicker extends StatefulWidget {
  const NeoCameraPicker({super.key, this.useFrontCamera = false});

  final bool useFrontCamera;

  @override
  State<NeoCameraPicker> createState() => _NeoCameraPickerState();
}

class _NeoCameraPickerState extends State<NeoCameraPicker>
    with WidgetsBindingObserver {
  late List<CameraDescription> cameraDescriptions;

  late CameraController currentController;

  bool isInit = false;

  bool get isTorch => currentController.value.flashMode == FlashMode.torch;

  double zoom = 1.0;
  double scaleFactor = 1.0;

  late final Future initFuture;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    initFuture = init();
  }

  Future<bool> init() async {
    if (isInit) {
      return isInit;
    }

    cameraDescriptions = await availableCameras();

    currentController = CameraController(
      widget.useFrontCamera
          ? frontCamera ?? cameraDescriptions.first
          : backCamera ?? cameraDescriptions.first,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await currentController.initialize();

    if (mounted) {
      setState(() {
        isInit = true;
      });
    }

    return isInit;
  }

  CameraDescription? get frontCamera => cameraDescriptions.firstWhereOrNull(
      (element) => element.lensDirection == CameraLensDirection.front);

  CameraDescription? get backCamera => cameraDescriptions.firstWhereOrNull(
      (element) => element.lensDirection == CameraLensDirection.back);

  bool get isFront =>
      currentController.description.lensDirection == CameraLensDirection.front;

  bool get isBack =>
      currentController.description.lensDirection == CameraLensDirection.back;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: initFuture,
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              if (snapshot.hasData && snapshot.data != null) {
                return Stack(children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onScaleStart: (details) {
                      zoom = scaleFactor;
                    },
                    onScaleUpdate: (details) async {
                      scaleFactor = zoom * details.scale;
                      final maxZoom = await currentController.getMaxZoomLevel();
                      final minZoom = await currentController.getMinZoomLevel();

                      if (maxZoom >= scaleFactor && minZoom <= scaleFactor) {
                        await currentController.setZoomLevel(scaleFactor);
                      }
                    },
                    child: CameraPreview(key: UniqueKey(), currentController),
                  ),
                  /*   Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: Colors.white,
                        )),
                  ),*/
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                        onPressed: () async {
                          final file = await currentController.takePicture();

                          if (mounted) {
                            Navigator.of(context).pop(await file.readAsBytes());
                          }
                        },
                        icon: const Icon(
                          Icons.camera,
                          size: 48,
                          color: Colors.white,
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                        onPressed: () async {
                          if (isFront) {
                            await currentController.dispose();

                            currentController = CameraController(
                                backCamera ?? cameraDescriptions.first,
                                ResolutionPreset.max,
                                enableAudio: false);
                            await currentController.initialize();
                            setState(() {});
                          } else {
                            await currentController.dispose();
                            currentController = CameraController(
                                frontCamera ?? cameraDescriptions.first,
                                ResolutionPreset.max,
                                enableAudio: false);
                            await currentController.initialize();
                            setState(() {});
                          }
                        },
                        icon: Icon(
                          isFront ? Icons.camera_rear : Icons.camera_front,
                          size: 24,
                          color: Colors.white,
                        )),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                        if (currentController.description.lensDirection ==
                            CameraLensDirection.front) {
                          return;
                        }
                        if (isTorch) {
                          currentController.setFlashMode(FlashMode.auto);
                        } else {
                          currentController.setFlashMode(FlashMode.torch);
                        }
                        setState(() {});
                      },
                      icon: Icon(
                        isTorch ? Icons.flash_off : Icons.flash_on,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]);
              }

              return const SizedBox.shrink();
            })));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!currentController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      currentController.dispose();
      isInit = false;
    } else if (state == AppLifecycleState.resumed) {
      currentController = CameraController(
          currentController.description, ResolutionPreset.max,
          enableAudio: false);
      currentController.initialize().then((value) {
        if (mounted) {
          setState(
            () {
              isInit = true;
            },
          );
        }
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    if (isInit) {
      currentController.dispose();
    }
  }
}
