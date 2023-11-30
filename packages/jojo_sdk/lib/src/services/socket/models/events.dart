class ConnectEvent {
  ConnectEvent({
    this.reason,
    this.data,
    this.code = 0,
    this.client,
  });

  final int code;
  final String? reason;
  final String? data;
  final String? client;
}
