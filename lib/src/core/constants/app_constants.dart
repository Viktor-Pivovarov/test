import 'dart:io';

import 'package:flutter/foundation.dart';

enum Environment { dev, prod }

abstract class AppConstants {
  static const String projectName = 'JoJo';
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isWeb => kIsWeb;
  static const String iOSId = 'com.dating.JoJo';
  static const String iOSAppStoreId = '';
  static const String androidId = 'com.dating.JoJo';

  static const String iOSUrl =
      'https://itunes.apple.com/ru/app/neoflexportal/id1519167911';
  static const String androidUrl =
      'https://play.google.com/store/apps/details?id=com.neoflex.neoflex_neoportal';

  /// Метод дл определения ссылки на магазин в зависимости от устройства.
  static String get getUrlStore {
    String _url = '';

    if (isIOS) _url = iOSUrl;
    if (isAndroid) _url = androidUrl;

    return _url;
  }

  static String get getAppId {
    if (isIOS) {
      return iOSId;
    }

    if (isAndroid) {
      return androidId;
    }

    return '';
  }
}
