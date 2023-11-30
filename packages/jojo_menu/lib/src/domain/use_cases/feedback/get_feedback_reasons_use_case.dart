import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class GetFeedbackReasonsUseCase
    extends UseCase<Either<Failure, List<DictModel>>, NoParams> {
  GetFeedbackReasonsUseCase(
    this._feedbackRepository,
  );

  final FeedbackRepository _feedbackRepository;

  @override
  Future<Either<Failure, List<DictModel>>> call(
    NoParams params,
  ) async {
    return _feedbackRepository.getFeedbackReasons();
  }
}
