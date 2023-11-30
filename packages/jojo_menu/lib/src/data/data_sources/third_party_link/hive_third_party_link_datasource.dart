import 'package:hive/hive.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:rxdart/rxdart.dart';

part 'hive_third_party_link_datasource.g.dart';

class HiveThirdPartyLinkDatasource implements LocalThirdPartyLinkDataSource {
  late final Box<HiveThirdPartyModel> _box;

  static const _boxName = 'third_party_links';
  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Future<List<ThirdPartyLinkModel>> getThirdPartyLinks() async {
    try {
      return _box.values.map((e) => e.toModel()).toList();
    } catch (_) {
      await _box.clear();
      return [];
    }
  }

  @override
  Future<void> init() async {
    _box = await Hive.openBox<HiveThirdPartyModel>(_boxName);
  }

  @override
  Future<void> saveThirdPartyLinks(List<ThirdPartyLinkModel> links) async {
    final Map<dynamic, HiveThirdPartyModel> map = Map.fromEntries(
      links.map((e) => MapEntry(e.code, HiveThirdPartyModel.fromModel(e))),
    );
    await _box.putAll(map);
  }

  @override
  Stream<List<ThirdPartyLinkModel>> watch() {
    final stream = BehaviorSubject<List<ThirdPartyLinkModel>>.seeded(
      _box.values.map((e) => e.toModel()).toList(),
    )..addStream(
        _box
            .watch()
            .debounceTime(const Duration(milliseconds: 300))
            .asyncMap<List<ThirdPartyLinkModel>>((_) => getThirdPartyLinks()),
      );

    return stream;
  }
}

@HiveType(typeId: HiveTypes.thirdPartiLink)
class HiveThirdPartyModel {
  HiveThirdPartyModel({
    required this.code,
    required this.link,
  });

  HiveThirdPartyModel.fromModel(ThirdPartyLinkModel model)
      : code = model.code,
        link = model.link;

  ThirdPartyLinkModel toModel() => ThirdPartyLinkModel(code: code, link: link);

  @HiveField(0)
  final String code;

  @HiveField(1)
  final String link;
}
