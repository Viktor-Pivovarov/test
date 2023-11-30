import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

const _sizeOverlay = 100.0;

abstract class LoadingState<T extends StatefulWidget> extends State<T> {
  final LoadingOverlay loadingOverlay = LoadingOverlay();

  @override
  void dispose() {
    loadingOverlay.hide();

    super.dispose();
  }
}

class LoadingOverlay {
  OverlayEntry? _overlay;

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (context) => Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: _sizeOverlay,
              height: _sizeOverlay,
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.transparent),
                  shape: BoxShape.circle,
                  color: Colors.transparent),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: UiCircleProgressIndicator(),
              ),
            ),
          ),
        ),
      );

      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay?.remove();

      _overlay = null;
    }
  }
}

class UiProgressIndicator extends StatelessWidget {
  const UiProgressIndicator({
    super.key,
    this.value,
    this.isCenter = true,
    this.fullScreen = false,
    this.size = 36,
    this.additionalText,
  });

  final double? value;
  final double size;
  final bool isCenter;
  final bool fullScreen;
  final Widget? additionalText;

  @override
  Widget build(BuildContext context) {
    final Widget loader = SpinKitWave(
      color: Theme.of(context).primaryColor,
      size: size,
      itemCount: 8,
      type: SpinKitWaveType.center,
    );

    if (fullScreen) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Theme.of(context).colorScheme.background.withOpacity(0.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loader,
            if (additionalText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: additionalText,
              ),
          ],
        ),
      );
    }

    if (isCenter) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loader,
            if (additionalText != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: additionalText,
              ),
          ],
        ),
      );
    }

    return loader;
  }
}
