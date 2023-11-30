import 'dart:math';

import 'package:flutter/material.dart';

class UiCircleProgressIndicator extends StatefulWidget {
  const UiCircleProgressIndicator({
    super.key,
    this.width = 50,
    this.height = 50,
    this.percent,
    this.color = Colors.white,
    this.secondaryColor = const Color.fromARGB(60, 255, 255, 255),
    this.strokeWidth = 6,
  });
  final double? percent;

  final Color color;
  final Color secondaryColor;

  final double width;
  final double height;

  final double strokeWidth;
  @override
  UiCircleProgressIndicatorState createState() =>
      UiCircleProgressIndicatorState();
}

class UiCircleProgressIndicatorState extends State<UiCircleProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      upperBound: 2 * pi,
      duration: const Duration(seconds: 1),
    );

    if (widget.percent == null) {
      controller
        ..forward(from: 0)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            controller.repeat();
          }
        });
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 36,
        minHeight: 36,
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return CustomPaint(
            size: Size(widget.width, widget.height),
            painter: widget.percent == null
                ? _CircleInfinite(
                    color: widget.color,
                    secondaryColor: widget.secondaryColor,
                    angle: controller.value,
                    strokeWidth: widget.strokeWidth,
                  )
                : _CircleFixed(
                    color: widget.color,
                    secondaryColor: widget.secondaryColor,
                    strokeWidth: widget.strokeWidth,
                    angle: 2 * pi * ((widget.percent ?? 0) / 100),
                  ),
          );
        },
      ),
    );
  }
}

class _CircleInfinite extends CustomPainter {
  _CircleInfinite({
    required this.angle,
    required this.color,
    required this.secondaryColor,
    this.strokeWidth = 6,
  });

  final double angle;

  final Color color;
  final Color secondaryColor;

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = secondaryColor;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = color;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.2, size.height * 0.2);

    final double arcAngle = angle;

    canvas
      ..drawArc(
        Rect.fromCircle(center: center, radius: radius),
        0,
        2 * pi,
        false,
        paint1,
      )
      ..drawArc(
        Rect.fromCircle(center: center, radius: radius),
        arcAngle,
        0.8,
        false,
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _CircleFixed extends CustomPainter {
  _CircleFixed({
    required this.angle,
    required this.color,
    required this.secondaryColor,
    this.strokeWidth = 6,
  });

  final double angle;

  final Color color;
  final Color secondaryColor;

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = secondaryColor;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..color = color;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.2, size.height * 0.2);

    canvas
      ..drawArc(
        Rect.fromCircle(center: center, radius: radius),
        0,
        2 * pi,
        false,
        paint1,
      )
      ..drawArc(
        Rect.fromCircle(center: center, radius: radius),
        0,
        angle,
        false,
        paint,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
