import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetBlacklistUseCase
    implements UseCase<Either<Failure, List<CandidateModel>>, NoParams> {
  GetBlacklistUseCase(this._blacklistRepository);

  final BlacklistRepository _blacklistRepository;

  @override
  Future<Either<Failure, List<CandidateModel>>> call(NoParams params) {
    return _blacklistRepository.getBlacklist();
  }
}
