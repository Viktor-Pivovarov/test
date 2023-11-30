import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  FeedbackRepositoryImpl(this._feedbackRemoteDatasource);

  final FeedbackRemoteDatasource _feedbackRemoteDatasource;

  @override
  Future<Either<Failure, List<DictModel>>> getFeedbackReasons() async {
    try {
      final result = await _feedbackRemoteDatasource.getFeedbackReasons();

      return Right(result.items);
    } on DioException catch (error) {
      return Left(
        FeedbackFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(FeedbackFailure(code: 1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendFeedback(
    FeedbackModel feedbackModel,
  ) async {
    try {
      await _feedbackRemoteDatasource.sendFeedback(feedbackModel);

      return const Right(null);
    } on DioException catch (error) {
      return Left(
        FeedbackFailure(
          code: error.response?.statusCode ?? 1,
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(FeedbackFailure(code: 1, message: error.toString()));
    }
  }
}
