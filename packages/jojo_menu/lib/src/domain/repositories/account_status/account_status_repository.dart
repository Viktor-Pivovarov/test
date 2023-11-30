import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

abstract class AccountStatusRepository {
  Future<Either<Failure, void>> freezeAccount();

  Future<Either<Failure, void>> unfreezeAccount();

  Future<Either<Failure, void>> deleteAccount(
    List<DictModel> reasons,
  );

  Future<Either<Failure, List<DictModel>>> getReasonsForDeletion();

  Future<Either<Failure, List<BonusModel>>> getBonuses();
}
