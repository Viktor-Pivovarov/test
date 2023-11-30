import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class UnblockUserUseCase extends UseCase<Either<Failure, void>, String> {
  UnblockUserUseCase(this._blacklistRepository);

  final BlacklistRepository _blacklistRepository;

  @override
  Future<Either<Failure, void>> call(String params) {
    return _blacklistRepository.unblock(params);
  }
}
