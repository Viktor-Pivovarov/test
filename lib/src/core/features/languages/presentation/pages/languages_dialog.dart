import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jojo/src/core/features/languages/_languages.dart';
import 'package:jojo_sdk/jojo_sdk.dart';
import 'package:jojo_ui_kit/jojo_ui_kit.dart';

class LanguagesDialog extends StatefulWidget {
  const LanguagesDialog({this.selected, super.key});

  final String? selected;

  @override
  State<LanguagesDialog> createState() => _LanguagesDialogState();

  static Future<List<int>?> showDialog(
    BuildContext context,
    String? selected,
  ) async {
    final List<int>? result = await showModalBottomSheet<List<int>>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Insets.l),
        ),
      ),
      elevation: 0,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.95,
          child: LanguagesDialog(selected: selected),
        );
      },
    );

    return result;
  }
}

class _LanguagesDialogState extends State<LanguagesDialog> {
  FormArray<bool> controls = FormArray<bool>([]);

  String get selected => widget.selected ?? '';

  List<int> get selectedList {
    try {
      if (selected.isEmpty) {
        return [];
      }

      return selected.split(',').map(int.parse).toList();
    } catch (_) {
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
  }

  void init(List<DictModel> items) {
    for (final element in items) {
      final bool isSystemLanguage =
          context.read<AppSettingsCubit>().state.deviceLocaleCode ==
              element.code;

      controls.add(
        FormControl<bool>(
          value: selectedList.contains(element.id) || isSystemLanguage,
        ),
      );
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
    final String? deviceLanguageCode =
        context.read<AppSettingsCubit>().state.deviceLocaleCode;

    return BlocProvider(
      create: (context) => LanguagesInjection.sl<LanguagesCubit>()
        ..init(
          deviceLanguageCode!,
          selectedList,
        ),
      child: BlocConsumer<LanguagesCubit, LanguagesState>(
        listenWhen: (previous, current) =>
            previous.status.isFetchingInProgress &&
            current.status.isFetchingSuccess,
        listener: (context, state) {
          init(state.languages);
        },
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(Insets.s),
                    width: 32,
                    height: 4,
                    decoration: BoxDecoration(
                      color: context.color.chatBG,
                      borderRadius: BorderRadius.circular(48),
                    ),
                  ),
                ],
              ),
              if (state.status.isFetchingInProgress)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UiCircleProgressIndicator(
                        color: context.color.mainAccentColor,
                        secondaryColor: context.color.cardBGColor,
                      ),
                    ],
                  ),
                ),
              if (!state.status.isFetchingInProgress)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          Insets.l,
                          Insets.l,
                          Insets.l,
                          Insets.zero,
                        ),
                        child: UiTextField(
                          useShadow: false,
                          fillColor: context.color.cardBGColor,
                          hintText: LanguagesI18n.search,
                          formControl:
                              context.read<LanguagesCubit>().searchFormControl,
                          suffixIcon: Icon(
                            Icons.search,
                            color: context.color.chatBG,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.fromLTRB(
                            Insets.l,
                            Insets.xxl,
                            Insets.l,
                            Insets.l,
                          ),
                          children: controls.controls.mapIndexed((i, control) {
                            if (state.languages[i].name.toLowerCase().contains(
                                  state.searchValue?.toLowerCase() ?? '',
                                )) {
                              final bool isSystemLanguage =
                                  state.deviceLocale == state.languages[i].code;
                              return UiCheckboxField(
                                formControl: control as FormControl<bool>,
                                label: state.languages[i].name,
                                description: isSystemLanguage
                                    ? LanguagesI18n.systemLanguage
                                    : null,
                                readOnly: isSystemLanguage,
                              );
                            }

                            return const SizedBox();
                          }).toList(),
                        ),
                      ),
                      UiBottomSheet(
                        useShadow: false,
                        child: UiButton(
                          text: LanguagesI18n.confirm,
                          suffixIcon: UiIcon(Assets.icons.iCheck),
                          onPressed: () {
                            final result = <int>[];

                            controls.value?.forEachIndexed((index, element) {
                              if (element ?? false) {
                                result.add(state.languages.elementAt(index).id);
                              }
                            });

                            context.router.pop(result);
                          },
                          disabled: state.status.isFetchingInProgress,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
