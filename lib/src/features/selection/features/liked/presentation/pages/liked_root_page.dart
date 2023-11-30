import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

@RoutePage(name: 'LikedRootRouter')
class LikedRootPage extends AutoRouter implements AutoRouteWrapper {
  const LikedRootPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LikedInjection.sl<LikedCubit>()..init(),
        ),
      ],
      child: this,
    );
  }
}
