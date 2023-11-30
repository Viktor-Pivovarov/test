import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppMetrics {
  AppMetrics({required String appMetricaKey}) : _appMetricaKey = appMetricaKey;

  final String _appMetricaKey;

  final String _metricsSessionNameKey = 'metrics_session_num';

  late final SharedPreferences _preferences;

  String? deviceId;

  String? accountId;

  DateTime _sessionInitTime = DateTime.now();

  bool _isActivated = false;

  int _sessionNum = 0;

  int _eventNum = 1;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();

    _sessionNum = _preferences.getInt(_metricsSessionNameKey) ?? 0;

    await updateSession();

    try {
      await AppMetrica.activate(AppMetricaConfig(_appMetricaKey));

      _isActivated = true;
    } catch (_) {
      if (kDebugMode) {
        print(_);
      }
    }
  }

  Future<void> updateSession() async {
    _sessionNum += 1;

    _sessionInitTime = DateTime.now();

    await _preferences.setInt(_metricsSessionNameKey, _sessionNum);
  }

  bool get shouldUpdateSession =>
      DateTime.now().difference(_sessionInitTime).inMinutes > 20;

  Future<void> sendEvent(
    AppMetricsEvent eventName, {
    Map<String, Object> params = const {},
  }) async {
    if (!_isActivated) {
      return;
    }

    if (shouldUpdateSession) {
      await updateSession();
    }

    try {
      final Map<String, Object> _params = {
        'session_num': _sessionNum,
        'event_num': _eventNum,
        ...params,
      };

      if (deviceId != null) {
        _params.putIfAbsent('device_id', () => deviceId!);
      }

      if (accountId != null) {
        _params.putIfAbsent('account_id', () => accountId!);
      }

      if (kDebugMode) {
        print('params: $_params');
      }

      await AppMetrica.reportEventWithMap(eventName.name, _params);

      _eventNum += 1;
    } catch (_) {}
  }
}

enum AppMetricsEvent {
  screenOpen,
  tap,
  popup,
  push,
  firstOpen;

  String get name {
    switch (this) {
      case screenOpen:
        return 'screen_open';
      case tap:
      case popup:
      case push:
        return toString();
      case firstOpen:
        return 'first_open';
    }
  }
}
