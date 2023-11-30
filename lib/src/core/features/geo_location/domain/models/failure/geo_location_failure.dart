import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GeoLocationFailure extends Failure {
  GeoLocationFailure({
    required super.code,
    required super.message,
  });

  @override
  String getLocalizedString() {
    switch (code) {
      case 500:
        return CoreI18n.internalError;
      case 404:
        return GeoLocationI18n.geoLocationNotFound;
      default:
        return CoreI18n.unknownError;
    }
  }
}
