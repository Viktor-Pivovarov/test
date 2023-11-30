// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() async {
  final intlMessages = File('./assets/l10n/intl_messages.arb');

  final Map<String, dynamic> translations =
      jsonDecode(intlMessages.readAsStringSync()) as Map<String, dynamic>
        ..removeWhere((key, value) => key.contains('@'));

  final dir = Directory('./assets/l10n/');
  final List<FileSystemEntity> entities = await dir.list().toList();

  final Iterable<FileSystemEntity> translationFiles =
      entities.where((element) => !element.path.endsWith('intl_messages.arb'));

  final Map<String, Map<String, dynamic>> langs = {};

  for (final element in translationFiles) {
    final Map<String, dynamic> translationsByLang =
        jsonDecode(File(element.path).readAsStringSync())
            as Map<String, dynamic>
          ..removeWhere((key, value) => key.contains('@'));

    langs.putIfAbsent(
      element.path.split('_').last.split('.').first,
      () => translationsByLang,
    );
  }

  final Map<String, List<String>> values = {};

  translations.forEach((trKey, trValue) {
    langs.forEach((key, value) {
      if (!values.containsKey(key)) {
        values.putIfAbsent(key, () => <String>[]);
      }

      if (!value.containsKey(trKey)) {
        // ignore: avoid_dynamic_calls
        values[key]?.add(trKey);
      }
    });
  });

  values.removeWhere((key, value) => value.isEmpty);

  if (values.isEmpty) {
    print('No issue found');
  }

  values.forEach((key, value) {
    if (value.isEmpty) {
      return;
    }

    print('====== $key start======\n');
    // ignore: inference_failure_on_untyped_parameter
    value.forEach(print);
    print('\n====== $key finish======\n\n');
  });
}
