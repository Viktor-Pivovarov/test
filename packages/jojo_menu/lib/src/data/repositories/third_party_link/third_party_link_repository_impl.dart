import 'package:jojo_menu/jojo_menu.dart';
import 'package:xander9112/xander9112.dart';

class ThirdPartyLinkRepositoryImpl implements ThirdPartyLinkRepository {
  ThirdPartyLinkRepositoryImpl({
    required this.localThirdPartyLinkDataSource,
    required this.remoteThirdPartyLinkDataSource,
  });

  final LocalThirdPartyLinkDataSource localThirdPartyLinkDataSource;

  final RemoteThirdPartyLinkDataSource remoteThirdPartyLinkDataSource;

  @override
  Stream<List<ThirdPartyLinkModel>> subscribe() {
    return localThirdPartyLinkDataSource.watch();
  }

  @override
  Future<Either<Failure, List<ThirdPartyLinkModel>>>
      getThirdPartyLinks() async {
    try {
      final result = await remoteThirdPartyLinkDataSource.getThirdPartyLinks();

      await localThirdPartyLinkDataSource.saveThirdPartyLinks(result.items);
      return Right(result.items);
    } on DioException catch (error) {
      return Left(
        ThirdPartyLinkFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(ThirdPartyLinkFailure(code: 1, message: error.toString()));
    }
  }
}
