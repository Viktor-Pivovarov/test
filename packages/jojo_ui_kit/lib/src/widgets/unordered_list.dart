import 'package:flutter/material.dart';

class UnorderedList extends StatelessWidget {
  const UnorderedList({
    required this.texts,
    super.key,
    this.style,
  });

  final List<String> texts;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = <Widget>[];

    for (final String text in texts) {
      // Add list item
      widgetList
        ..add(UnorderedListItem(text: text, style: style))
        ..add(const SizedBox(height: 5));
    }

    return Column(children: widgetList);
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem({
    required this.text,
    super.key,
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('• '),
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
