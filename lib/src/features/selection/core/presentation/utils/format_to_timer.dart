import 'package:jojo/src/features/selection/_selection.dart';

String formatDurationToHours(Duration duration) {
  return duration.inHours.toString().padLeft(2, '0');
}

String formatDurationToMinutes(Duration duration) {
  return (duration.inMinutes % 60).toString().padLeft(2, '0');
}

String formatDurationToSeconds(Duration duration) {
  return (duration.inSeconds % 60).toString().padLeft(2, '0');
}

String formatToHour(DateTime? date) {
  if (date == null) {
    return '00';
  }

  final DateTime _now = DateTime.now();

  final Duration difference = date.difference(_now);

  final int _hours = difference.inHours; // - difference.inDays * 24;

  return _hours < 10 ? '0$_hours' : _hours.toString();
}

String formatToMinutes(DateTime? date) {
  if (date == null) {
    return '00';
  }

  final DateTime _now = DateTime.now();

  final Duration difference = date.difference(_now);

  final int _minutes = difference.inMinutes - difference.inHours * 60;

  return _minutes < 10 ? '0$_minutes' : _minutes.toString();
}

String formatToSeconds(DateTime? date) {
  if (date == null) {
    return '00';
  }

  final DateTime _now = DateTime.now();

  final Duration difference = date.difference(_now);

  final int _seconds = difference.inSeconds - difference.inMinutes * 60;

  return _seconds < 10 ? '0$_seconds' : _seconds.toString();
}

String formatToTimer(DateTime? time) {
  if (time == null) {
    return '';
  }

  final DateTime _now = DateTime.now();
  final DateTime _timer = time.toLocal();
  final Duration difference = _timer.difference(_now);

  final int _hours = difference.inHours - difference.inDays * 24;
  final int _minutes = difference.inMinutes - difference.inHours * 60;

  final String days = SelectionI18n.daysPlural(difference.inDays);
  final String hours = SelectionI18n.hoursPlural(_hours);
  final String minutes = SelectionI18n.minutesPlural(_minutes);

  if (difference.inDays != 0) {
    return '$days $hours $minutes';
  }

  if (difference.inHours != 0) {
    return '$hours $minutes';
  }

  if (difference.inMinutes != 0) {
    return minutes;
  }

  return '00:00:00';
}
