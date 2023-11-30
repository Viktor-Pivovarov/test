import 'package:jojo_sdk/jojo_sdk.dart';

class GetAccountStatusUseCase extends UseCase<Stream<ProfileStatus>, NoParams> {
  GetAccountStatusUseCase({required AuthManager<AuthenticatedUser> authManager})
      : _authManager = authManager;

  final AuthManager<AuthenticatedUser> _authManager;

  @override
  Future<Stream<ProfileStatus>> call(NoParams params) async {
    return _authManager.currentUser.map((event) => event.profile.status);
  }
}
