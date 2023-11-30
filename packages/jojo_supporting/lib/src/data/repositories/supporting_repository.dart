import 'package:jojo_supporting/jojo_supporting.dart';
import 'package:x_logger/x_logger.dart';
import 'package:xander9112/xander9112.dart';

class SupportingRepositoryImpl implements SupportingRepository {
  SupportingRepositoryImpl(this._dataSource, this._logger);

  final SupportingDataSource _dataSource;

  final XLogger _logger;

  @override
  Future<Either<Failure, void>> create({required SupportingModel model}) async {
    try {
      await _dataSource.create(model);
      return const Right(null);
    } on DioException catch (error, stacktrace) {
      _logger.e(error.errorMessage, error, stacktrace);
      return Left(
        SupportingFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e(error.toString(), error, stacktrace);
      return Left(
        SupportingFailure(
          code: 1,
          message: error.toString(),
        ),
      );
    }
  }
}
