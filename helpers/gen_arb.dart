// ignore_for_file: avoid_print

import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:process_run/shell.dart';

void main() async {
  final shell = Shell();

  final Directory current = Directory.current;

  final dir = Directory(p.joinAll([current.path, 'lib', 'src']));
  final menuDir = Directory(
    p.joinAll([current.path, 'packages', 'jojo_menu', 'lib', 'src']),
  );

  final List<String> list = await dir
      .list(recursive: true)
      .where((event) => event.path.contains('l10n.dart'))
      .map((event) => event.path)
      .toList();

  final List<String> menuList = await menuDir
      .list(recursive: true)
      .where((event) => event.path.contains('l10n.dart'))
      .map((event) => event.path)
      .toList();

  print('Generation of arb started\n');

  try {
    await shell.run('''
      dart pub global run intl_generator:extract_to_arb --output-dir=assets/l10n ${[
      ...list,
      ...menuList,
    ].join(' ')}
''');

    print('\nGeneration of arb finished\n');
  } catch (_) {
    print('Generation of arb finished with Error:\n\n$_');
  }
}
