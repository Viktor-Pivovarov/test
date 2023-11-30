import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class UiDistanceField extends StatelessWidget {
  const UiDistanceField({
    required this.formControl,
    super.key,
    this.label = '',
    this.units = 'Km.',
    this.from = 0,
    this.to = 50,
    this.step = 10,
  });

  final FormControl<double> formControl;

  final String label;
  final String units;

  final double from;
  final double to;
  final int step;

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder(
      builder: (context, control, child) {
        final value = control.value ?? from + step;
        final textStyles = context.text;
        final colors = context.color;
        return Column(
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: context.text.mainTitle,
                ),
                const Expanded(
                  child: SizedBox.shrink(),
                ),
                Text.rich(
                  TextSpan(
                    text: '${value.toStringAsFixed(0)} ',
                    style: textStyles.numbers
                        .copyWith(color: colors.mainAccentColor),
                    children: [
                      TextSpan(
                        text: units,
                        style: textStyles.smallText
                            .copyWith(color: colors.textColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: Insets.m,
            ),
            _Slider(
              from: from,
              to: to,
              step: step,
              value: value,
              onSelected: (value) {
                if (value != control.value) {
                  HapticFeedback.lightImpact();
                  control.value = value;
                }
              },
            ),
          ],
        );
      },
      formControl: formControl,
    );
  }
}

class _Slider extends StatefulWidget {
  const _Slider({
    required this.from,
    required this.to,
    required this.step,
    required this.value,
    this.onSelected,
  });

  final double from;
  final double to;
  final int step;

  final double value;

  final void Function(double)? onSelected;

  @override
  State<_Slider> createState() => __SliderState();
}

class __SliderState extends State<_Slider> with TickerProviderStateMixin {
  late double currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.value;
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget as _Slider);

    setState(() {
      currentValue = widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.from.toStringAsFixed(0),
          style: context.text.smallText.copyWith(
            color: context.color.smallTextColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: 9,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final steps = (widget.to - widget.from) ~/ widget.step;

              final stepOffset = constraints.maxWidth / steps;
              return GestureDetector(
                onTapDown: (details) {
                  final fullSteps =
                      (details.localPosition.dx + 28 + stepOffset / 2) ~/
                          stepOffset;
                  if (fullSteps == 0) {
                    return;
                  }

                  setState(() {
                    if (currentValue != fullSteps) {
                      currentValue = (fullSteps * widget.step).toDouble();
                      widget.onSelected?.call(currentValue);
                    }
                  });
                },
                onHorizontalDragUpdate: (details) {
                  final fullSteps =
                      (details.localPosition.dx + 28 + stepOffset / 2) ~/
                          stepOffset;
                  if (fullSteps == 0) {
                    return;
                  }

                  if (fullSteps > steps) {
                    return;
                  }

                  setState(() {
                    if (currentValue != fullSteps) {
                      currentValue = (fullSteps * widget.step).toDouble();
                      widget.onSelected?.call(currentValue);
                    }
                  });
                },
                child: Stack(
                  children: [
                    Align(
                      child: CustomPaint(
                        size: const Size(double.infinity, 28),
                        painter: _SliderPainter(
                          to: widget.to,
                          from: widget.from,
                          step: widget.step,
                          value: currentValue,
                        ),
                      ),
                    ),
                    Positioned(
                      left: constraints.maxWidth *
                              (currentValue / (widget.to - widget.from)) -
                          42,
                      child: _SliderIndicator(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          width: 9,
        ),
        Text(
          widget.to.toStringAsFixed(0),
          style: context.text.smallText.copyWith(
            color: context.color.smallTextColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _SliderIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UIShadow(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(25, 115, 145, 166),
          blurRadius: 1,
          //  offset: Offset(0, 2),
          spreadRadius: 1,
        ),
      ],
      child: Container(
        width: 28,
        height: 28,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.color.mainAccentColor,
          ),
        ),
      ),
    );
  }
}

class _SliderPainter extends CustomPainter {
  _SliderPainter({
    required this.from,
    required this.step,
    required this.to,
    required this.value,
  });

  static const Color secondaryColor = Color(0xFFE5E6E8);

  static const Color gradientColor1 = Color(0xFFF66919);
  static const Color gradientColor2 = Color(0xFFF6196C);
  static const Color gradientColor3 = Color(0xFFF6193D);

  final double value;
  final double from;
  final double to;
  final int step;

  @override
  void paint(Canvas canvas, Size size) {
    final paintSecondary = Paint()
      ..color = secondaryColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paintSecondary,
    );

    final steps = (to - from) ~/ step;

    final stepOffset = size.width / steps;

    final paintAccent = Paint()
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [gradientColor1, gradientColor2, gradientColor3],
      ).createShader(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
      );

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width * (value / (to - from)) - 28, size.height / 2),
      paintAccent,
    );

    final dividerPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3;

    for (var i = 0; i <= steps - 1; i++) {
      canvas.drawLine(
        Offset(i * stepOffset + 28, size.height / 2 + 2),
        Offset(i * stepOffset + 28, size.height / 2 - 2),
        dividerPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
