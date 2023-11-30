import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetBonusesUseCase
    extends UseCase<Either<Failure, List<BonusModel>>, NoParams> {
  GetBonusesUseCase(this._accountStatusRepository);

  final AccountStatusRepository _accountStatusRepository;

  @override
  Future<Either<Failure, List<BonusModel>>> call(NoParams params) async {
    return _accountStatusRepository.getBonuses();
  }
}
