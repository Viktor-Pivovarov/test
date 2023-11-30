import 'package:jojo_menu/jojo_menu.dart';

abstract class LocalThirdPartyLinkDataSource {
  Future<void> init();

  Future<void> clear();

  Stream<List<ThirdPartyLinkModel>> watch();

  Future<List<ThirdPartyLinkModel>> getThirdPartyLinks();

  Future<void> saveThirdPartyLinks(List<ThirdPartyLinkModel> links);
}
