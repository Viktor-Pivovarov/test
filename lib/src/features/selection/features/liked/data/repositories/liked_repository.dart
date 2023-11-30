import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

class LikedRepositoryImpl implements LikedRepository {
  LikedRepositoryImpl(this._dataSource);

  final LikedDataSource _dataSource;

  @override
  Future<Either<Failure, OffersResponseDTO>> getOffers({
    String sortBy = '',
    String direction = 'ask',
  }) async {
    try {
      final sort = sortBy.isNotEmpty ? '$sortBy,$direction' : null;

      final response = await _dataSource.getOffers(sort: sort);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        LikedFailure(
          code: error.response?.statusCode ?? 1,
          message: error.response?.data.toString() ?? error.errorMessage,
        ),
      );
    } catch (error) {
      return Left(LikedFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, DatingInfoModel>> getDatingInfo() async {
    try {
      final response = await _dataSource.getDatingInfo();

      return Right(response);
    } on DioException catch (error) {
      return Left(
        LikedFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(LikedFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateIsNew(int id) async {
    try {
      final response = await _dataSource.updateIsNew(id);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        LikedFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(LikedFailure(code: 1, message: error.toString()));
    }
  }
}
