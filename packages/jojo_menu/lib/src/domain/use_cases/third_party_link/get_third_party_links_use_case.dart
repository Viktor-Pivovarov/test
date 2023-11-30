import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetThirdPartyLinksUseCase
    extends UseCase<Either<Failure, List<ThirdPartyLinkModel>>, NoParams> {
  GetThirdPartyLinksUseCase(
    this._thirdPartyLinkRepository,
  );

  final ThirdPartyLinkRepository _thirdPartyLinkRepository;

  @override
  Future<Either<Failure, List<ThirdPartyLinkModel>>> call(
    NoParams params,
  ) async {
    return _thirdPartyLinkRepository.getThirdPartyLinks();
  }
}
