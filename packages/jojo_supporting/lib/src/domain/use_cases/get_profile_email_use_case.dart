import 'package:jojo_sdk/jojo_sdk.dart';

class GetProfileEmailUseCase extends UseCase<String, NoParams> {
  GetProfileEmailUseCase(this._authManager);

  final AuthManager<AuthenticatedUser> _authManager;

  @override
  Future<String> call(NoParams params) async {
    return _authManager.user.account.email;
  }
}
