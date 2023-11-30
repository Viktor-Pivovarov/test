import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class RestOAuthDataSource {
  RestOAuthDataSource(FirebaseOptions firebaseOptions)
      : _firebaseOptions = firebaseOptions;

  final FirebaseOptions _firebaseOptions;

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String _generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<String?> signIn(SignUpType type) async {
    switch (type) {
      case SignUpType.appleId:
        return _signInWithApple();
      case SignUpType.google:
        return _signInWithGoogle();

      // ignore: no_default_cases
      default:
        throw Exception('Unknown auth type: ${type.name}');
    }
  }

  Future<String?> _signInWithGoogle() async {
    final String? clientId = AppConstants.isIOS
        ? _firebaseOptions.iosClientId
        : _firebaseOptions.androidClientId;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        clientId: clientId,
        scopes: <String>['email'],
      ).signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.user == null) {
        return null;
      }

      final User user = userCredential.user!;
      final IdTokenResult tokenResult = await user.getIdTokenResult();

      return tokenResult.token!;
    } catch (_) {
      if (kDebugMode) {
        print(_);
      }
      return null;
    }
  }

  Future<String?> _signInWithApple() async {
    try {
      // To prevent replay attacks with the credential returned from Apple, we
      // include a nonce in the credential request. When signing in with
      // Firebase, the nonce in the id token returned by Apple, is expected to
      // match the sha256 hash of `rawNonce`.
      final rawNonce = _generateNonce();
      final nonce = _sha256ofString(rawNonce);

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: credential.identityToken,
        rawNonce: rawNonce,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      if (userCredential.user == null) {
        return null;
      }

      final User user = userCredential.user!;
      final IdTokenResult tokenResult = await user.getIdTokenResult();

      developer.log(tokenResult.token!);

      return tokenResult.token!;
    } catch (_) {
      if (kDebugMode) {
        print(_);
      }

      return null;
    }
  }
}
