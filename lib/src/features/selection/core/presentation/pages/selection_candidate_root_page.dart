import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';

@RoutePage(name: 'SelectionCandidateRootRouter')
class SelectionCandidateRootPage extends AutoRouter
    implements AutoRouteWrapper {
  const SelectionCandidateRootPage({
    @PathParam('id') required this.id,
    super.key,
  });

  final String id;

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SelectionInjection.sl<OfferCubit>()..init(int.parse(id)),
        ),
      ],
      child: this,
    );
  }
}
