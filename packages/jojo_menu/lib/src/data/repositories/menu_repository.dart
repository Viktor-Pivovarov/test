import 'package:jojo_menu/src/_menu.dart';
import 'package:xander9112/xander9112.dart';

class MenuRepositoryImpl implements MenuRepository {
  MenuRepositoryImpl(this._dataSource);

  final MenuDataSource _dataSource;

  @override
  Future<Either<Failure, MenuModel>> getMenu() async {
    try {
      final response = await _dataSource.getMenu();

      return Right(response);
    } on DioException catch (error) {
      return Left(
        MenuFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error) {
      return Left(MenuFailure(code: 1, message: error.toString()));
    }
  }
}
