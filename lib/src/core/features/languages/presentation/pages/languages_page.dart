import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

@RoutePage<List<int>>()
class LanguagesPage extends StatefulWidget {
  const LanguagesPage({
    @QueryParam('selected') this.selected,
    super.key,
  });

  final String? selected;

  @override
  State<LanguagesPage> createState() => _LanguagesPageState();
}

class _LanguagesPageState extends State<LanguagesPage> {
  FormArray<bool> controls = FormArray<bool>([]);

  List<int> get selectedList {
    try {
      return widget.selected?.split(',').map(int.parse).toList() ?? [];
    } catch (_) {
      return [];
    }
  }

  void init(List<DictModel> items) {
    for (final element in items) {
      controls.add(FormControl<bool>(value: selectedList.contains(element.id)));
    }
  }

  void onPressedConfirm(List<DictModel> items) {
    final result = <int>[];

    controls.value?.forEachIndexed((index, element) {
      if (element ?? false) {
        result.add(items.elementAt(index).id);
      }
    });

    context.router.pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguagesInjection.sl<LanguagesCubit>()
        ..init(
          context.read<AppSettingsCubit>().state.deviceLocaleCode!,
          selectedList,
        ),
      child: BlocConsumer<LanguagesCubit, LanguagesState>(
        listenWhen: (previous, current) => current.status.isFetchingSuccess,
        listener: (context, state) {
          init(state.languages);
        },
        builder: (context, state) {
          return Scaffold(
            appBar: UiAppBar(
              title: Text(LanguagesI18n.title),
              useColor: true,
            ),
            body: Builder(
              builder: (context) {
                if (state.status.isFetchingInProgress) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.status.isFetchingFailure) {
                  return Center(
                    child: Column(
                      children: [Text(state.error ?? '')],
                    ),
                  );
                }

                return ListView(
                  padding: const EdgeInsets.fromLTRB(
                    Insets.l,
                    Insets.xxl,
                    Insets.l,
                    Insets.l,
                  ),
                  children: controls.controls.mapIndexed((i, control) {
                    return UiCheckboxField(
                      formControl: control as FormControl<bool>,
                      label: state.languages[i].name,
                    );
                  }).toList(),
                );
              },
            ),
            bottomNavigationBar: UiBottomSheet(
              child: UiButton(
                text: LanguagesI18n.confirm,
                onPressed: () => onPressedConfirm(state.languages),
                suffixIcon: UiIcon(Assets.icons.iCheck),
              ),
            ),
          );
        },
      ),
    );
  }
}
