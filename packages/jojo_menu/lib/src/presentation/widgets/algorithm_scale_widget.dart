import 'package:flutter/material.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class AlgorithmScaleWidget extends StatelessWidget {
  const AlgorithmScaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AlgorithmScaleIndicator(),
        const SizedBox(
          width: Insets.xl,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('<18', style: context.text.numbers),
                      Text(
                        MenuI18n.points,
                        style: context.text.mainTextMedium,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 56, top: Insets.xs),
                    child: Text(
                      MenuI18n.harmony,
                      style: context.text.mainTextMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 42,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('18-24', style: context.text.numbers),
                      Text(
                        MenuI18n.points,
                        style: context.text.mainTextMedium,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 36, top: Insets.xs),
                      child: Text(
                        MenuI18n.normalUnion,
                        style: context.text.mainTextMedium,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('25-32', style: context.text.numbers),
                      Text(
                        MenuI18n.points,
                        style: context.text.mainTextMedium,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 36, top: Insets.xs),
                      child: Text(
                        MenuI18n.veryGood,
                        style: context.text.mainTextMedium,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text('32+', style: context.text.numbers),
                      Text(
                        MenuI18n.points,
                        style: context.text.mainTextMedium,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 56, top: Insets.xs),
                      child: Text(
                        MenuI18n.great,
                        style: context.text.mainTextMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AlgorithmScaleIndicator extends StatelessWidget {
  const AlgorithmScaleIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(12, 370),
      painter: _AlgorithmScalePainter(),
    );
  }
}

class _AlgorithmScalePainter extends CustomPainter {
  _AlgorithmScalePainter();

  static const Color gradientColor1 = Color(0xFFC4C4C4);
  static const Color gradientColor2 = Color(0xFf36B522);
  static const Color ellipseColor1 = Color(0xFFBCC3BB);
  static const Color ellipseColor2 = Color(0xFF95BF8E);
  static const Color ellipseColor3 = Color(0xFF6EBA62);
  static const Color ellipseColor4 = Color(0xFF27AE60);

  @override
  void paint(Canvas canvas, Size size) {
    final paintLine = Paint()
      ..strokeWidth = 4
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          gradientColor1,
          gradientColor2,
        ],
      ).createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    final ellipseWhite = Paint()..color = Colors.white;

    final ellipse1 = Paint()..color = ellipseColor1;
    final ellipse2 = Paint()..color = ellipseColor2;
    final ellipse3 = Paint()..color = ellipseColor3;
    final ellipse4 = Paint()..color = ellipseColor4;

    canvas
      ..drawLine(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        paintLine,
      )
      ..drawCircle(Offset(size.width / 2, 26), 6, ellipseWhite)
      ..drawCircle(Offset(size.width / 2, 26), 4, ellipse1)
      ..drawCircle(Offset(size.width / 2, 126), 6, ellipseWhite)
      ..drawCircle(Offset(size.width / 2, 126), 4, ellipse2)
      ..drawCircle(Offset(size.width / 2, 226), 6, ellipseWhite)
      ..drawCircle(Offset(size.width / 2, 226), 4, ellipse3)
      ..drawCircle(Offset(size.width / 2, 326), 6, ellipseWhite)
      ..drawCircle(Offset(size.width / 2, 326), 4, ellipse4);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
