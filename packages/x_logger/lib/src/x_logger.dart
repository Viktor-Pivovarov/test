import 'dart:io';

import 'package:collection/collection.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '_src.dart';
import 'file_output.dart';
import 'printer.dart';

class XLogger {
  XLogger({
    required this.type,
    this.level = Level.verbose,
    this.logToFile = false,
    this.showStackTrace = false,
  }) : _logger = Logger(
          output: logToFile ? XFileOutput() : null,
          level: level,
          printer: XPrinter(
            useColor: !logToFile,
            showStackTrace: showStackTrace,
            type: type,
          ),
        );

  final bool showStackTrace;

  late final Logger _logger;

  final bool logToFile;

  final Type type;

  final Level level;

  /// Show Debug message
  void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message, error, stackTrace);
  }

  /// Show Error message
  void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error, stackTrace);
  }

  /// Show Info message
  void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message, error, stackTrace);
  }

  /// Show Verbose message
  void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.v(message, error, stackTrace);
  }

  /// Show Warning message
  void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message, error, stackTrace);
  }

  /// Show What the f**k
  void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.wtf(message, error, stackTrace);
  }

  Future<List<FileSystemEntity>> getLogs() async {
    final Directory dir = Directory(await _getDirectory);

    return dir.list().toList();
  }

  Future<List<XLoggerModel>> getLogsByDateFormatted(DateTime date) async {
    List<FileSystemEntity> files = await getLogs();

    FileSystemEntity? file = files.firstWhereOrNull(
        (FileSystemEntity element) => element.path
            .split('/')
            .last
            .contains('${date.day}-${date.month}-${date.year}'));

    if (file == null) {
      return <XLoggerModel>[];
    }

    final List<String> lines = await File(file.path).readAsLines();

    return lines
        .map<XLoggerModel>((String e) => XLoggerModel.fromString(e))
        .toList();
  }

  Future<String> get _getDirectory async {
    //Get external storage directory
    Directory? directory = await getExternalStorageDirectory();
    //Check if external storage not available. If not available use
    //internal applications directory
    directory ??= await getApplicationDocumentsDirectory();

    return '${directory.path}/logs';
  }
}
