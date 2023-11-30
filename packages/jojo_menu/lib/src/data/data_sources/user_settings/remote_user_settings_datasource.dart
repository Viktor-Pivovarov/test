import 'package:dio/dio.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_user_settings_datasource.g.dart';

@RestApi()
abstract class RemoteUserSettingsDatasource {
  factory RemoteUserSettingsDatasource(Dio dio, {String baseUrl}) =
      _RemoteUserSettingsDatasource;

  @GET(MenuApiMethods.userSettings)
  Future<UserSettingsDto> getUserSettings();

  @PUT(MenuApiMethods.toggleNotificationMutualSympathy)
  Future<void> toggleNotificationMutualSympathy();

  @PUT(MenuApiMethods.toggleNotificationNewChatMessage)
  Future<void> toggleNotificationNewChatMessage();

  @PUT(MenuApiMethods.toggleNotificationNewStackOffer)
  Future<void> toggleNotificationNewStackOffer();
}
