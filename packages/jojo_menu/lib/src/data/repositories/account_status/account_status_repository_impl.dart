import 'package:jojo_menu/src/_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class AccountStatusRepositoryImpl implements AccountStatusRepository {
  AccountStatusRepositoryImpl({
    required RemoteAccountStatusDataSource remoteAccountStatusDataSource,
  }) : _remoteAccountStatusDataSource = remoteAccountStatusDataSource;

  final RemoteAccountStatusDataSource _remoteAccountStatusDataSource;

  @override
  Future<Either<Failure, void>> deleteAccount(
    List<DictModel> reasons,
  ) async {
    try {
      final result = await _remoteAccountStatusDataSource.deleteAccount(
        DeletionRequestDto(reasons: reasons.map((e) => e.id).toList()),
      );

      return Right(result);
    } on DioException catch (error) {
      return Left(
        AccountStatusFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(AccountStatusFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> freezeAccount() async {
    try {
      final result = await _remoteAccountStatusDataSource.freezeAccount();

      return Right(result);
    } on DioException catch (error) {
      return Left(
        AccountStatusFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(AccountStatusFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unfreezeAccount() async {
    try {
      final result = await _remoteAccountStatusDataSource.unfreezeAccount();

      return Right(result);
    } on DioException catch (error) {
      return Left(
        AccountStatusFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(AccountStatusFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DictModel>>> getReasonsForDeletion() async {
    try {
      final result =
          await _remoteAccountStatusDataSource.getReasonsForDeletion();

      return Right(result.items);
    } on DioException catch (error) {
      return Left(
        AccountStatusFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(AccountStatusFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BonusModel>>> getBonuses() async {
    try {
      final bonuses = await _remoteAccountStatusDataSource.getBonuses();
      final feedbackAvailable =
          await _remoteAccountStatusDataSource.getFeedbackBonusStatus();

      return Right([
        BonusModel(
          type: BonusType.completeProfile,
          enabled: true,
          completed: bonuses.bonuses.isProfileFilling,
        ),
        BonusModel(
          type: BonusType.giftDate,
          enabled: true,
          completed: bonuses.bonuses.isInvite,
        ),
        BonusModel(
          type: BonusType.review,
          enabled: feedbackAvailable.available,
          completed: bonuses.bonuses.isFeedback,
        ),
      ]);
    } on DioException catch (error) {
      return Left(
        AccountStatusFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(AccountStatusFailure(code: 1, message: error.toString()));
    }
  }
}
