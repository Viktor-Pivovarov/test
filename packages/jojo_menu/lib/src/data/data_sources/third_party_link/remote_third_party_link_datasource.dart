import 'package:dio/dio.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_third_party_link_datasource.g.dart';

@RestApi()
abstract class RemoteThirdPartyLinkDataSource {
  factory RemoteThirdPartyLinkDataSource(Dio dio, {String baseUrl}) =
      _RemoteThirdPartyLinkDataSource;

  @GET(MenuApiMethods.thirdPartyLinks)
  Future<ThirdPartyLinksDto> getThirdPartyLinks();
}
