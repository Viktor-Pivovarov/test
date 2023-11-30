import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetReasonsForDeletionUseCase
    extends UseCase<Either<Failure, List<DictModel>>, NoParams> {
  GetReasonsForDeletionUseCase(
    this._accountStatusRepository,
  );

  final AccountStatusRepository _accountStatusRepository;

  @override
  Future<Either<Failure, List<DictModel>>> call(NoParams params) async {
    return _accountStatusRepository.getReasonsForDeletion();
  }
}
