import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class SearchTimer extends StatefulWidget {
  const SearchTimer({
    super.key,
    this.duration = Duration.zero,
    this.onFinish,
  });

  final Duration duration;

  final VoidCallback? onFinish;

  @override
  State<SearchTimer> createState() => _SearchTimerState();
}

class _SearchTimerState extends State<SearchTimer> {
  Timer? timer;

  late Duration duration;

  @override
  void initState() {
    duration = widget.duration;

    _initTime();

    super.initState();
  }

  void _initTime() {
    if (duration.inSeconds <= 0) {
      return;
    }

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (duration.inSeconds < 0) {
          timer.cancel();

          widget.onFinish?.call();

          return;
        }

        _subtract();
      },
    );
  }

  void _subtract() {
    if (duration.inSeconds == 0) {
      return;
    }

    setState(() {
      duration = Duration(seconds: duration.inSeconds - 1);
    });
  }

  @override
  void didUpdateWidget(SearchTimer oldWidget) {
    timer?.cancel();

    _initTime();

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String hours = formatDurationToHours(duration);
    final String minutes = formatDurationToMinutes(duration);
    final String seconds = formatDurationToSeconds(duration);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (hours != '00')
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _Item(
                      number: hours.split('')[0],
                    ),
                    _Item(
                      number: hours.split('')[1],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    SelectionI18n.hoursPlural(int.parse(hours)),
                    style: context.text.mainTextMedium
                        .copyWith(color: context.color.smallTextColor),
                  ),
                ),
              ],
            ),
          if (hours != '00')
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Insets.xs,
                Insets.l,
                Insets.xs,
                Insets.s,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _Item(
                    number: minutes.split('')[0],
                  ),
                  _Item(
                    number: minutes.split('')[1],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  SelectionI18n.minutesPlural(int.tryParse(minutes) ?? 0),
                  style: context.text.mainTextMedium
                      .copyWith(color: context.color.smallTextColor),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              Insets.xs,
              Insets.l,
              Insets.xs,
              Insets.s,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 3,
                  height: 3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _Item(
                    number: seconds.split('')[0],
                  ),
                  _Item(
                    number: seconds.split('')[1],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  SelectionI18n.secondsPlural(int.tryParse(seconds) ?? 0),
                  style: context.text.mainTextMedium
                      .copyWith(color: context.color.smallTextColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 42,
              height: 24,
              decoration: BoxDecoration(
                gradient: context.color.logoGradient,
                borderRadius: BorderRadius.circular(4),
                // boxShadow: const <BoxShadow>[
                //   BoxShadow(
                //     color: Color.fromRGBO(115, 145, 166, 0.1),
                //     offset: Offset(0, 10),
                //     blurRadius: 20,
                //   ),
                // ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 42,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
                gradient: context.color.logoGradient,
                // boxShadow: const <BoxShadow>[
                //   BoxShadow(
                //     color: Color.fromRGBO(115, 145, 166, 0.1),
                //     offset: Offset(0, 10),
                //     blurRadius: 20,
                //   ),
                // ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 42,
              height: 24,
              decoration: BoxDecoration(
                color: context.color.logoGradient.colors.last,
                borderRadius: BorderRadius.circular(4),
                // boxShadow: const <BoxShadow>[
                //   BoxShadow(
                //     color: Color.fromRGBO(115, 145, 166, 0.1),
                //     offset: Offset(0, 10),
                //     blurRadius: 20,
                //   ),
                // ],
              ),
            ),
          ),
          Positioned(
            top: 20.5,
            left: -2,
            child: Container(
              width: 4,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          Positioned(
            top: 20.5,
            right: -2,
            child: Container(
              width: 4,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          Center(
            child: Text(
              number,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
