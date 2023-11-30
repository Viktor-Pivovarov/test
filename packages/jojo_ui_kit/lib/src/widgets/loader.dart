import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UiLoader extends StatelessWidget {
  const UiLoader({
    super.key,
    this.value,
    this.isCenter = true,
    this.fullScreen = false,
    this.size = 36,
    this.additionalText,
    this.color,
  });

  final StreamController<Widget>? value;
  final double size;
  final bool isCenter;
  final bool fullScreen;
  final Widget? additionalText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Widget loader = SpinKitThreeBounce(
      size: size,
      color: color ?? Colors.white,
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
            if (value != null)
              StreamBuilder<Widget>(
                stream: value!.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data ?? const SizedBox();
                  }

                  return const SizedBox();
                },
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
            if (value != null)
              StreamBuilder(
                stream: value!.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data ?? const SizedBox();
                  }

                  return const SizedBox();
                },
              ),
          ],
        ),
      );
    }

    return loader;
  }
}
