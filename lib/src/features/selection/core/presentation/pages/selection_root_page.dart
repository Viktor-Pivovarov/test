import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo/src/core/_core.dart';
import 'package:jojo/src/features/selection/_selection.dart';

@RoutePage(name: 'SelectionRootRouter')
class SelectionRootPage extends AutoRouter implements AutoRouteWrapper {
  const SelectionRootPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: ProfileInjection.sl<ProfileCubit>()),
        BlocProvider(
          create: (context) => SelectionInjection.sl<SelectionCubit>()..init(),
        ),
      ],
      child: this,
    );
  }
}
