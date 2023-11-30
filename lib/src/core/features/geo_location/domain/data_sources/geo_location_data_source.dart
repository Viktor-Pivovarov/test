import 'package:jojo/src/core/features/geo_location/_geo_location.dart';

// ignore: one_member_abstracts
abstract class GeoLocationDataSource {
  Future<GeoLocationDTOModel> getGeoLocation(String q);
}
