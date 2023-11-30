import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

class LikedRouter extends AppRouter {
  LikedRouter(super.router);

  void goToLiked() {
    pushNamed(LikedRoutePath.liked);
  }
}
