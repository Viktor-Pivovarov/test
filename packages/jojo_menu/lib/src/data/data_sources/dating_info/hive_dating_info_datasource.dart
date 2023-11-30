import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:jojo_menu/src/data/data_sources/dating_info/local_dating_info_datasource.dart';
import 'package:jojo_menu/src/domain/models/dating_info/dating_info_model.dart';
import 'package:rxdart/rxdart.dart';

class HiveDatingInfoDatasource implements LocalDatingInfoDataSource {
  late final Box<String> _box;

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Future<DatingInfoModel?> getDatingInfo(String login) async {
    try {
      final String? datingInfo = _box.get(login);

      if (datingInfo != null) {
        return _transform(datingInfo);
      }
    } catch (_) {
      await _box.clear();
    }
    return null;
  }

  @override
  Future<void> init() async {
    _box = await Hive.openBox<String>('datingInfo');
  }

  DatingInfoModel _transform(String value) {
    return DatingInfoModel.fromJson(jsonDecode(value));
  }

  @override
  Future<void> saveDatingInfo(String login, DatingInfoModel datingInfo) async {
    await _box.put(login, json.encode(datingInfo));
  }

  @override
  Stream<DatingInfoModel?> watch(String login) {
    final stream = BehaviorSubject<DatingInfoModel?>.seeded(
      getDatingInfoSync(login),
    )..addStream(
        _box
            .watch(key: login)
            .asyncMap<DatingInfoModel?>((_) => getDatingInfo(login)),
      );

    return stream;
  }

  DatingInfoModel? getDatingInfoSync(String login) {
    try {
      final String? datingInfo = _box.get(login);

      if (datingInfo != null) {
        return _transform(datingInfo);
      }
    } catch (_) {
      _box.clear();
    }
    return null;
  }
}
