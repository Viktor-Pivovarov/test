import 'package:dio/dio.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_geo_location_data_source.g.dart';

@RestApi()
abstract class RestGeoLocationDataSource implements GeoLocationDataSource {
  factory RestGeoLocationDataSource(Dio dio, {String baseUrl}) =
      _RestGeoLocationDataSource;

  @override
  @GET(CommonApiMethods.citiesAutocomplete)
  Future<GeoLocationDTOModel> getGeoLocation(@Query('q') String q);
}
