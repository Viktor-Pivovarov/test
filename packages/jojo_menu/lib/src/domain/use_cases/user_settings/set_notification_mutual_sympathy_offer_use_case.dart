import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class SetNotificationMutualSympathyOfferUseCase
    extends UseCase<Either<Failure, void>, NoParams> {
  SetNotificationMutualSympathyOfferUseCase({
    required UserSettingsRepository userSettingsRepository,
  }) : _userSettingsRepository = userSettingsRepository;

  final UserSettingsRepository _userSettingsRepository;
  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _userSettingsRepository.setNotificationMutualSympathyOffer();
  }
}
