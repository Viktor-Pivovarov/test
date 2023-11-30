import 'dart:async';
import 'dart:convert';

import 'package:centrifuge/centrifuge.dart' as centrifuge;
import 'package:flutter/foundation.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class JSocket {
  JSocket({required this.dio});

  final Dio dio;

  late final centrifuge.Client _client;

  final Map<String, centrifuge.Subscription> _channelSubscriptions = {};

  bool isConnected = false;

  final List<StreamSubscription<dynamic>> _connectSubscriptions = [];

  StreamController<ConnectEvent> streamConnect =
      StreamController<ConnectEvent>.broadcast();

  void createClient(String url) {
    _client = centrifuge.createClient(
      url,
      centrifuge.ClientConfig(getToken: _getToken),
    );
  }

  Future<String> _getToken(_) async {
    try {
      final response = await dio.get<dynamic>('/v1/socket-token-generate');

      return response.data.toString();
    } catch (_) {
      print(_);
    }

    return '';
  }

  Future<StreamController<ConnectEvent>> connect() async {
    _connectSubscriptions
      ..add(_client.connecting.listen(_onEventConnecting))
      ..add(_client.connected.listen(_onEventConnected))
      ..add(_client.disconnected.listen(_onEventDisconnected));

    await _client.connect();

    isConnected = true;

    return streamConnect;
  }

  Future<void> disconnect() async {
    for (final element in _connectSubscriptions) {
      await element.cancel();
    }

    for (final key in _channelSubscriptions.keys) {
      await _channelSubscriptions[key]?.unsubscribe();

      _channelSubscriptions.removeWhere((itemKey, value) => key == itemKey);
    }

    isConnected = false;
  }

  void _onEventConnecting(centrifuge.ConnectingEvent event) {
    if (kDebugMode) {
      print('onEventConnecting');
      print('code: ${event.code}');
      print('reason: ${event.reason}');
    }

    streamConnect.sink.add(
      ConnectEvent(
        code: event.code,
        reason: event.reason,
      ),
    );
  }

  void _onEventConnected(centrifuge.ConnectedEvent event) {
    if (kDebugMode) {
      print('onEventConnected');
      print('version: ${event.version}');
      print('client: ${event.client}');
      print('data: ${event.data}');
    }

    streamConnect.sink.add(
      ConnectEvent(
        data: event.data.isNotEmpty
            ? json.decode(utf8.decode(event.data)).toString()
            : null,
        client: event.client,
      ),
    );
  }

  void _onEventDisconnected(centrifuge.DisconnectedEvent event) {
    if (kDebugMode) {
      print('onEventDisconnected');
      print('code: ${event.code}');
      print('reason: ${event.reason}');
    }

    streamConnect.sink.add(
      ConnectEvent(
        code: event.code,
        reason: event.reason,
      ),
    );
  }

  dynamic subscribeToChannel(
    String channelName,
    void Function(Map<String, dynamic> message) onMessage,
  ) async {
    if (_channelSubscriptions.containsKey(channelName)) {
      return;
    }

    _channelSubscriptions.putIfAbsent(
      channelName,
      () => _client.newSubscription(channelName),
    );

    _channelSubscriptions[channelName]?.subscribing.listen(
      (event) {
        print('subscribing: $event');
      },
    );

    _channelSubscriptions[channelName]?.subscribed.listen(
      (event) {
        print('subscribed: $event');
      },
    );

    _channelSubscriptions[channelName]?.unsubscribed.listen(
      (event) {
        print('unsubscribed: $event');
      },
    );

    _channelSubscriptions[channelName]?.publication.listen((event) {
      // print(event.offset);
      // print(event.tags);

      onMessage(json.decode(utf8.decode(event.data)) as Map<String, dynamic>);

      // print('New Message in $channelName channel: ${message.runtimeType}');
    });

    await _channelSubscriptions[channelName]?.subscribe();
  }
}
