import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_menu/src/data/data_sources/blacklist/remote_blacklist_datasource.dart';
import 'package:xander9112/xander9112.dart';

class BlacklistRepositoryImpl implements BlacklistRepository {
  BlacklistRepositoryImpl({
    required this.remoteBlacklistDataSource,
  });

  final RemoteBlacklistDataSource remoteBlacklistDataSource;

  @override
  Future<Either<Failure, void>> block(String userId) async {
    try {
      final result = await remoteBlacklistDataSource.unblock(userId);

      return Right(result);
    } on DioException catch (error) {
      return Left(
        BlacklistFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(BlacklistFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CandidateModel>>> getBlacklist() async {
    try {
      final result = await remoteBlacklistDataSource.getBlacklist();

      return Right(result.items);
    } on DioException catch (error) {
      return Left(
        BlacklistFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(BlacklistFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unblock(String userId) async {
    try {
      final result = await remoteBlacklistDataSource.unblock(userId);

      return Right(result);
    } on DioException catch (error) {
      return Left(
        BlacklistFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(BlacklistFailure(code: 1, message: error.toString()));
    }
  }
}
