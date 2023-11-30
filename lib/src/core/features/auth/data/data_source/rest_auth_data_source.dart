import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

part 'rest_auth_data_source.g.dart';

@RestApi()
abstract class RestAuthDataSource {
  factory RestAuthDataSource(Dio dio, {String baseUrl}) = _RestAuthDataSource;

  @POST(AuthApiMethods.signIn)
  Future<AuthResponseModel> signIn(@Field('token') String token);

  @POST(AuthApiMethods.signUp)
  Future<AuthResponseModel> signUp(@Body() SignUpRequest request);

  @POST(AuthApiMethods.signOut)
  Future<void> signOut();

  @POST(AuthApiMethods.visitInitialize)
  Future<void> visitInitialize(@Field('fcmToken') String token);

  @GET(AuthApiMethods.userInfo)
  Future<AuthenticatedUser> verify();

  @POST(ProfileApiMethods.locationCoordinate)
  Future<void> setLocationCoordinate(@Body() LocationDTO data);

  @POST(ProfileApiMethods.notificationAllowed)
  Future<void> setNotificationAllowed(
    @Field('allowNotifications') bool allowNotifications,
  );
}
