// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() {
  // final intlMessages = File('./assets/l10n/intl_messages.arb');
  // final intlMessagesEn = File('./assets/l10n/intl_messages_en.arb');
  // final intlMessagesRu = File('./assets/l10n/intl_messages_ru.arb');

  // final Map<String, dynamic> translations =
  //     jsonDecode(intlMessages.readAsStringSync()) as Map<String, dynamic>
  //       ..removeWhere((key, value) => key.contains('@'));

  // final Map<String, dynamic> translationsEn =
  //     jsonDecode(intlMessagesEn.readAsStringSync()) as Map<String, dynamic>
  //       ..removeWhere((key, value) => key.contains('@'));

  // final Map<String, dynamic> translationsRu =
  //     jsonDecode(intlMessagesRu.readAsStringSync()) as Map<String, dynamic>
  //       ..removeWhere((key, value) => key.contains('@'));

  // translations.forEach((key, value) {
  //   if (!translationsRu.containsKey(key)) {
  //     translationsRu.addAll({key: value});
  //   } else {
  //     translationsRu.remove(key);
  //   }
  //   if (!translationsEn.containsKey(key)) {
  //     translationsEn.addAll({key: value});
  //   } else {
  //     translationsEn.remove(key);
  //   }
  // });

  // if (translationsEn.isNotEmpty) {
  //   print('translationsEn\n');
  //   translationsEn.forEach((key, value) {
  //     print(key);
  //   });
  // }

  // if (translationsRu.isNotEmpty) {
  //   print('translationsRu\n');
  //   translationsRu.forEach((key, value) {
  //     print(key);
  //   });
  // }

  // if (translationsRu.isEmpty && translationsEn.isEmpty) {
  //   print('No issue found');
  // }

  final apiFile = File('./api.json');

  final Map<String, dynamic> apiJson = jsonDecode(apiFile.readAsStringSync())
      as Map<String, dynamic>
    ..removeWhere((key, value) => key.contains('@'));

  final paths =
      Map<String, dynamic>.from(apiJson['paths'] as Map<String, dynamic>);

  final Map<String, List<String>> apis = {};

  paths.forEach((key, value) {
    final fullPath = key;

    final group = key.split('/').elementAt(2);

    if (['danger', 'admin'].contains(group)) {
      return;
    }

    if (!apis.containsKey(group)) {
      apis.putIfAbsent(group, () => []);
    }

    apis[group]?.add(fullPath);
  });

  File('./api.dart').writeAsString(
    'final Map<String, List<String>> urls = ${jsonEncode(apis)};',
  );

  // translations.forEach((key, value) {
  //   if (!translationsRu.containsKey(key)) {
  //     translationsRu.addAll({key: value});
  //   } else {
  //     translationsRu.remove(key);
  //   }
  //   if (!translationsEn.containsKey(key)) {
  //     translationsEn.addAll({key: value});
  //   } else {
  //     translationsEn.remove(key);
  //   }
  // });

  // if (translationsEn.isNotEmpty) {
  //   print('translationsEn\n');
  //   translationsEn.forEach((key, value) {
  //     print(key);
  //   });
  // }

  // if (translationsRu.isNotEmpty) {
  //   print('translationsRu\n');
  //   translationsRu.forEach((key, value) {
  //     print(key);
  //   });
  // }

  // if (translationsRu.isEmpty && translationsEn.isEmpty) {
  //   print('No issue found');
  // }
}
