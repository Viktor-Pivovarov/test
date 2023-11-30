import 'package:flutter/material.dart';

class UiProgressBar extends StatelessWidget {
  const UiProgressBar({
    required this.value,
    this.height,
    super.key,
  });

  final double value;
  final double? height;

  double left(BoxConstraints constraints) {
    if (constraints.maxWidth * value - 27 <= 0) {
      return constraints.maxWidth * value;
    }

    return constraints.maxWidth * value - (value * 27);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              SizedBox(width: constraints.maxWidth, height: 2),
              Container(
                width: constraints.maxWidth - 13,
                height: 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              Container(
                width: constraints.maxWidth * value - (value * 27),
                height: 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              // TODO deprecated
              // Positioned(
              //   right: 0,
              //   child: Transform.rotate(
              //     angle: math.pi,
              //     child: Opacity(
              //       opacity: value == 1.0 ? 1.0 : 0.2,
              //       child: CrossPlatformSvg.asset(
              //         Assets.icons.rectangle,
              //         fit: BoxFit.cover,
              //         width: 14.0,
              //         height: 16.0,
              //       ),
              //     ),
              //   ),
              // ),
              // TODO deprecated
              // Positioned(
              //   left: left(constraints),
              //   child: CrossPlatformSvg.asset(
              //     Assets.icons.rectangle,
              //     fit: BoxFit.cover,
              //     width: 14.0,
              //     height: 16.0,
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
