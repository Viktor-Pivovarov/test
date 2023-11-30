import 'package:dio/dio.dart';
import 'package:jojo_menu/src/_menu.dart';
import 'package:retrofit/retrofit.dart';

part 'feedback_remote_datasource.g.dart';

@RestApi()
abstract class FeedbackRemoteDatasource {
  factory FeedbackRemoteDatasource(Dio dio, {String baseUrl}) =
      _FeedbackRemoteDatasource;

  @GET(MenuApiMethods.feedbackReasons)
  Future<FeedbackReasonsDto> getFeedbackReasons();

  @POST(MenuApiMethods.feedbacks)
  Future<void> sendFeedback(@Body() FeedbackModel model);
}
