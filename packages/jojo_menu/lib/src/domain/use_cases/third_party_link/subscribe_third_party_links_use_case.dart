import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class SubscribeThirdPartyLinksUseCase
    extends UseCase<Stream<List<ThirdPartyLinkModel>>, NoParams> {
  SubscribeThirdPartyLinksUseCase(
    this._thirdPartyLinkRepository,
  );

  final ThirdPartyLinkRepository _thirdPartyLinkRepository;

  @override
  Future<Stream<List<ThirdPartyLinkModel>>> call(
    NoParams params,
  ) async {
    return _thirdPartyLinkRepository.subscribe();
  }
}
