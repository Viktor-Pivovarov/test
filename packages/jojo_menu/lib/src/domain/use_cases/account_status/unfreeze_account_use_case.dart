import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class UnfreezeAccountUseCase extends UseCase<Either<Failure, void>, NoParams> {
  UnfreezeAccountUseCase({required AccountStatusRepository repository})
      : _repository = repository;

  final AccountStatusRepository _repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _repository.unfreezeAccount();
  }
}
