import 'package:dio/dio.dart';
import 'package:jojo_supporting/jojo_supporting.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_supporting_data_source.g.dart';

@RestApi()
abstract class RestSupportingDataSource implements SupportingDataSource {
  factory RestSupportingDataSource(Dio dio, {String baseUrl}) =
      _RestSupportingDataSource;

  @override
  @POST(SupportingApiMethods.email)
  Future<void> create(@Body() SupportingModel model);
}
