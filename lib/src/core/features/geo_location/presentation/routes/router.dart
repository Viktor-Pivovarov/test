import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GeoLocationRouter extends AppRouter {
  GeoLocationRouter(super.router);

  Future<GeoLocationModel?> goToGeoLocation({
    String? title,
    bool needHelp = false,
  }) async {
    final Map<String, String> _query = {};

    if (title != null) {
      _query.putIfAbsent('title', () => title);
    }

    if (needHelp) {
      _query.putIfAbsent('need-help', () => needHelp.toString());
    }

    return pushNamed<GeoLocationModel>(
      GeoLocationRoutePath.geoLocation.query(_query),
    );
  }
}
