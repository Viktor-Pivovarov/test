import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:stream_transform/stream_transform.dart';

class HiveDictsCacheDataSource implements DictsCacheDataSource {
  late final Box<String> _box;

  @override
  Stream<Map<DictEnum, List<DictModel>>> get stream => _box
      .watch()
      .debounce(const Duration(milliseconds: 300))
      .asyncMap<Map<DictEnum, List<DictModel>>>((_) => getAllDicts());

  @override
  Stream<List<DictModel>> watch(DictEnum name) => _box
      .watch(key: name.name)
      .asyncMap<List<DictModel>>((_) => getDict(name));

  @override
  Future<void> init() async {
    _box = await Hive.openBox<String>('dicts');
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Future<Map<DictEnum, List<DictModel>>> getAllDicts() async {
    final Map<DictEnum, List<DictModel>> _dicts = {};
    try {
      await Future.wait<void>(
        _box.keys.map((dynamic e) async {
          final dict = await getDict(DictEnum.fromString('$e'));

          _dicts.putIfAbsent(DictEnum.fromString('$e'), () => dict);
        }).toList(),
      );

      return _dicts;
    } catch (_) {
      await _box.clear();

      return {};
    }
  }

  @override
  Future<List<DictModel>> getDict(DictEnum name) async {
    try {
      final String? _dict = _box.get(name.name);

      if (_dict != null) {
        return _transform(_dict);
      }
    } catch (_) {
      await _box.clear();
    }

    return [];
  }

  List<DictModel> _transform(String value) {
    return List<Map<String, dynamic>>.from(json.decode(value) as List<dynamic>)
        .map(DictModel.fromJson)
        .toList();
  }

  @override
  Future<void> saveDict(DictEnum name, List<DictModel> dict) {
    return _box.put(
      name.name,
      json.encode(dict.map((e) => e.toJson()).toList()),
    );
  }

  @override
  Future<List<DictModel>> updateDict(
    DictEnum name,
    UpdateDictCallback onUpdate,
  ) async {
    final dict = await getDict(name);

    final newDict = onUpdate(dict);

    await saveDict(name, newDict);

    return newDict;
  }
}
