import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetUserSettingsUseCase
    extends UseCase<Either<Failure, UserSettingsModel>, NoParams> {
  GetUserSettingsUseCase(
    this._userSettingsRepository,
  );

  final UserSettingsRepository _userSettingsRepository;

  @override
  Future<Either<Failure, UserSettingsModel>> call(
    NoParams params,
  ) async {
    return _userSettingsRepository.getUserSettings();
  }
}
