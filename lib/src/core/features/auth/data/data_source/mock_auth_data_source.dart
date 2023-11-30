import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class MockAuthDataSource implements RestAuthDataSource {
  MockAuthDataSource(this.dio);

  final Dio dio;

  AuthenticatedUser _user(ProfileStatus status) => AuthenticatedUser(
        userId: 1,
        settings: const SettingsModel(),
        account: const AccountModel(email: 'email'),
        vedic: const VedicModel(),
        preference: const PreferenceModel(),
        searcher: const SearcherModel(
          gender: SearcherGender.male,
          pickupTime: 'pickupTime',
          searchStatus: SearchStatus.pending,
          location: LocationModel(
            coordinate: CoordinateModel(latitude: 123, longitude: 123),
          ),
        ),
        profile: ProfileModel(status: status),
      );

  @override
  Future<AuthResponseModel> signIn(String token) async {
    return const AuthResponseModel(
      tokenType: 'bearer',
      accessToken: 'access_token',
      expiresIn: '3600',
    );
  }

  @override
  Future<AuthResponseModel> signUp(
    SignUpRequest request,
  ) async {
    return const AuthResponseModel(
      accessToken: 'access_token',
      expiresIn: '3600',
      tokenType: 'bearer',
    );
  }

  @override
  Future<void> signOut() async {
    return;
  }

  Future<void> updateDeviceInfo({
    required Map<String, dynamic> request,
  }) async {}

  @override
  Future<AuthenticatedUser> verify() async {
    return _user(ProfileStatus.moderation);
  }

  @override
  Future<void> setLocationCoordinate(LocationDTO data) {
    throw UnimplementedError();
  }

  @override
  Future<void> setNotificationAllowed(bool allowNotifications) {
    throw UnimplementedError();
  }

  @override
  Future<void> visitInitialize(String token) {
    // TODO: implement visitInitialize
    throw UnimplementedError();
  }
}
