import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  factory FirebaseService() {
    return _firebaseService;
  }

  FirebaseService._internal();

  static final FirebaseService _firebaseService = FirebaseService._internal();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<String?> getToken() => _messaging.getToken();

  Future<String?> getAPNSToken() => _messaging.getAPNSToken();

  Future<NotificationSettings> requestPermission() =>
      _messaging.requestPermission();

  Future<void> setForegroundNotificationPresentationOptions() =>
      _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

  Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;
  Stream<RemoteMessage> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp;

  Future<RemoteMessage?> getInitialMessage() => _messaging.getInitialMessage();
  Future<void> setAutoInitEnabled(bool enabled) =>
      _messaging.setAutoInitEnabled(enabled);

  Future<FirebaseApp> initializeApp({
    String? name,
    FirebaseOptions? options,
  }) =>
      Firebase.initializeApp(
        name: name,
        options: options,
      );

  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp();

    // print("Handling a background message: ${message.messageId}");
  }
}
