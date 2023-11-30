import 'package:jojo/src/features/selection/_selection.dart';
import 'package:xander9112/xander9112.dart';

class SelectionRepositoryImpl implements SelectionRepository {
  SelectionRepositoryImpl(this._dataSource);

  final SelectionDataSource _dataSource;

  @override
  Future<Either<Failure, SelectionInfoDTO>> getSelection() async {
    try {
      final response = await _dataSource.getSelectionInfo();

      return Right(response);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, OfferEntity>> getOffer(int id) async {
    try {
      final response = await _dataSource.getOffer(id);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OfferListItemEntity>>> getOffers() async {
    try {
      final response = await _dataSource.getOffers();

      return Right(response.items);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> acceptOffer(int id) async {
    try {
      await _dataSource.acceptOffer(id);

      return const Right(null);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> declineOffer(int id) async {
    try {
      await _dataSource.declineOffer(id);

      return const Right(null);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, SearchPreferencesDTO>> getSearchPreferences() async {
    try {
      final response = await _dataSource.getSearchPreferences();

      return Right(response);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePreferenceLanguages(List<int> ids) async {
    try {
      final response = await _dataSource.updatePreferenceLanguages(ids);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> block(int id, [List<int>? ids]) async {
    try {
      final response = await _dataSource.block(id, ids);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateDistance(int value) async {
    try {
      final response = await _dataSource.updateDistance(value);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateSearchAge(int ageFrom, int ageTo) async {
    try {
      final response = await _dataSource.updateSearchAge(ageFrom, ageTo);

      return Right(response);
    } on DioException catch (error) {
      return Left(
        SelectionFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(SelectionFailure(code: 1, message: error.toString()));
    }
  }
}
