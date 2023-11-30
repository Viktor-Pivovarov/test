import 'package:jojo_menu/src/domain/models/candidate/candidate_model.dart';
import 'package:xander9112/xander9112.dart';

abstract class BlacklistRepository {
  Future<Either<Failure, List<CandidateModel>>> getBlacklist();

  Future<Either<Failure, void>> block(String userId);

  Future<Either<Failure, void>> unblock(String userId);
}
