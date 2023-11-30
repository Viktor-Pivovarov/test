// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:jojo/src/core/features/auth/_auth.dart';

// class OAuthManager {
//   OAuthManager(this.firebaseOptions);

//   final FirebaseOptions firebaseOptions;

//   User? get currentUser => FirebaseAuth.instance.currentUser;

//   Future<UserCredential> signIn(SignUpType type) async {
//     switch (type) {
//       case SignUpType.google:
//       case SignUpType.appleId:
//       case SignUpType.facebook:
//         return _signInWithGoogle();

//       // ignore: no_default_cases
//       default:
//         throw Exception('Unknown auth type: ${type.name}');
//     }
//   }

//   Future<UserCredential> _signInWithGoogle() async {
//     // Trigger the authentication flow
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn(
//         clientId: firebaseOptions.androidClientId,
//         scopes: <String>['email'],
//       ).signIn();

//       // Obtain the auth details from the request
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;

//       // Create a new credential
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );

//       // Once signed in, return the UserCredential
//       return FirebaseAuth.instance.signInWithCredential(credential);
//     } catch (error) {
//       rethrow;
//     }
//   }
// }
