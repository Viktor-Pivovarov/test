// ignore: lines_longer_than_80_chars
// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_setters_without_getters

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

const _defaultCurrentUser = AuthenticatedUser(
  userId: -1,
  settings: SettingsModel(),
  account: AccountModel(email: 'email'),
  vedic: VedicModel(),
  preference: PreferenceModel(),
  searcher: SearcherModel(
    gender: SearcherGender.male,
    pickupTime: 'pickupTime',
    searchStatus: SearchStatus.pending,
    location: LocationModel(coordinate: CoordinateModel()),
  ),
  profile: ProfileModel(status: ProfileStatus.moderation),
);

class AuthManagerImpl extends AuthManager<AuthenticatedUser> {
  AuthManagerImpl({
    required AppMetrics appMetrics,
    required this.repository,
    required super.settings,
  }) : _appMetrics = appMetrics {
    repository.currentUser.listen((event) {
      if (kDebugMode) {
        log('<$tag> changed user: ${event?.userId}');
      }

      _user = user;

      if (event?.userId != null) {
        _appMetrics.accountId = event!.userId.toString();
      } else {
        _appMetrics.accountId = null;
      }

      // notifyListeners();  uncomment if needed
    });
  }

  static const tag = 'AuthManagerImpl';

  final AuthRepository<AuthResponseModel, AuthenticatedUser> repository;

  final AppMetrics _appMetrics;

  AuthenticatedUser _user = _defaultCurrentUser;

  bool _authenticated = false;

  @override
  Future<String?> get oAuthToken => repository.getOAuthToken();

  @override
  Future<bool> get isAuth async {
    final hasToken = await repository.hasAccessToken();

    if (hasToken != _authenticated) {
      _authenticated = hasToken;

      notifyListeners();
    }

    return _authenticated;
  }

  @override
  set authenticated(bool value) {
    _authenticated = value;

    notifyListeners();
  }

  @override
  Future<Either<Failure, AuthStage>> init() async {
    if (kDebugMode) {
      log('TOKEN: ${await repository.getAccessToken()}');
    }

    return verify();
  }

  @override
  Future<Either<Failure, AuthResponseModel>> signIn(SignUpType type) async {
    final result = await repository.signIn(type);

    return result.fold(Left.new, (authModel) async {
      if (authModel.expiresIn == '0') {
        if (authModel.accessToken.isNotEmpty) {
          await repository.setAccessToken(authModel.accessToken);
        }

        return Right(authModel);
      }

      await repository.setAccessToken(authModel.accessToken);

      await verify();

      return Right(authModel);
    });
  }

  @override
  AuthenticatedUser get user => _user;

  @override
  Future<Either<Failure, void>> signOut({bool remote = true}) async {
    await _clear();

    if (!(await repository.hasAccessToken())) {
      // return const Right(null);
    }

    final result = await repository.signOut();

    return result.fold((_) async {
      await _clear();

      return Left(_);
    }, (success) async {
      await _clear();

      return Right(success);
    });
  }

  Future<void> _clear() async {
    try {
      await repository.deleteAccessToken();
      await repository.deleteOAuthToken();

      notifyListeners();
    } catch (_) {
      if (kDebugMode) {
        print(_);
      }
    }
  }

  bool _isChecked = false;

  @override
  bool get isChecked {
    if (_isChecked == false) {
      _isChecked = true;

      return false;
    }

    return _isChecked;
  }

  @override
  set isChecked(bool value) {
    _isChecked = value;
  }

  @override
  Future<Either<Failure, bool>> signUp(SignUpCaseParams body) async {
    final result = await repository.signUp(body);

    return result.fold(Left.new, (authModel) async {
      await repository.setAccessToken(authModel.accessToken);

      await verify();

      return const Right(true);
    });
  }

  @override
  Future<Either<Failure, AuthStage>> verify() async {
    isChecked = true;

    if (await isAuth) {
      final result = await repository.verify();

      return result.fold(Left.new, (userModel) async {
        _user = userModel;

        notifyListeners();

        if (_user.searcher.location.coordinate.latitude == null) {
          return const Right(AuthStage.city);
        }

        if (_user.profile.onRegister) {
          return const Right(AuthStage.register);
        }

        return const Right(AuthStage.completed);
      });
    }

    if (await repository.hasOAuthToken()) {
      return const Right(AuthStage.onboarding);
    }

    return const Right(AuthStage.auth);
  }

  @override
  Stream<AuthenticatedUser> get currentUser =>
      repository.currentUser.map((user) => user ?? _defaultCurrentUser);

  @override
  set user(AuthenticatedUser user) {
    _user = user;

    repository.updateUser(user);
  }
}
