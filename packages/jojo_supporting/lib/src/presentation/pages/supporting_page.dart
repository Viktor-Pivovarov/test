import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jojo_supporting/jojo_supporting.dart';

@RoutePage<bool>()
class SupportingPage extends StatelessWidget {
  const SupportingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupportingInjection.sl<SupportingCubit>()..init(),
      child: BlocBuilder<SupportingCubit, SupportingState>(
        builder: (context, state) {
          return switch (state) {
            SupportingStateLoading() => const SizedBox.shrink(),
            SupportingStateLoaded(formGroup: final formGroup) => SupportingForm(
                formGroup: formGroup,
                onSubmit: () =>
                    context.read<SupportingCubit>().onSubmit(context),
              ),
            SupportingStateError(
              formGroup: final formGroup,
            ) =>
              SupportingForm(
                formGroup: formGroup,
                onSubmit: () =>
                    context.read<SupportingCubit>().onSubmit(context),
              ),
            SupportingStateSended(formGroup: final formGroup) => SupportingForm(
                formGroup: formGroup,
                onSubmit: () =>
                    context.read<SupportingCubit>().onSubmit(context),
              )
          };
        },
      ),
    );
  }
}
