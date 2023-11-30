import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/core/features/auth/_auth.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:x_logger/x_logger.dart';

class AuthRepositoryImpl
    implements AuthRepository<AuthResponseModel, AuthenticatedUser> {
  AuthRepositoryImpl(
    this._authDataSource,
    this._oAuthDataSource,
    this._secureStorageService,
    this._authLocalDataSource,
  );

  final RestAuthDataSource _authDataSource;
  final RestOAuthDataSource _oAuthDataSource;
  final SecureStorageService _secureStorageService;
  final AuthLocalDataSource _authLocalDataSource;

  final XLogger _logger = GetIt.I(param1: AuthRepository);

  @override
  Future<void> deleteAccessToken() {
    return _secureStorageService.removeToken();
  }

  @override
  Future<String?> getAccessToken() {
    return _secureStorageService.getToken();
  }

  @override
  Future<bool> hasAccessToken() {
    return _secureStorageService.hasToken;
  }

  @override
  Future<void> setAccessToken(String value) {
    return _secureStorageService.setToken(value);
  }

  @override
  Future<void> deleteOAuthToken() {
    return _secureStorageService.removeOAuthToken();
  }

  @override
  Future<String?> getOAuthToken() {
    return _secureStorageService.getOAuthToken();
  }

  @override
  Future<bool> hasOAuthToken() {
    return _secureStorageService.hasOAuthToken;
  }

  @override
  Future<void> setOAuthToken(String value) {
    return _secureStorageService.setOAuthToken(value);
  }

  @override
  Future<Either<Failure, AuthResponseModel>> signIn(
    SignUpType type,
  ) async {
    final token = await _oAuthDataSource.signIn(type);

    if (token == null) {
      return Left(AuthFailure(code: 403, message: ''));
    }

    await setOAuthToken(token);

    return _signIn(token);
  }

  Future<Either<Failure, AuthResponseModel>> _signIn(String token) async {
    try {
      final response = await _authDataSource.signIn(token);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      if (error.response?.statusCode == 403) {
        return const Right(
          AuthResponseModel(accessToken: '', expiresIn: '0', tokenType: ''),
        );
      }

      _logger.e(
        'Failed _signIn',
        error.errorResponseMessage,
        stacktrace,
      );

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed _signIn', error, stacktrace);

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: 1,
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      await _authLocalDataSource.clear();

      final response = await _authDataSource.signOut();

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed signOut',
        error.errorResponseMessage,
        stacktrace,
      );

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed signOut', error, stacktrace);

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: 1,
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> visitInitialize(String token) async {
    try {
      final response = await _authDataSource.visitInitialize(token);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: 1,
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AuthenticatedUser>> verify() async {
    try {
      final AuthenticatedUser response = await _authDataSource.verify();

      // response = response.copyWith(
      //   profile: response.profile.copyWith(status: ProfileStatus.active),
      // );

      await updateUser(response);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed verify',
        error.errorResponseMessage,
        stacktrace,
      );
      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed verify', error, stacktrace);

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: 1,
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> setLocationCoordinate(LocationDTO data) async {
    try {
      final response = await _authDataSource.setLocationCoordinate(data);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setLocationCoordinate',
        error.errorResponseMessage,
        stacktrace,
      );

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setLocationCoordinate', error, stacktrace);

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setNotificationAllowed(
    bool allowNotifications,
  ) async {
    try {
      final response =
          await _authDataSource.setNotificationAllowed(allowNotifications);

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed setNotificationAllowed',
        error.errorResponseMessage,
        stacktrace,
      );

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed setNotificationAllowed', error, stacktrace);

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(AuthFailure(code: -1, message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> signUp(
    SignUpCaseParams body,
  ) async {
    try {
      final response = await _authDataSource.signUp(
        SignUpRequest(
          token: body.token,
          gender: body.gender.name,
          pickupTime: body.pickupTime.name,
          agreeForPay: body.agreeForPay,
          agreeForSelfie: body.agreeForSelfie,
          agreeForVedic: body.agreeForVedic,
        ),
      );

      return Right(response);
    } on DioException catch (error, stacktrace) {
      _logger.e(
        'Failed signUp: ${error.response?.statusCode}',
        error.errorResponseMessage,
        stacktrace,
      );

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: error.errorResponseCode,
          message: error.errorResponseMessage,
        ),
      );
    } catch (error, stacktrace) {
      _logger.e('Failed signUp', error, stacktrace);

      await FirebaseCrashlytics.instance.recordError(
        error,
        stacktrace,
      );

      return Left(
        AuthFailure(
          code: 1,
          message: error.toString(),
        ),
      );
    }
  }

  @override
  Stream<AuthenticatedUser?> get currentUser => _authLocalDataSource.stream;

  @override
  Future<void> updateUser(AuthenticatedUser user) {
    return _authLocalDataSource.saveUser(_sortPhotos(user));
  }

  AuthenticatedUser _sortPhotos(AuthenticatedUser user) {
    final List<PhotoModel> photos = [...user.profile.photos]
      ..sort((a, b) => a.position.compareTo(b.position));

    return user.copyWith(profile: user.profile.copyWith(photos: photos));
  }
}
