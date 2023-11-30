import 'package:flutter/material.dart';

class UiSliderField extends StatelessWidget {
  const UiSliderField({
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
    this.disabled = false,
    super.key,
  });

  final double value;
  final double min;
  final double max;
  final void Function(double value)? onChanged;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Theme.of(context).primaryColor,
        inactiveTrackColor: const Color(0xffFFBCC7).withOpacity(0.4),
        // trackShape: const RoundedRectSliderTrackShape(),
        trackShape: CustomTrackShape(),
        trackHeight: 4,
        thumbShape: SliderThumbCircle(
          thumbRadius: 28,
          min: min.toInt(),
          max: max.toInt(),
        ),
        thumbColor: Theme.of(context).primaryColor,
        overlayColor: const Color(0xffFFBCC7).withOpacity(0.4),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 28),
        tickMarkShape: const RoundSliderTickMarkShape(),
        activeTickMarkColor: Theme.of(context).primaryColor,
        inactiveTickMarkColor: const Color(0xffFFBCC7).withOpacity(0.4),
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorColor: Theme.of(context).primaryColor,
        valueIndicatorTextStyle: const TextStyle(color: Colors.white),
      ),
      child: Slider(
        value: value,
        min: min,
        max: max,
        onChanged: disabled ? null : onChanged,
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    Offset offset = Offset.zero,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class SliderThumbCircle extends SliderComponentShape {
  const SliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  final double thumbRadius;
  final int min;
  final int max;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = Colors.red //Thumb Background Color
      ..style = PaintingStyle.fill;

    final Paint paint2 = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill;

    canvas
      ..drawCircle(center, thumbRadius * .5, paint)
      ..drawCircle(center, thumbRadius * .25, paint2);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
