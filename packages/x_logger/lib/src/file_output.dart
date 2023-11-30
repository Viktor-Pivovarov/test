import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class XFileOutput extends LogOutput {
  final int maxDays = 3;

  File? file;

  @override
  void init() {
    super.init();

    _removeOldLogs();

    _logFile.then((File value) => file = value);
  }

  Future<void> _removeOldLogs() async {
    final DateTime now = DateTime.now(); // .add(const Duration(days: 2));

    List<FileSystemEntity> logs = await getLogs();

    if (logs.isEmpty) {
      return;
    }

    await Future.wait(logs.map((FileSystemEntity e) async {
      String dateName = e.path.split('/').last.split('.').first;

      List<String> _dateElements = dateName.split('-').reversed.toList();

      if (_dateElements.elementAt(1).length == 1) {
        _dateElements[1] = '0${_dateElements[1]}';
      }

      if (now.difference(DateTime.parse(_dateElements.join('-'))).inDays >=
          maxDays) {
        if (File(e.path).existsSync()) {
          await File(e.path).delete();
        }
      }
    }));
  }

  Future<List<FileSystemEntity>> getLogs() async {
    final Directory dir = Directory(await _getDirectory);

    final bool exists = await dir.exists();

    if (!exists) {
      await dir.create(recursive: true);
    }

    return dir.list().toList();
  }

  @override
  void output(OutputEvent event) async {
    if (file != null) {
      _outputToFile(event.lines);
    } else {
      _outputToConsole(event.lines);
    }
  }

  Future<void> _outputToFile(List<String> lines) async {
    final bool exists = await file?.exists() ?? false;

    if (!exists) {
      file = await _logFile;
    }

    await _writeLinesToFile(file!, lines);
  }

  _outputToConsole(List<String> lines) {
    for (String line in lines) {
      if (kDebugMode) {
        log(line);
      }
    }
  }

  Future<void> _writeLinesToFile(File file, List<String> lines) async {
    if (lines.isNotEmpty) {
      List<String> newLines = <String>[...lines];
      String line = newLines.first;

      await _writeLineToFile(file, line);

      newLines.removeAt(0);

      _writeLinesToFile(file, newLines);
    }
  }

  Future<File> _writeLineToFile(File file, String line) async {
    return file.writeAsString(
      '$line\n',
      mode: FileMode.writeOnlyAppend,
    );
  }

  Future<String> get _getDirectory async {
    Directory? directory;

    try {
      //Get external storage directory
      directory = await getExternalStorageDirectory();
    } catch (_) {
      //Check if external storage not available. If not available use
      //internal applications directory
      directory ??= await getApplicationDocumentsDirectory();
    }

    return '${directory?.path}/logs';
  }

  Future<File> get _logFile async {
    final String path = await _getDirectory;

    final DateTime now = DateTime.now(); // .subtract(const Duration(days: 4));

    final String day = '${now.day < 10 ? '0${now.day}' : now.day}';
    final String month = '${now.month}';
    final String year = '${now.year}';

    String fileName = '$day-$month-$year.log';

    return File('$path/$fileName').create(recursive: true);
  }
}
