import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:xander9112/xander9112.dart';

// ignore: one_member_abstracts
abstract class GeoLocationRepository {
  Future<Either<Failure, GeoLocationDTOModel>> getGeoLocation(String q);
}
