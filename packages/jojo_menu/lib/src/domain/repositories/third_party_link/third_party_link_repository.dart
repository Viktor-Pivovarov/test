import 'package:jojo_menu/src/_menu.dart';
import 'package:xander9112/xander9112.dart';

abstract class ThirdPartyLinkRepository {
  Future<Either<Failure, List<ThirdPartyLinkModel>>> getThirdPartyLinks();
  Stream<List<ThirdPartyLinkModel>> subscribe();
}
