import 'package:jojo/src/core/features/geo_location/_geo_location.dart';
import 'package:xander9112/xander9112.dart';

class GeoLocationRepositoryImpl implements GeoLocationRepository {
  GeoLocationRepositoryImpl(this._dataSource);

  final GeoLocationDataSource _dataSource;

  @override
  Future<Either<Failure, GeoLocationDTOModel>> getGeoLocation(String q) async {
    try {
      final response = await _dataSource.getGeoLocation(q);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        GeoLocationFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(GeoLocationFailure(code: 1, message: error.toString()));
    }
  }
}
