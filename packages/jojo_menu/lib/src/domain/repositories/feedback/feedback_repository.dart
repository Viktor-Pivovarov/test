// ignore_for_file: one_member_abstracts

import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

abstract class FeedbackRepository {
  Future<Either<Failure, List<DictModel>>> getFeedbackReasons();

  Future<Either<Failure, void>> sendFeedback(FeedbackModel feedbackModel);
}
