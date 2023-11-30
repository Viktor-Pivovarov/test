import 'package:dio/dio.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_blacklist_datasource.g.dart';

@RestApi()
abstract class RemoteBlacklistDataSource {
  factory RemoteBlacklistDataSource(Dio dio, {String baseUrl}) =
      _RemoteBlacklistDataSource;

  @GET(MenuApiMethods.blacklist)
  Future<BlacklistDto> getBlacklist();

  @POST(MenuApiMethods.userBlock)
  Future<void> block(@Path() String userId);

  @DELETE(MenuApiMethods.userUnblock)
  Future<void> unblock(@Path() String userId);
}
