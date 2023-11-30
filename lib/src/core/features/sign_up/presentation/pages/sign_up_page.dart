// import 'package:auto_route/annotations.dart';
// import 'package:flutter/material.dart';
// import 'package:jojo/src/core/_core.dart';
// import 'package:jojo/src/core/features/auth/_auth.dart';

// import 'package:jojo_ui_kit/jojo_ui_kit.dart';

// abstract class SignUpPageDelegate {
//   void onPressedAuthByType(SignUpType type);

//   void onPressedTermsOfUse();

//   void onPressedPrivacyPolicy();
// }

// @RoutePage()
// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   SignUpPageDelegate get _delegate => SignUpInjection.sl<SignUpCubit>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: UiAppBar(title: Text(SignUpI18n.title)),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             child: Center(
//               child: UiImage(
//                 Assets.media.logoJOJO2,
//                 width: MediaQuery.of(context).size.width * 0.5,
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(Insets.xl),
//             decoration: BoxDecoration(
//               color: context.theme.cardColor,
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(BorderRadiusInsets.xl),
//                 topRight: Radius.circular(BorderRadiusInsets.xl),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 if (AppConstants.isIOS)
//                   UiButton.apple(
//                     text: SignUpI18n.signUpWithApple,
//                     onPressed: () => _delegate.onPressedAuthByType(
//                       SignUpType.appleId,
//                     ),
//                   ),
//                 if (AppConstants.isAndroid)
//                   UiButton.google(
//                     text: SignUpI18n.signUpWithGoogle,
//                     onPressed: () => _delegate.onPressedAuthByType(
//                       SignUpType.google,
//                     ),
//                   ),
//                 // UiButton.facebook(
//                 //   text: SignUpI18n.signUpWithFB,
//                 //   onPressed: () => _delegate.onPressedAuthByType(
//                 //     SignUpType.facebook,
//                 //   ),
//                 // ),
//                 const UiDivider(
//                   margin: EdgeInsets.symmetric(vertical: Insets.l),
//                 ),
//                 RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     style: context.text.mainText,
//                     children: parseToLinks(
//                       SignUpI18n.privacy,
//                       <Function>[
//                         _delegate.onPressedTermsOfUse,
//                         _delegate.onPressedPrivacyPolicy,
//                       ],
//                       context.color.mainAccentColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
