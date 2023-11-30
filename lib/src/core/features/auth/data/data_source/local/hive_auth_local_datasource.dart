import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:rxdart/rxdart.dart';

const _boxName = 'authCache';
const _userKey = 'user';

class HiveAuthLocalDatasource implements AuthLocalDataSource {
  late final Box<String> _box;

  @override
  Future<AuthenticatedUser?> getUser() async {
    try {
      final String? _user = _box.get(_userKey);

      if (_user != null) {
        return _transform(_user);
      } else {
        return null;
      }
    } catch (e) {
      await _box.clear();
      return null;
    }
  }

  AuthenticatedUser _transform(String value) {
    return AuthenticatedUser.fromJson(jsonDecode(value));
  }

  @override
  Future<void> saveUser(AuthenticatedUser user) async {
    try {
      await _box.put(_userKey, jsonEncode(user));
    } catch (e) {
      await _box.clear();
    }
  }

  @override
  Stream<AuthenticatedUser?> get stream {
    final stream = BehaviorSubject<AuthenticatedUser?>.seeded(_getUserSync())
      ..addStream(
        _box.watch(key: _userKey).map((event) {
          if (event.value != null) {
            return _transform(event.value as String);
          }
          return null;
        }),
      );

    return stream;
  }

  AuthenticatedUser? _getUserSync() {
    try {
      final String? _user = _box.get(_userKey);

      if (_user != null) {
        return _transform(_user);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> init() async {
    _box = await Hive.openBox<String>(_boxName);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}
