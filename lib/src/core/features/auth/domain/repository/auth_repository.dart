import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

abstract class AuthRepository<A, U> {
  Future<Either<Failure, A>> signIn(SignUpType type);

  Future<Either<Failure, A>> signUp(SignUpCaseParams body);

  Future<Either<Failure, void>> setLocationCoordinate(LocationDTO data);

  Future<Either<Failure, void>> setNotificationAllowed(bool allowNotifications);

  Future<Either<Failure, void>> signOut();

  Future<bool> hasAccessToken();

  Future<void> setAccessToken(String value);

  Future<String?> getAccessToken();

  Future<void> deleteAccessToken();

  Future<bool> hasOAuthToken();

  Future<void> setOAuthToken(String value);

  Future<String?> getOAuthToken();

  Future<void> deleteOAuthToken();

  Future<Either<Failure, U>> verify();

  Stream<AuthenticatedUser?> get currentUser;

  Future<void> updateUser(AuthenticatedUser user);

  Future<void> visitInitialize(String token);
}
