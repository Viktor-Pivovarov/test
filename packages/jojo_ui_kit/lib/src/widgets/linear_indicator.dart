import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiLinearIndicator extends StatelessWidget {
  const UiLinearIndicator({
    required this.percent,
    super.key,
    this.radius = 8.0,
  });

  final int percent;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, radius),
      painter: _UiLinearIndicatorPainter(
        percent > 100
            ? 100
            : percent < 0
                ? 0
                : percent,
        radius,
      ),
    );
  }
}

class _UiLinearIndicatorPainter extends CustomPainter {
  _UiLinearIndicatorPainter(this.percent, this.radius);

  final int percent;
  final double radius;

  static const Color inactiveColor = Color(0xFFFFBCC7);
  static const Color activeColor = Color(0xFFF6193D);
  static const Color gradientColor1 = Color(0xFFF66919);
  static const Color gradientColor2 = Color(0xFFF6196C);
  static const Color gradientColor3 = Color(0xFFF6193D);

  @override
  void paint(Canvas canvas, Size size) {
    final normPercent = percent / 100;

    final paint1 = Paint()
      ..color = inactiveColor
      ..strokeWidth = 2;

    final paint2 = Paint()
      ..strokeWidth = 2
      ..color = activeColor;

    final paint3 = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [gradientColor1, gradientColor2, gradientColor3],
      ).createShader(
        Rect.fromCenter(
          center: Offset(size.width * normPercent - Insets.s, size.height / 2),
          width: Insets.l,
          height: Insets.l,
        ),
      );

    canvas
      ..drawLine(
        Offset(0, size.height / 2),
        Offset(size.width, size.height / 2),
        paint1,
      )
      ..drawCircle(
        Offset(size.width - radius, size.height / 2),
        radius,
        paint1,
      )
      ..drawLine(
        Offset(0, size.height / 2),
        Offset(size.width * normPercent, size.height / 2),
        paint2,
      );
    if (percent != 0) {
      canvas.drawCircle(
        Offset(size.width * normPercent - radius, size.height / 2),
        radius,
        paint3,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
