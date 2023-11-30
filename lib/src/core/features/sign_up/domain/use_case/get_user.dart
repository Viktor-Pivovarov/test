import 'package:jojo_sdk/jojo_sdk.dart';

class GetUserCase implements UseCase<Stream<AuthenticatedUser>, NoParams> {
  GetUserCase(this._authManager);

  final AuthManager<AuthenticatedUser> _authManager;

  @override
  Future<Stream<AuthenticatedUser>> call(
    NoParams onResult,
  ) async {
    return _authManager.currentUser;
  }
}
