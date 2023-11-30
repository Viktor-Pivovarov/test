import 'dart:math';

import 'package:flutter/material.dart';

class PulseIndicator extends StatefulWidget {
  const PulseIndicator({
    super.key,
    this.child,
    this.color,
    this.shader,
  });

  final Widget? child;
  final Color? color;
  final Shader? shader;

  @override
  State<PulseIndicator> createState() => _PulseIndicatorState();
}

class _PulseIndicatorState extends State<PulseIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Color get color => widget.color ?? Theme.of(context).primaryColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _startAnimation() {
    _controller
      ..stop()
      ..reset()
      ..repeat(
        period: const Duration(seconds: 1),
      );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SpritePainter(_controller, color, widget.shader),
      child: widget.child,
    );
  }
}

class SpritePainter extends CustomPainter {
  SpritePainter(this._animation, this._color, this._shader)
      : super(repaint: _animation);

  final Animation<double> _animation;
  final Color _color;
  final Shader? _shader;

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);

    final Color color = _color.withOpacity(opacity);

    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = sqrt(area * value / 4);
    late Paint paint;

    paint = Paint()
      ..color = color
      ..shader = _shader
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);

    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(SpritePainter oldDelegate) {
    return true;
  }
}
