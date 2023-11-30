import 'package:jojo_sdk/jojo_sdk.dart';

abstract class AuthLocalDataSource {
  Future<void> init();

  Future<AuthenticatedUser?> getUser();

  Future<void> saveUser(AuthenticatedUser user);

  Stream<AuthenticatedUser?> get stream;

  Future<void> clear();
}
