import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class MockOAuthDataSource implements RestOAuthDataSource {
  Future<String?> _signInWithGoogle() async {
    return 'token';
  }

  @override
  Future<String?> signIn(SignUpType type) {
    return _signInWithGoogle();
  }
}
