import 'dart:async';

import 'package:flutter/material.dart';

class UiCircleTimer extends StatefulWidget {
  const UiCircleTimer({required this.seconds, super.key});

  final int seconds;

  @override
  State<UiCircleTimer> createState() => _UiCircleTimerState();
}

class _UiCircleTimerState extends State<UiCircleTimer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Timer? _timer;

  int? _start;

  bool get hasTimer => _start != null && _start! > 0;

  final Duration oneSec = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _start = widget.seconds;
    startTimer();

    _startAnimation();
  }

  @override
  void didUpdateWidget(UiCircleTimer oldWidget) {
    if (oldWidget.seconds <= 0 && widget.seconds > 0) {
      _start = widget.seconds;
      startTimer();
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
    return Container();
    // TODO deprecated
    // return Align(
    // child: PulseIndicator(
    //   child: Container(
    //     width: Insets.xxl * 3,
    //     height: Insets.xxl * 3,
    //     decoration: BoxDecoration(
    //       color: Theme.of(context).primaryColor,
    //       borderRadius: BorderRadius.circular(Insets.xxl * 3),
    //     ),
    //     child: Center(
    //       child: _start == 0
    //           ? CrossImage(Assets.icons.clock)
    //           : UiTimer(seconds: _start),
    //     ),
    //   ),
    // ),
    // );

    // if (widget.seconds != null) {
    //   if (widget.seconds! > 3599) {
    //     int hours = widget.seconds! / 60 ~/ 60;

    //     return Text(
    //       '$hours ч.',
    //       textAlign: TextAlign.center,
    //       style: TextStyle(fontSize: 18.0, color: Colors.white),
    //     );
    //   }

    //   return Text(
    //     formatToTime(Duration(seconds: _start!)),
    //     textAlign: TextAlign.center,
    //     style: TextStyle(fontSize: 18.0, color: Colors.white),
    //   );
    // }

    // return Container();
  }

  String formatToTime(Duration d) => d.toString().substring(2, 7);
}
