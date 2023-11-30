import 'package:flutter/material.dart';
import 'package:jojo/src/features/selection/_selection.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';
import 'package:neo_image_editor/loading_overlay.dart';

@RoutePage()
class SelectionSearchParamsPage extends StatelessWidget {
  const SelectionSearchParamsPage({super.key});

  // final SelectionSearchParamsCubit _cubit =

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SelectionInjection.sl<SelectionSearchParamsCubit>()..init(),
      child:
          BlocConsumer<SelectionSearchParamsCubit, SelectionSearchParamsState>(
        listener: (context, state) {
          if (state.status.isFinish) {
            context.popRoute();
          }
        },
        buildWhen: (previous, current) => !current.status.isFinish,
        builder: (context, state) {
          final _cubit = context.read<SelectionSearchParamsCubit>();

          if (state.status.isFirstFetchingInProgress) {
            return Scaffold(
              appBar: UiAppBar(
                title: Text(SelectionI18n.searchParamsTitle),
                useColor: true,
                useShadow: true,
              ),
              body: const UiProgressIndicator(),
            );
          }

          return ReactiveForm(
            formGroup: _cubit.form,
            child: Scaffold(
              appBar: UiAppBar(
                title: Text(SelectionI18n.searchParamsTitle),
                useColor: true,
                useShadow: true,
              ),
              body: ListView(
                padding: Insets.defaultPageInsetsWithBottomBar,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: Insets.l),
                    child: Text(
                      SelectionI18n.searchParamsDescription,
                      style: context.text.smallText,
                    ),
                  ),
                  UiCard(
                    child: UiDistanceField(
                      label: SelectionI18n.distanceLabel,
                      formControl:
                          _cubit.getFormControl<double>(DemoFormFields.distance)
                              as FormControl<double>,
                    ),
                  ),
                  UiProfileCard(
                    label: SelectionI18n.searchingCandidate,
                    showAdditionalLabel: false,
                    items: [
                      ProfileCardItem(
                        title: SelectionI18n.searchingAge,
                        description: SelectionI18n.searchingDesc(
                          CoreI18n.age(state.params.ageFrom),
                          CoreI18n.age(state.params.ageTo),
                        ),
                        iconAsset: Assets.icons.iCalendar2,
                        onPressed: context
                            .read<SelectionSearchParamsCubit>()
                            .onPressedAge,
                      ),
                      ProfileCardItem(
                        title: SelectionI18n.searchingLanguages,
                        description: state.params.languages
                            .map((e) => e.name)
                            .join(', '),
                        iconAsset: Assets.icons.lang,
                        onPressed: context
                            .read<SelectionSearchParamsCubit>()
                            .onPressedLanguages,
                      ),
                    ],
                  ),
                ],
              ),
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Insets.l,
                  Insets.l,
                  Insets.l,
                  Insets.xxl,
                ),
                child: UiButton(
                  disabled: state.status.isFetchingInProgress,
                  text: CoreI18n.save,
                  onPressed: _cubit.onSaveDistance,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
