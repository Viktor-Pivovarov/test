abstract class RoutePath {
  const RoutePath._();

  /// Splash
  static const String initial = '/';

  static const String onboardingSignUp = '/onboarding/sign-up';

  /// Аутентификация/Авторизация
  static const String auth = '/auth';

  static const String support = '/auth/support';

  static const String authSignUp = '$auth/sign-up';

  static const String authSignUpSelectType = '$auth/sign-up/selectType';

  static const String authSignUpGeoLocation = '$auth/sign-up/geoLocation';

  static const String authSignUpNotification = '$auth/sign-up/notification';

  static const String authSignUpSteps = '$auth/sign-up/steps';

  static const String authSignIn = '$auth/sign-in';

  static const String authAccountNotFound = 'account-not-found/:type';

  /// Авторизованная зона
  static const String main = '/main';

  static const String history = 'history';

  static const String search = 'search';

  static const String chat = 'chat';

  static const String menu = 'menu';
}

extension RouteWithParams on String {
  String apiPathParams(Map<String, dynamic> params) {
    return params.keys.fold<String>(this, (String value, String element) {
      return value.replaceFirst(
        '{$element}',
        (params[element] ?? '').toString(),
      );
    }).replaceAll(RegExp('/:[a-zA-Z]*/*'), '');
  }

  String routeParams(Map<String, dynamic> params) {
    return params.keys.fold<String>(this, (String value, String element) {
      return value.replaceFirst(
        ':$element',
        (params[element] ?? '').toString(),
      );
    }).replaceAll(RegExp('/:[a-zA-Z]*/*'), '');
  }

  String query(Map<String, dynamic> params) {
    return this +
        Uri(
          queryParameters: params.map<String, dynamic>(
            (String key, dynamic value) => MapEntry<String, dynamic>(
              key,
              value.toString(),
            ),
          ),
        ).toString();
  }
}
