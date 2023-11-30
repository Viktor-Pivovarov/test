import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

class TariffRepositoryImpl implements TariffRepository {
  TariffRepositoryImpl({
    required this.remoteTariffDataSource,
  });

  final RemoteTariffDataSource remoteTariffDataSource;

  @override
  Future<Either<Failure, List<TariffModel>>> getTariffs() async {
    try {
      final result = await remoteTariffDataSource.getTariffs();

      return Right(result.items);
    } on DioException catch (error) {
      return Left(
        TariffFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(TariffFailure(code: 1, message: error.toString()));
    }
  }
}
