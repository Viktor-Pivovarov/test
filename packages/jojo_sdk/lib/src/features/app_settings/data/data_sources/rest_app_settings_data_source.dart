import 'package:jojo_sdk/jojo_sdk.dart';


part 'rest_app_settings_data_source.g.dart';

@RestApi()
abstract class RestAppSettingsDataSource implements AppSettingsDataSource {
  factory RestAppSettingsDataSource(Dio dio, {String baseUrl}) =
      _RestAppSettingsDataSource;

  @override
  @GET('/v1/application-state')
  Future<AppSettingsModel> getAppSettings();

  @override
  @POST('/v1/')
  Future<void> setFirebaseId(String token);

  @override
  @POST('/v1/')
  Future<void> updateDeviceVersion({
    @Field() required String deviceModel,
    @Field() required String deviceSystem,
    @Field() required String deviceVersion,
    @Field() required String appVersion,
    @Field() required String appBuild,
  });

  @override
  @POST('/v1/last-visit')
  Future<void> updateLastVisit();
}
