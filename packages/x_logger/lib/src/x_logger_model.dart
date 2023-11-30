// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

extension StringExtension on Level {
  String capitalize() {
    return '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}';
  }
}

class XLoggerModel {
  final Level level;
  final DateTime date;
  final String className;
  final List<String> message;
  final List<String>? error;
  final List<String>? stacktrace;

  const XLoggerModel({
    required this.level,
    required this.date,
    required this.className,
    required this.message,
    this.error,
    this.stacktrace,
  });

  XLoggerModel copyWith({
    Level? level,
    DateTime? date,
    String? className,
    List<String>? message,
    List<String>? error,
    List<String>? stacktrace,
  }) {
    return XLoggerModel(
      level: level ?? this.level,
      date: date ?? this.date,
      className: className ?? this.className,
      message: message ?? this.message,
      error: error ?? this.error,
      stacktrace: stacktrace ?? this.stacktrace,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'level': level,
      'date': date.millisecondsSinceEpoch,
      'className': className,
      'message': message,
      'error': error,
      'stacktrace': stacktrace,
    };
  }

  factory XLoggerModel.fromMap(Map<String, dynamic> map) {
    return XLoggerModel(
      level: Level.values.firstWhere(
        (Level element) =>
            element.name == map['level'].toString().split('.').last,
        orElse: () => Level.nothing,
      ),
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      className: map['className'] as String,
      message: List<String>.from(map['message'] as List<String>),
      error: map['error'] != null
          ? List<String>.from(map['error'] as List<String>)
          : null,
      stacktrace: map['stacktrace'] != null
          ? List<String>.from(map['stacktrace'] as List<String>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory XLoggerModel.fromJson(String source) =>
      XLoggerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '''###level: $level; date: $date; className: $className; message: $message; error: $error; stacktrace: $stacktrace###''';
  }

  String toLogString() {
    final StringBuffer _buffer = StringBuffer();

    _buffer
        .write('\n\t${List<String>.generate(35, (int index) => '_').join()}');
    _buffer.write('\n\tclassName: $className;');
    _buffer.write('\n\tmessage: $message;');
    _buffer.write('\n\tlevel: $level;');
    _buffer.write('\n\tdate: $date;');

    if (error != null) {
      _buffer.write('\n\terror: $error;');
    }

    if (stacktrace != null) {
      _buffer.write('\n\tstacktrace: $stacktrace;');
    }

    _buffer
        .write('\n\t${List<String>.generate(35, (int index) => '_').join()}');

    return _buffer.toString();
  }

  factory XLoggerModel.fromString(String str) {
    String clearString(String element, String splitBy) {
      return element
          .trim()
          .split(splitBy)
          .last
          .trim()
          .replaceAll(RegExp(r'\[|\]'), '');
    }

    String line = str
        .split('###')
        .where((String element) => element.trim().isNotEmpty)
        .toList()
        .first;

    Map<String, dynamic> mapElement = <String, dynamic>{};

    line.split(';').forEach(
      (String element) {
        // print('index: ${line.split(';').indexOf(element)}: $element');
        if (element.trim().split('level:').first.trim().isEmpty) {
          mapElement.putIfAbsent(
            'level',
            () => clearString(element, 'level:'),
          );
        }

        if (element.trim().split('date:').first.trim().isEmpty) {
          mapElement.putIfAbsent(
              'date',
              () => DateTime.parse(element.trim().split('date:').last.trim())
                  .millisecondsSinceEpoch);
        }

        if (element.trim().split('className:').first.trim().isEmpty) {
          mapElement.putIfAbsent(
            'className',
            () => clearString(element, 'className:'),
          );
        }

        if (element.trim().split('message:').first.trim().isEmpty) {
          mapElement.putIfAbsent(
            'message',
            () => clearString(element, 'message:').split('\n'),
          );
        }

        if (element.trim().split('error:').first.trim().isEmpty) {
          mapElement.putIfAbsent(
            'error',
            () => clearString(element, 'error:').split('\n'),
          );
        }

        if (element.trim().split('stacktrace:').first.trim().isEmpty) {
          mapElement.putIfAbsent(
            'stacktrace',
            () => clearString(element, 'stacktrace:').split('\n'),
          );
        }
      },
    );

    return XLoggerModel.fromMap(mapElement);
  }

  @override
  bool operator ==(covariant XLoggerModel other) {
    if (identical(this, other)) return true;

    return other.level == level &&
        other.date == date &&
        other.className == className &&
        listEquals(other.message, message) &&
        listEquals(other.error, error) &&
        listEquals(other.stacktrace, stacktrace);
  }

  @override
  int get hashCode {
    return level.hashCode ^
        date.hashCode ^
        className.hashCode ^
        message.hashCode ^
        error.hashCode ^
        stacktrace.hashCode;
  }
}
