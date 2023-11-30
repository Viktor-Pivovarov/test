import 'package:jojo/src/core/features/geo_location/_geo_location.dart';

class MockGeoLocationDataSource implements GeoLocationDataSource {
  @override
  Future<GeoLocationDTOModel> getGeoLocation(String q) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    return const GeoLocationDTOModel();
  }
}
