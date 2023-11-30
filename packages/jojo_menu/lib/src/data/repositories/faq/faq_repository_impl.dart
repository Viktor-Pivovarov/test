import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

class FaqRepositoryImpl implements FaqRepository {
  FaqRepositoryImpl({
    required this.localFaqDataSource,
    required this.remoteFaqDataSource,
  });

  final LocalFaqDataSource localFaqDataSource;

  final RemoteFaqDataSource remoteFaqDataSource;

  @override
  Future<Either<Failure, FaqModel>> getFaq() async {
    try {
      final result = await remoteFaqDataSource.getFaq();

      await localFaqDataSource.saveFaq(result);
      return Right(result);
    } on DioException catch (error) {
      return Left(
        FaqFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(FaqFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Stream<FaqModel> subscribe() {
    return localFaqDataSource.watch();
  }
}
