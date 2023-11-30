import 'package:flutter/material.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class SelectFieldDelegate extends SearchDelegate<String> {
  SelectFieldDelegate(this.options) : super(searchFieldLabel: 'Поиск');

  final List<String> options;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: options.where((String element) {
          return element.toLowerCase().contains(query.toLowerCase());
        }).map((String e) {
          return ListTile(
            onTap: () => close(context, e),
            title: Text(e),
            contentPadding: const EdgeInsets.symmetric(horizontal: Insets.l),
            dense: true,
            trailing: const Icon(Icons.keyboard_arrow_right),
          );
        }).toList(),
      ),
    );
  }
}
