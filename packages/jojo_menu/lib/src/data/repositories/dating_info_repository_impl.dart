import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

class DatingInfoRepositoryImpl implements DatingInfoRepository {
  DatingInfoRepositoryImpl({
    required this.localDatingInfoDataSource,
    required this.remoteDatingInfoDataSource,
  });

  final LocalDatingInfoDataSource localDatingInfoDataSource;

  final RemoteDatingInfoDataSource remoteDatingInfoDataSource;

  @override
  Future<Either<Failure, DatingInfoModel>> getDatingInfo(String email) async {
    try {
      final result = await remoteDatingInfoDataSource.getDatingInfo();

      await localDatingInfoDataSource.saveDatingInfo(email, result);
      return Right(result);
    } on DioException catch (error) {
      return Left(
        DatingInfoFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(DatingInfoFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Stream<DatingInfoModel?> subscribe(String email) {
    return localDatingInfoDataSource.watch(email);
  }
}
