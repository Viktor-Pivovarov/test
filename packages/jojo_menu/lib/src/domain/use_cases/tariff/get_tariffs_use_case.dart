import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetTariffsUseCase
    extends UseCase<Either<Failure, List<TariffModel>>, NoParams> {
  GetTariffsUseCase(
    this._tariffRepository,
  );

  final TariffRepository _tariffRepository;

  @override
  Future<Either<Failure, List<TariffModel>>> call(
    NoParams params,
  ) async {
    return _tariffRepository.getTariffs();
  }
}
