import 'package:dio/dio.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_faq_datasource.g.dart';

@RestApi()
abstract class RemoteFaqDataSource {
  factory RemoteFaqDataSource(Dio dio, {String baseUrl}) = _RemoteFaqDataSource;

  @GET(MenuApiMethods.faq)
  Future<FaqModel> getFaq();
}
