/// Онбординг
abstract class AuthRoutePath {
  static const String onboarding = '/onboarding';

  static const String sex = '$onboarding/sex';

  static const String greetings = '$onboarding/greetings';

  static const String lgbt = '$onboarding/lgbt';

  static const String astrological = '$onboarding/astrological';

  static const String verification = '$onboarding/verification';

  static const String verificationNotReady =
      '$onboarding/verification-not-ready';

  static const String notification = '$onboarding/notification';

  static const String payment = '$onboarding/payment';

  static const String paymentNotReady = '$onboarding/payment-not-ready';

  static const String geoLocation = '$onboarding/geo-location';

  static const String geoLocationSelectCity =
      '$onboarding/geo-location/select-city';

  static const String checkNotifications = '$onboarding/check-notifications';
}
