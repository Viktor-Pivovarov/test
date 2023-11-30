import 'dart:io';

import 'package:cli_dialog/cli_dialog.dart';
import 'package:path/path.dart' as path;
import 'package:process_run/shell.dart';
import 'package:pubspec_yaml/pubspec_yaml.dart';

void main() async {
  await _buildApp();
}

Future<void> _buildApp() async {
  final shell = Shell();

  final pubspecStr = File('pubspec.yaml').readAsStringSync();
  final pubspecYaml = pubspecStr.toPubspecYaml();

  final String versionStr = pubspecYaml.version.valueOr(() => '');

  final version = _AppVersion.parse(versionStr);

  _AppVersion newVersion = version;

  const listQuestions = [
    [
      {
        'question': 'What do you want to build?',
        'options': [
          'dev',
          'prod',
        ],
      },
      'flavor',
    ],
  ];

  final questions = [
    ['API_URL: (Default: https://api.jojo-dating.com/api)', 'api_url'],
  ];

  final dialog = CLI_Dialog(
    listQuestions: listQuestions,
    questions: questions,
    order: [
      'flavor',
      'increment',
    ],
  );

  final answer = dialog.ask();
  final String apiUrl =
      (answer['api_url'] as String?) ?? 'https://api.jojo-dating.com/api';

  final flavorStr = '--flavor=${answer['flavor']}';
  final apiUrlStr = 'API_URL=$apiUrl';

  newVersion = _AppVersion.parse(version.getIncrementVersion);

  await File('pubspec.yaml').writeAsString(
    pubspecStr.replaceFirst(
      'version: ${version.fullVersion}',
      'version: ${version.getIncrementVersion}',
    ),
  );

  await shell.run('''
  # Display some text
  flutter build apk $flavorStr --dart-define=$apiUrlStr --dart-define=WS_URL=ws://api.jojo-dating.com:8000/connection/websocket --dart-define=APP_METRICA_KEY=8b32070a-64d6-4069-9880-a7c891c0b569
  ''');

  final File buildFile =
      File('./build/app/outputs/flutter-apk/app-dev-release.apk');

  final String dir = path.dirname(buildFile.path);
  final String newPath =
      path.join(dir, 'app-dev-release_${newVersion.fullVersion}.apk');

  buildFile.renameSync(newPath);

  final newDialog = CLI_Dialog(
    booleanQuestions: [
      ['Do you want to open folder?', 'isOpen'],
    ],
    trueByDefault: true,
  );

  final newAnswer = newDialog.ask();

  if (newAnswer['isOpen'] as bool) {
    await shell.run('''
  # Display some text
  open build/app/outputs/flutter-apk
  ''');
  }
}

class _AppVersion {
  _AppVersion({
    required this.major,
    required this.minor,
    required this.patch,
    required this.build,
  });

  final int major;
  final int minor;
  final int patch;
  final int build;

  String get version => '$major.$minor.$patch';
  String get fullVersion => '$version+$build';

  String get getIncrementVersion => '$major.$minor.$patch+${build + 1}';

  // ignore: prefer_constructors_over_static_methods
  static _AppVersion parse(String value) {
    final String version = value.split('+').first;
    final int buildNumber = int.parse(value.split('+').last);

    final v = version.split('.').map(int.parse).toList();

    return _AppVersion(
      major: v[0],
      minor: v[1],
      patch: v[2],
      build: buildNumber,
    );
  }
}
