import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetFaqUseCase extends UseCase<Either<Failure, FaqModel>, NoParams> {
  GetFaqUseCase(
    this._faqRepository,
  );

  final FaqRepository _faqRepository;

  @override
  Future<Either<Failure, FaqModel>> call(
    NoParams params,
  ) async {
    return _faqRepository.getFaq();
  }
}
