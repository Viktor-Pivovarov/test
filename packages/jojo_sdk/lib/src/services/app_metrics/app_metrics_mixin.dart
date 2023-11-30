import 'package:jojo_sdk/jojo_sdk.dart';

abstract mixin class AppMetricsMix {
  late final AppMetrics metrics;

  Future<void> sendMetricsEvent(
    AppMetricsEvent eventName, {
    Map<String, Object> params = const {},
  }) async {
    await metrics.sendEvent(eventName, params: params);
  }
}
