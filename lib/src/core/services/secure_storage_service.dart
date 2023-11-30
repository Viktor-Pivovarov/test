// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  String? avatarToken;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        resetOnError: true,
      );

  Future<bool> get hasToken async =>
      (await _secureStorage.read(
        key: 'token',
        aOptions: _getAndroidOptions(),
      )) !=
      null;

  Future<void> setToken(String value) {
    avatarToken = value;

    return _secureStorage.write(
      key: 'token',
      value: value,
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> removeToken() {
    avatarToken = null;
    return _secureStorage.delete(key: 'token', aOptions: _getAndroidOptions());
  }

  Future<String?> getToken() {
    return _secureStorage.read(key: 'token', aOptions: _getAndroidOptions());
  }

  Future<String?> getRefreshToken() {
    return _secureStorage.read(
      key: 'refreshToken',
      aOptions: _getAndroidOptions(),
    );
  }

  Future<bool> get hasOAuthToken async =>
      (await _secureStorage.read(
        key: 'oauth_token',
        aOptions: _getAndroidOptions(),
      )) !=
      null;

  Future<void> setOAuthToken(String value) {
    avatarToken = value;

    return _secureStorage.write(
      key: 'oauth_token',
      value: value,
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> removeOAuthToken() {
    avatarToken = null;
    return _secureStorage.delete(
      key: 'oauth_token',
      aOptions: _getAndroidOptions(),
    );
  }

  Future<String?> getOAuthToken() {
    return _secureStorage.read(
      key: 'oauth_token',
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> setSocketId(String value) {
    avatarToken = value;

    return _secureStorage.write(
      key: 'socket_id',
      value: value,
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> removeSocketId() {
    avatarToken = null;
    return _secureStorage.delete(
      key: 'socket_id',
      aOptions: _getAndroidOptions(),
    );
  }

  Future<String?> getSocketId() {
    return _secureStorage.read(
      key: 'socket_id',
      aOptions: _getAndroidOptions(),
    );
  }
}
