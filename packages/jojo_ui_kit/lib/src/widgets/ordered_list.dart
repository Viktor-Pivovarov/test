import 'package:flutter/material.dart';

class OrderedList extends StatelessWidget {
  const OrderedList({
    required this.texts,
    super.key,
    this.style,
    this.numberStyle,
  });

  final List<String> texts;
  final TextStyle? style;
  final TextStyle? numberStyle;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = <Widget>[];

    for (final String text in texts) {
      // Add list item
      widgetList.add(
        OrderedListItem(
          position: texts.indexOf(text) + 1,
          text: text,
          style: style,
          numberStyle: numberStyle,
        ),
      );
      // Add space between items
      widgetList.add(const SizedBox(height: 5));
    }

    return Column(children: widgetList);
  }
}

class OrderedListItem extends StatelessWidget {
  const OrderedListItem({
    required this.text,
    required this.position,
    super.key,
    this.style,
    this.numberStyle,
  });

  final String text;
  final TextStyle? style;
  final TextStyle? numberStyle;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$position. ',
          style: numberStyle,
        ),
        Expanded(
          child: Text(
            text,
            style: style ?? Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
