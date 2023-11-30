import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class SendFeedbackUseCase
    extends UseCase<Either<Failure, void>, FeedbackModel> {
  SendFeedbackUseCase(
    this._feedbackRepository,
  );

  final FeedbackRepository _feedbackRepository;

  @override
  Future<Either<Failure, void>> call(
    FeedbackModel params,
  ) async {
    return _feedbackRepository.sendFeedback(params);
  }
}
