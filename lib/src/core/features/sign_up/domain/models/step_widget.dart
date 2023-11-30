import 'package:flutter/widgets.dart';

class StepWidget {
  StepWidget({
    required this.typingDuration,
    required this.child,
    this.readingDuration,
    this.replaceChild,
  });

  final int typingDuration;
  final int? readingDuration;
  final Widget child;
  final Widget? replaceChild;
}
