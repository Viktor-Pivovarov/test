import 'dart:async';

import 'package:flutter/material.dart';

class UiTimer extends StatefulWidget {
  const UiTimer({this.seconds, super.key});

  final int? seconds;

  @override
  State<UiTimer> createState() => _UiTimerState();
}

class _UiTimerState extends State<UiTimer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Timer? _timer;

  int? _start;

  bool get hasTimer => _start != null && _start! > 0;

  final Duration oneSec = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    if (widget.seconds != null) {
      _start = widget.seconds;
      startTimer();
    }

    _startAnimation();
  }

  @override
  void didUpdateWidget(UiTimer oldWidget) {
    if (oldWidget.seconds != null && widget.seconds != null) {
      if (oldWidget.seconds! <= 0 && widget.seconds! > 0) {
        _start = widget.seconds;
        startTimer();
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  void startTimer() {
    if (_start != null) {
      _timer = Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {
            if (_start! < 1) {
              timer.cancel();
            } else {
              _start = _start! - 1;
            }
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAnimation() {
    _controller
      ..stop()
      ..reset()
      ..repeat(period: oneSec);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.seconds != null) {
      if (widget.seconds! > 3599) {
        final int hours = widget.seconds! / 60 ~/ 60;

        return Text(
          '$hours ч.',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        );
      }

      return Text(
        formatToTime(Duration(seconds: _start!)),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      );
    }

    return Container();
  }

  String formatToTime(Duration d) => d.toString().substring(2, 7);
}
