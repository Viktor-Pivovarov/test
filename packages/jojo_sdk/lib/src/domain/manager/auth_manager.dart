import 'package:flutter/material.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

enum AuthStage { pure, auth, onboarding, city, register, completed }

abstract class AuthManager<U> extends ChangeNotifier {
  AuthManager({
    required this.settings,
  });

  final AuthManagerSettings settings;

  U get user;

  Stream<U> get currentUser;

  Future<bool> get isAuth;

  Future<String?> get oAuthToken;

  set authenticated(bool value);

  Future<Either<Failure, AuthStage>> init();

  Future<Either<Failure, AuthResponseModel>> signIn(SignUpType type);

  Future<Either<Failure, bool>> signUp(SignUpCaseParams body);

  Future<Either<Failure, void>> signOut({bool remote = true});

  Future<Either<Failure, AuthStage>> verify();

  bool get isChecked;

  set isChecked(bool value);

  set user(U user);
}

class AuthManagerSettings {
  AuthManagerSettings({
    required this.useBiometric,
    required this.useLocalAuth,
  });

  final bool useBiometric;
  final bool useLocalAuth;
}

class SignUpCaseParams {
  SignUpCaseParams({
    required this.token,
    required this.gender,
    required this.pickupTime,
    required this.agreeForVedic,
    required this.agreeForPay,
    required this.agreeForSelfie,
  });

  final String token;
  final Gender gender;
  final PickupTime pickupTime;
  final bool agreeForVedic;
  final bool agreeForPay;
  final bool agreeForSelfie;
}
