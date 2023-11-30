import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class SubscribeFaqUseCase extends UseCase<Stream<FaqModel>, NoParams> {
  SubscribeFaqUseCase(
    this._faqRepository,
  );

  final FaqRepository _faqRepository;

  @override
  Future<Stream<FaqModel>> call(
    NoParams params,
  ) async {
    return _faqRepository.subscribe();
  }
}
