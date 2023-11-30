import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class DeleteAccountUseCase
    extends UseCase<Either<Failure, void>, List<DictModel>> {
  DeleteAccountUseCase({
    required AccountStatusRepository repository,
  }) : _repository = repository;

  final AccountStatusRepository _repository;

  @override
  Future<Either<Failure, void>> call(List<DictModel> params) async {
    return _repository.deleteAccount(params);
  }
}
