import 'package:logger/logger.dart';

import '_src.dart';

class XPrinter extends PrettyPrinter {
  XPrinter({
    this.useColor = true,
    this.showStackTrace = false,
    Type? type,
  }) : _type = type ?? XPrinter;
  static const String topLeftCorner = '┌';
  static const String bottomLeftCorner = '└';
  static const String middleCorner = '├';
  static const String verticalLine = '│';
  static const String doubleDivider = '###';
  static const String singleDivider = '┄';

  final bool showStackTrace;

  final Type _type;

  final bool useColor;

  @override
  List<String> log(LogEvent event) {
    String? stackTraceStr;

    if (event.stackTrace != null && errorMethodCount > 0) {
      stackTraceStr = formatStackTrace(event.stackTrace, errorMethodCount);
    }

    if (useColor) {
      return _formatAndPrintWithColor(
        event.level,
        stringifyMessage(event.message),
        DateTime.now(),
        event.error?.toString(),
        stackTraceStr,
      );
    }

    return _formatAndPrint(
      event.level,
      stringifyMessage(event.message),
      DateTime.now(),
      event.error?.toString(),
      stackTraceStr,
    );
  }

  ///
  /// --
  /// | 2022-11-29T21:47:42.264095
  /// | ClassName: MyClass
  /// | Error
  /// | Message
  /// | StackTrace
  /// --
  ///
  List<String> _formatAndPrintWithColor(
    Level level,
    String message,
    DateTime time,
    String? error,
    String? stacktrace,
  ) {
    String emoji = _getEmoji(level);

    final XLoggerModel logModel = XLoggerModel(
      level: level,
      date: time,
      className: _type.toString(),
      error: error?.split('\n'),
      stacktrace: showStackTrace ? stacktrace?.split('\n') : null,
      message: <String>[...message.split('\n')],
    );

    return <String>[emoji, logModel.toLogString()];

    // // This code is non trivial and a type annotation here helps understanding.
    // // ignore: omit_local_variable_types
    // List<String> buffer = <String>[];
    // String verticalLineAtLevel = (includeBox[level]!)
    // ? ('$verticalLine ') : '';
    // AnsiColor color = _getLevelColor(level);
    // if (includeBox[level]!) buffer.add(color(_topBorder));

    // if (error != null) {
    //   AnsiColor errorColor = _getErrorColor(level);
    //   for (String line in error.split('\n')) {
    //     buffer.add(
    //       color(verticalLineAtLevel) +
    //           errorColor.resetForeground +
    //           errorColor(line) +
    //           errorColor.resetBackground,
    //     );
    //   }
    //   if (includeBox[level]!) buffer.add(color(_middleBorder));
    // }

    // if (stacktrace != null) {
    //   for (String line in stacktrace.split('\n')) {
    //     buffer.add(color('$verticalLineAtLevel$line'));
    //   }
    //   if (includeBox[level]!) buffer.add(color(_middleBorder));
    // }

    // if (time != null) {
    //   buffer.add(color('$verticalLineAtLevel$time'));
    //   if (includeBox[level]!) buffer.add(color(_middleBorder));
    // }

    // String emoji = _getEmoji(level);
    // for (String line in message.split('\n')) {
    //   buffer.add(color('$verticalLineAtLevel$emoji$line'));
    // }
    // if (includeBox[level]!) buffer.add(color(_bottomBorder));

    // return buffer;
  }

  List<String> _formatAndPrint(
    Level level,
    String message,
    DateTime time,
    String? error,
    String? stacktrace,
  ) {
    // This code is non trivial and a type annotation here helps understanding.
    // ignore: omit_local_variable_types

    String emoji = _getEmoji(level);

    final XLoggerModel logModel = XLoggerModel(
      level: level,
      date: time,
      className: _type.toString(),
      error: error?.split('\n'),
      stacktrace: showStackTrace ? stacktrace?.split('\n') : null,
      message: <String>[emoji, ...message.split('\n')],
    );

    return <String>[logModel.toString()];
  }

  String _getEmoji(Level level) {
    if (printEmojis) {
      return PrettyPrinter.levelEmojis[level]!;
    } else {
      return '';
    }
  }
}
