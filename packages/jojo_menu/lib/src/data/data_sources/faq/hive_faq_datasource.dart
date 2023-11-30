import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:jojo_menu/jojo_menu.dart';
import 'package:rxdart/rxdart.dart';

class HiveFaqDatasource implements LocalFaqDataSource {
  late final Box<String> _box;

  static const _boxKey = 'faq';
  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  Future<FaqModel> getFaq() async {
    try {
      final String? faq = _box.get(_boxKey);

      if (faq != null) {
        return _transform(faq);
      }
    } catch (_) {
      await _box.clear();
    }

    return const FaqModel(items: []);
  }

  FaqModel _transform(String value) {
    return FaqModel.fromJson(jsonDecode(value));
  }

  @override
  Future<void> init() async {
    _box = await Hive.openBox<String>('faq');
  }

  @override
  Future<void> saveFaq(FaqModel faq) async {
    await _box.put(_boxKey, json.encode(faq));
  }

  @override
  Stream<FaqModel> watch() {
    final stream = BehaviorSubject<FaqModel>.seeded(
      getFaqSync(),
    )..addStream(
        _box.watch(key: _boxKey).asyncMap<FaqModel>((_) => getFaq()),
      );

    return stream;
  }

  FaqModel getFaqSync() {
    try {
      final String? faq = _box.get(_boxKey);

      if (faq != null) {
        return _transform(faq);
      }
    } catch (_) {
      _box.clear();
    }

    return const FaqModel(items: []);
  }
}
